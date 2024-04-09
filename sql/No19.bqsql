-- 復習：何も見ないでトライして  2月の購入UU
SELECT
  COUNT(
    DISTINCT user_id
  ) AS purchase_uu
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2023-02-01' AND '2023-02-28'
  AND detail_type IN (1, 4, 5, 7, 99)
  AND kind = 'paid';
