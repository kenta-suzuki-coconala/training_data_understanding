-- 2023/2に退会したユーザー
SELECT
  COUNT(
    DISTINCT quit_users.user_id
  ) AS quit_user_count
FROM
  coconala.quit_users AS quit_users
LEFT JOIN master.except_users AS except_users
  ON quit_users.user_id = except_users.user_id
WHERE
  quit_users.created BETWEEN '2023-02-01' AND '2023-02-28'
  AND except_users.user_id IS NULL; -- ココナラのサービス側で除いたユーザは対象外とする
