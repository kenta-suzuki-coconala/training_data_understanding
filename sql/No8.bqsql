--   [クローズ]2023/2のキャンセル率が5%以上の出品者ID、取引数、キャンセル数、キャンセル率
SELECT
  provider_id,
  SUM(sales_count) AS sales_cnt,
  SUM(total_cancelled) AS cancel_cnt,
  SUM(total_cancelled) / SUM(sales_count) AS cancel_rate
FROM
  data_warehouse.segmented_cancel_kpi_daily_latest
WHERE
  close_date BETWEEN '2023-02-01' AND '2023-02-28'
GROUP BY
  provider_id
HAVING
  cancel_rate >= 0.05;
