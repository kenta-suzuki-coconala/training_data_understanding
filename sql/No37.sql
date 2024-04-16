-- 2023年2月に相談とビジネス制作にどちらでも販売実績のある出品者一覧
SELECT
  provider_id,
  SUM(CASE WHEN main_category = '3.ビジネス・制作' THEN 1 END) AS seisaku_cnt,
  SUM(CASE WHEN main_category = '5.相談' THEN 1 END) AS soudan_cnt
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  kind IN ('paid')
  AND date BETWEEN '2023-02-01' AND '2023-02-28'
  AND detail_type IN (1, 4, 5, 7, 99)
GROUP BY
  provider_id
HAVING
  seisaku_cnt > 0
  AND soudan_cnt > 0
ORDER BY
  provider_id;
