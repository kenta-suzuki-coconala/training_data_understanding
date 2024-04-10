-- 2022年4月におけるサービスID = 1810820の閲覧数
SELECT COUNT(ip) AS view_count
FROM data_lake.user_action
WHERE
  local_date BETWEEN '2022-04-01' AND '2022-04-30'
  AND action = 'view_service'
  AND JSON_EXTRACT_SCALAR(detail, '$.service_id') = '1810820';
