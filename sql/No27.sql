-- 2023年3月14日に公開されていたサービス数
SELECT COUNT(DISTINCT id) AS service_count
FROM coconala.services
WHERE
  DATE(opened_date) = '2023-03-14'
  AND opened = 1;
