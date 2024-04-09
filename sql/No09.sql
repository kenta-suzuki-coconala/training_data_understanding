-- [オープン]2022/12の流通高TOP100の購入者ID、流通高、取引数
SELECT
  user_id,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END) AS amount,
  SUM(CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN 1 WHEN kind = 'cancelled' AND detail_type NOT IN (2, 3) THEN -1 END) AS sales_count
FROM
  dev_data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2022-12-01' AND '2022-12-31'
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
GROUP BY
  user_id
ORDER BY
  amount DESC
LIMIT 100;
