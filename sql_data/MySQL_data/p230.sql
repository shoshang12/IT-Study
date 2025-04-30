-- 230

USE sqldb;
SELECT userid AS '사용자', SUM(price*amount) AS '총구매액'
  FROM buyTBL GROUP BY userid;
  
  SELECT * FROM abc ORDER BY 총구매액 DESC;
  
  WITH abc(userid, total)
AS
(SELECT userid, SUM(price*amount)
   FROM buytbl GROUP BY userid )
SELECT * FROM abc ORDER BY total DESC;

SELECT addr, MAX(height) FROM usertbl GROUP BY addr;

WITH cte_userTBL(addr, maxHeight)
AS
( SELECT addr, MAX(height) FROM usertbl GROUP BY addr)

WITH cte_usertbl(addr, maxHeight)
AS
( SELECT addr, MAX(height) FROM usertbl GROUP BY addr)
SELECT AVG(maxHeight*1.0) AS '각 지역별 최고 키의 평균' FROM cte_usertbl;