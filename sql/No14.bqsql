-- 2023/2にキーワード検索を行ったユーザー数（未会員は除く）
SELECT
  COUNT(
    DISTINCT user_id
  )
FROM
  data_lake.user_action
WHERE
  local_date BETWEEN '2023-02-01' AND '2023-02-28'
  AND action = 'view_service_search'
  AND user_id IS NOT NULL -- 未会員を除く
  AND JSON_EXTRACT_SCALAR(detail, '$.keyword') IS NOT NULL;
