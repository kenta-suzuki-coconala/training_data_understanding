-- 2023年2月の販売UU・新規販売UU・既存販売UU・一人あたり販売金額
SELECT
  COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN provider_id END) AS seller_uu,
  COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) AND new_sell_monthly = '1.新規' THEN provider_id END) AS new_seller_uu,
  COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) AND new_sell_monthly = '2.既存' THEN provider_id END) AS exist_seller_uu,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END)
  / COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN provider_id END) AS amount_per_seller
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2023-02-01' AND '2023-02-28'
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
  AND kind IN ('paid', 'cancelled');
