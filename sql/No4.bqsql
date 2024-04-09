--   [オープン]2022/12/1~2023/02/28の月別購入UU（新規・既存別で）
SELECT
  DATE_TRUNC(date, MONTH) AS month,
  new_buy_monthly,
  COUNT(DISTINCT user_id) AS uu_cnt
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2022-12-01' AND '2023-02-28'
  AND kind = 'paid'
  AND detail_type IN (1, 4, 5, 7, 99)
GROUP BY
  month,
  new_buy_monthly
ORDER BY
  month,
  new_buy_monthly;
