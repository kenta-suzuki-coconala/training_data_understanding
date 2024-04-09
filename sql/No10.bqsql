-- [オープン]2022/12/1の一人あたり購入金額・一人あたり購入件数
WITH agg AS (
  SELECT
    SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END) AS amount,
    SUM(CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN 1 WHEN kind = 'cancelled' AND detail_type NOT IN (2, 3) THEN -1 END) AS sales_count,
    COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN unified_user_id END) AS uu
  FROM
    data_warehouse.segmented_payment_kpi_daily_latest
  WHERE
    date = '2022-12-01'
    AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
)

SELECT
  sales_count / uu AS sales_cnt_per_paid_user,
  amount / uu AS ARPPU
FROM
  agg;
