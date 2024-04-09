--  [クローズ]2023/2のマッチング経路別のキャンセル率（件数）・キャンセル率（金額）
SELECT
  matching_kind,
  SUM(total_cancelled) / SUM(sales_count) AS cancel_rate_cnt,
  SUM(total_cancelled_amount) / SUM(total_sales_made_amount + total_cancelled_amount) AS cancel_rate_amo
FROM
  data_warehouse.segmented_cancel_kpi_daily_latest
WHERE
  close_date BETWEEN '2023-02-01' AND '2023-02-28'
GROUP BY
  matching_kind
ORDER BY
  matching_kind;
