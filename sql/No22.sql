-- 2022年6月のオープンKPI - 流通高・有料取引数・取引単価・購入uu・新規購入uu・既存購入uu
SELECT
  DATE_TRUNC(date, MONTH) AS month,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END) AS distribution_amount,
  SUM(CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN 1 WHEN kind = 'cancelled' AND detail_type NOT IN (2, 3) THEN -1 END) AS sales_count,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END)
  / SUM(CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN 1 WHEN kind = 'cancelled' AND detail_type NOT IN (2, 3) THEN -1 END) AS transaction_unit_price,
  COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN unified_user_id END) AS purchaser_uu,
  COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) AND new_buy_monthly = '1.新規' THEN unified_user_id END) AS new_purchaser_uu,
  COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) AND new_buy_monthly = '2.既存' THEN unified_user_id END) AS existing_purchaser_uu
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2022-06-01' AND '2022-06-30'
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
GROUP BY
  month;
