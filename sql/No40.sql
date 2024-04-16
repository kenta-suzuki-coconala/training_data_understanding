-- 2023年2月にサービス経由で見積もりをしたユーザー数・提案したユーザー数
SELECT
  COUNT(DISTINCT request_user_id) AS request_user_count, -- 見積もりしたユーザ数
  COUNT(DISTINCT offer_user_id) AS offer_user_count -- 提案したユーザ数
FROM
  data_warehouse.job_requests_20240414
WHERE
  request_route = '2.見積もり_サービス経由'
  AND request_date BETWEEN '2023-02-01' AND '2023-02-28';
