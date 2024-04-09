-- 2022年3月の主要カテゴリ別の流通高・取引数・取引単価・購入UU
SELECT
  main_category,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END) AS dist_amo,
  SUM(CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN 1 WHEN kind = 'cancelled' AND detail_type NOT IN (2, 3) THEN -1 END) AS sales_count,
  SUM(CASE WHEN kind = 'paid' THEN amount WHEN kind = 'cancelled' THEN -1 * amount END)
  / SUM(CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN 1 WHEN kind = 'cancelled' AND detail_type NOT IN (2, 3) THEN -1 END) AS sales_unit_price,
  COUNT(DISTINCT CASE WHEN kind = 'paid' AND detail_type NOT IN (2, 3) THEN user_id END) AS buyer_uu
FROM
  data_warehouse.segmented_payment_kpi_daily_latest
WHERE
  date BETWEEN '2022-03-01' AND '2022-03-31'
  AND detail_type IN (1, 2, 3, 4, 5, 7, 99)
GROUP BY
  main_category
ORDER BY
  main_category;
