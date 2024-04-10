-- 2022年6月におけるキーワード検索数TOP10を出す
SELECT
  JSON_EXTRACT_SCALAR(detail, '$.keyword') AS search_keyword,
  COUNT(JSON_EXTRACT_SCALAR(detail, '$.keyword')) AS count
FROM
  data_lake.user_action
WHERE
  local_date BETWEEN '2022-06-01' AND '2022-06-30'
  AND action = 'view_service_search'
  AND JSON_EXTRACT_SCALAR(detail, '$.keyword') IS NOT NULL
GROUP BY
  search_keyword
ORDER BY
  count DESC
LIMIT 10;
