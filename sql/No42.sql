-- ココナラビジネスの2023/3のオープン流通高
SELECT
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END) AS amount
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  kind IN ('paid', 'cancelled')
  AND is_enterprise_ordering = TRUE --ココナラビジネスでの購入であることを絞る
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
  AND date BETWEEN '2023-03-01' AND '2023-03-31';
