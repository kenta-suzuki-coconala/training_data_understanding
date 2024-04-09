-- [クローズ]2023/2のキャンセル理由別キャンセル数・キャンセル金額
SELECT
  subdivision_cancel_reason,
  SUM(total_cancelled) AS cancel_sales_count,
  SUM(total_cancelled_amount) AS cancel_amount
FROM
  data_warehouse.segmented_cancel_kpi_daily_latest
WHERE
  close_date BETWEEN '2023-02-01' AND '2023-02-28'
  AND subdivision_cancel_reason IS NOT NULL
GROUP BY
  subdivision_cancel_reason
ORDER BY
  subdivision_cancel_reason;
