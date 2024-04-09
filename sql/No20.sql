-- 復習：何も見ないでトライして  2月のキャンセル率
SELECT
  SUM(total_cancelled) / SUM(sales_count) AS cancel_rate_count,
  SUM(total_cancelled_amount) / SUM(total_sales_made_amount + total_cancelled_amount) AS cancel_rate_amount
FROM
  data_warehouse.segmented_cancel_kpi_daily_latest
WHERE
  close_date BETWEEN '2023-02-01' AND '2023-02-28';
