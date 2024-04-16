-- 2023年2月の流通高が2023年1月より伸びている出品者一覧（両月ともに販売実績がある人に限る）
WITH have_sales_record AS ( -- 1, 2月に販売実績のある出品者に限定する
  SELECT
    provider_id,
    SUM(
      CASE
        WHEN kind = 'paid' AND date BETWEEN '2023-01-01' AND '2023-01-31' THEN amount
        WHEN kind = 'cancelled' AND date BETWEEN '2023-01-01' AND '2023-01-31' THEN -1 * amount
      END
    ) AS total_amount_jan,
    SUM(
      CASE
        WHEN kind = 'paid' AND date BETWEEN '2023-02-01' AND '2023-02-28' THEN amount
        WHEN kind = 'cancelled' AND date BETWEEN '2023-02-01' AND '2023-02-28' THEN -1 * amount
      END
    ) AS total_amount_feb
  FROM
    `data_warehouse.segmented_payment_kpi_daily_latest`
  WHERE
    date BETWEEN '2023-01-01' AND '2023-02-28'
    AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
    AND kind IN ('paid', 'cancelled')
  GROUP BY
    provider_id
  HAVING
    total_amount_jan > 0
    AND total_amount_feb > 0 -- 販売実績のある
    AND total_amount_feb > total_amount_jan
  ORDER BY
    provider_id
)

SELECT
  provider_id
FROM
  have_sales_record
ORDER BY
  provider_id;
