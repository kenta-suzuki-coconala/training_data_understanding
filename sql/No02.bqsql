--  [オープン]2022/12/1~2023/02/28の月別取引数
SELECT
  DATE_TRUNC(date, MONTH) AS month,
  SUM(CASE kind WHEN 'paid' THEN 1 WHEN 'cancelled' THEN -1 END) AS transacion_num
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2022-12-01' AND '2023-02-28'
  AND detail_type IN (1, 4, 5, 7, 99)
  AND amount > 0
GROUP BY
  month
ORDER BY
  month;
