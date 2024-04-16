-- 2022/1 ~ 2023/3 までの月次ARPPU推移
SELECT
  DATE_TRUNC(date, MONTH) AS month,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END)
  / COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN unified_user_id END) AS ARPPU
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2022-01-01' AND '2023-03-31'
  AND kind IN ('paid', 'cancelled')
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
GROUP BY
  month
ORDER BY
  month;
