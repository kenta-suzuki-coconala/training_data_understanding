-- [オープン]FY2023_1Qの新規購入UU
SELECT
  COUNT(DISTINCT unified_user_id) AS buy_uu
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  kind = 'paid'
  AND detail_type IN (1, 4, 5, 7, 99)
  AND fiscal_year_quarter = 'FY2023-1Q'
  AND new_buy_fiscal_year_quarter = '1.新規';
