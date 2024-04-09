--  [オープン]2022/12/1~2023/02/28の月別流通高
SELECT
  DATE_TRUNC(date, MONTH) AS month,
  SUM(CASE kind WHEN 'paid' THEN amount WHEN 'cancelled' THEN -1 * amount END) AS amount
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2022-12-01' AND '2023-02-28'
  AND kind IN ('paid', 'cancelled')
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
GROUP BY
  month
ORDER BY
  month;
