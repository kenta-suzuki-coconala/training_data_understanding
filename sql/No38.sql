-- 2023年1月に会員登録をしていて、2023年2月に購入実績がある人数と無い人数
WITH buy_history AS (
  SELECT
    user_id
  FROM
    data_warehouse.segmented_payment_kpi_daily_latest
  WHERE
    kind = 'paid'
    AND detail_type IN (1, 4, 5, 7, 99)
    AND date BETWEEN '2023-02-01' AND '2023-02-28'
  GROUP BY
    user_id
)

SELECT
  CASE
    WHEN buy_history.user_id IS NOT NULL THEN 'buy'
    WHEN buy_history.user_id IS NULL THEN 'not_buy'
  END AS buy_flg,
  COUNT(DISTINCT users.id) AS number_of_users
FROM
  coconala.users AS users
LEFT JOIN
  buy_history
  ON users.id = buy_history.user_id
WHERE
  users.created BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY
  buy_flg;
