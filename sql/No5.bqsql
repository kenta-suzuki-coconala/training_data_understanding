--  [オープン]2022/12/1~2022/12/31の間に会員登録したユーザーで、2023/2に購入したUU・取引数・流通高
SELECT
  COUNT(DISTINCT CASE WHEN kpi.kind = 'paid' AND kpi.detail_type NOT IN (2, 3) THEN kpi.user_id END) AS uu_cnt,
  SUM(
    CASE
      WHEN
        kpi.kind = 'paid'
        AND
        kpi.detail_type NOT IN (2, 3)
        THEN 1
      WHEN
        kpi.kind = 'cancelled'
        AND
        kpi.detail_type NOT IN (2, 3)
        THEN -1
    END
  ) AS transaction_num,
  SUM(CASE kpi.kind WHEN 'paid' THEN kpi.amount WHEN 'cancelled' THEN -1 * kpi.amount END) AS amount
FROM
  data_warehouse.segmented_payment_kpi_daily_latest AS kpi
INNER JOIN
  coconala.users AS users
  ON
    kpi.user_id = users.id
WHERE
  kpi.detail_type IN (1, 2, 3, 4, 5, 7, 99)
  AND kpi.date BETWEEN '2023-02-01' AND '2023-02-28'
  AND users.created BETWEEN '2022-12-01' AND '2022-12-31';
