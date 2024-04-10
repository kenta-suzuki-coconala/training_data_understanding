-- 2023年2月の主要カテゴリ別の、クローズ取引数・クローズ流通高・キャンセル数・キャンセル率・キャンセル金額
SELECT
  main_category,
  SUM(completed_delivery_count) AS sales_count,
  SUM(total_sales_made_amount) AS distribution_amount,
  SUM(total_cancelled) AS cancel_count,
  SUM(total_cancelled) / SUM(completed_delivery_count) AS cancel_rate_count,
  SUM(total_cancelled_amount) AS cancel_amount,
  SUM(total_cancelled_amount) / SUM(total_opened_amount) AS cancel_rate_amount
FROM
  data_warehouse.segmented_cancel_kpi_daily_latest
WHERE
  close_date BETWEEN '2023-02-01' AND '2023-02-28'
GROUP BY
  main_category
ORDER BY
  main_category;

-- SELECT
--   main_category,
--   SUM(CASE WHEN kind = 'sales_made' AND detail_type NOT IN (2, 3) THEN 1 END) AS sales_count,
--   SUM(CASE WHEN kind = 'sales_made' THEN amount END) AS distribution_amount,
--   SUM(CASE WHEN detail_type NOT IN (2, 3) AND kind = 'cancelled' THEN 1 ELSE 0 END) AS cancel_count,
--   SUM(CASE WHEN detail_type NOT IN (2, 3) AND kind = 'cancelled' THEN 1 ELSE 0 END)
--   / SUM(CASE WHEN kind = 'sales_made' AND detail_type NOT IN (2, 3) THEN 1 END) AS cancel_rate_count,
--   SUM(CASE WHEN kind = 'cancelled' THEN amount ELSE 0 END) AS cancel_amount,
--   SUM(CASE WHEN kind = 'cancelled' THEN amount ELSE 0 END)
--   / SUM(CASE WHEN kind = 'paid' THEN amount END) AS cancel_rate_amount
-- FROM
--   data_warehouse.segmented_payment_kpi_daily_latest
-- WHERE
--   date BETWEEN '2023-02-01' AND '2023-02-28'
--   AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
-- GROUP BY
--   main_category
-- ORDER BY
--   main_category;
