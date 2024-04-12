-- 2023年2月に販売も購入もしているユーザーID一覧
WITH seller AS (
  SELECT DISTINCT
    provider_id
  FROM
    data_warehouse.segmented_payment_kpi_daily_latest
  WHERE
    kind IN ('paid', 'cancelled') -- オープンベース
    AND detail_type IN (1, 4, 5, 7, 99)
    AND date BETWEEN '2023-02-01' AND '2023-02-28'
)

SELECT DISTINCT kpi.user_id
FROM
  data_warehouse.segmented_payment_kpi_daily_latest AS kpi
INNER JOIN
  seller
  ON kpi.user_id = seller.provider_id
WHERE
  kpi.kind IN ('paid', 'cancelled') -- オープンベース
  AND kpi.detail_type IN (1, 4, 5, 7, 99)
  AND kpi.date BETWEEN '2023-02-01' AND '2023-02-28'
ORDER BY
  kpi.user_id;
