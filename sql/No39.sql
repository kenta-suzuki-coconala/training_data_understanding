-- 2023年2月に出品者HPを表示したユーザー数
SELECT
  COUNT(DISTINCT user_id) AS user_count
FROM
  data_lake.user_action
WHERE
  local_date BETWEEN '2023-02-01' AND '2023-02-28'
  AND action = 'view_profile_top';
