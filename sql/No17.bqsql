-- 復習：何も見ないでトライして  2月の流通高
SELECT
  SUM(
    CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END
  ) AS amount
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2023-02-01' AND '2023-02-28'
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99);
