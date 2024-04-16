--  [オープン]2023/1/29 ~ 2023/2/25の流通高・取引数を週次で（日曜はじまり）
SELECT
  DATE_TRUNC(date, WEEK (SUNDAY)) AS weekly,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END) AS amount,
  SUM(CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN 1 WHEN kind = 'cancelled' AND detail_type NOT IN (2, 3) THEN -1 END) AS transaction_num
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2023-01-29' AND '2023-02-25'
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
  AND kind IN ('paid', 'cancelled')
GROUP BY
  weekly
ORDER BY
  weekly;
