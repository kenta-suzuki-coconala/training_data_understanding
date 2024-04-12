-- 2023年1月に会員登録をして、2023年2月に初めて購入した会員ID一覧
WITH signup_user_at_202301 AS (
  SELECT
    id,
    MIN(created) AS signup_date
  FROM
    coconala.users
  GROUP BY
    id
  HAVING
    signup_date BETWEEN '2023-01-01' AND '2023-01-31'
)

SELECT DISTINCT
  kpi.user_id,
  signup_user.signup_date,
  kpi.new_date
FROM
  data_warehouse.segmented_payment_kpi_daily_latest AS kpi
INNER JOIN
  signup_user_at_202301 AS signup_user
  ON
    kpi.user_id = signup_user.id
WHERE
  kpi.new_date BETWEEN '2023-02-01' AND '2023-02-28'
  AND kpi.detail_type IN (1, 4, 5, 7, 99)
  AND kpi.kind = 'paid'
ORDER BY
  kpi.user_id;
