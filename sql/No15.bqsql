-- 2023/2にサービスページ経由の見積もりを行ったユーザー数
SELECT
  COUNT(
    DISTINCT request_user_id
  ) AS user_num_request_from_service_page
FROM
  data_warehouse.job_requests_20240407
WHERE
  request_date BETWEEN '2023-02-01' AND '2023-02-28'
  AND request_route = '2.見積もり_サービス経由';
