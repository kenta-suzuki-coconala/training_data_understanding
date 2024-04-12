-- 2023年2月にテキスト占い出品者の中で、キャンセル率が10%を超える出品者ID一覧
SELECT
  provider_id,
  SUM(total_cancelled) / SUM(sales_count) AS cancel_rate
FROM
  data_warehouse.segmented_cancel_kpi_daily_latest
WHERE
  main_category = '1.テキスト占い'
  AND close_date BETWEEN '2023-02-01' AND '2023-02-28'
GROUP BY
  provider_id
HAVING
  cancel_rate > 0.1
ORDER BY
  provider_id;
