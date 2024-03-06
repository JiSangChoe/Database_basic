USE practice_sql;

-- -------------jeju table 에 추가-------------
ALTER TABLE jeju ADD above_avg_spd BOOLEAN;
ALTER TABLE jeju ADD above_avg_dir BOOLEAN;
ALTER TABLE jeju ADD null_column1 DOUBLE;
ALTER TABLE jeju ADD null_column2 DOUBLE;

UPDATE jeju
SET above_avg_spd = true
WHERE speed_80m > 5.5;  -- 40개

UPDATE jeju
SET above_avg_spd = false
WHERE speed_80m < 5.5; -- 52개

UPDATE jeju
SET above_avg_dir = true
WHERE direction_50m > 160;  

UPDATE jeju
SET above_avg_dir = false
WHERE direction_50m <= 160;   -- 이거 강사님꺼랑 비교해서 보기

UPDATE jeju
SET null_column1 = speed_80m
WHERE speed_80m > 5.5;

UPDATE jeju
SET null_column2 = direction_50m
WHERE direction_50m > 160;

-- 연산자
-- 산술연산자: +, -, *, /, %
SELECT speed_80m +speed_76m +speed_70m +speed_35m AS total_speed
FROM jeju; -- 92두개 반환
SELECT (speed_80m +speed_76m +speed_70m +speed_35m) /4 AS avg_speed
FROM jeju;

-- 비교연산자 (WHERE절에서 자주 사용)
-- =: 좌항이 우항과 같으면 true
SELECT * FROM jeju WHERE observe_date = '2023-07-05';

-- <>, != : 좌항이 우항과 다르면 true / jeju 92개반환해야하는데 91개 반환함
SELECT * FROM jeju WHERE observe_date <> '2023-07-05';
SELECT * FROM jeju WHERE observe_date != '2023-07-05';

-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
SELECT * FROM jeju WHERE speed_80m < 3.5;  -- 15개 반환
SELECT * FROM jeju WHERE speed_80m <= 3.5; -- 15개 반환

-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true
SELECT * FROM jeju WHERE speed_80m > 3.5;  -- 77개 반환
SELECT * FROM jeju WHERE speed_80m >= 3.5;  -- 77개 반환

-- <=> : 좌항과 우항이 모두 null이면 true
SELECT * FROM jeju WHERE null_column1 <=> null_column2;

-- IS : 좌항이 우항과 같으면 true (키워드)
-- IS NOT : 좌항이 우항과 다르면 true (키워드)
SELECT * FROM jeju WHERE above_avg_spd IS TRUE;
SELECT * FROM jeju WHERE above_avg_dir IS NOT FALSE;

-- IS NULL : 좌항이 NULL이면 true
-- IS NOT NULL : 좌항이 NULL이 아니면 true
SELECT *FROM jeju WHERE null_column1 IS NULL;
SELECT *FROM jeju WHERE null_column1 IS NOT NULL;

-- BETWEEN min AND max : 좌항이 min보다 크거간 같으면서 max보다 작거나 같으면 true
-- NOT BETWEEN min AND max : 좌항이 min 보다 작거나 max 보다 크면 true 
SELECT *FROM jeju WHERE direction_50m BETWEEN 270 AND 360; -- 북서풍이디
SELECT *FROM jeju WHERE direction_50m NOT BETWEEN 270 AND 360; -- 북서풍이아니디

-- IN() : 주어진 값중에 하나라도 일치하는 값이 존재하면 true 
-- NOT IN() : 주어진 값 들이 모두 일치하지 않으면 true
SELECT *FROM jeju WHERE observe_date IN 
('2023-07-01', '2023-08-01','2023-09-01', '2023-10-01',
'2023-11-01', '2023-12-01');  -- 3개나온디
SELECT *FROM jeju WHERE observe_date NOT IN 
('2023-07-01', '2023-08-01','2023-09-01', '2023-10-01',
'2023-11-01', '2023-12-01'); -- 자료중에서 나머지 나온디 89개디

-- 논리 연산자
-- AND (&&): 좌항과 우항이 모두 true면 true
SELECT * FROM jeju WHERE speed_80m > 4 AND direction_50m < 180; -- 40개
-- OR (||) : 좌항과 우항중 하나라도 true이면 true
SELECT * FROM jeju WHERE speed_80m > 4 OR direction_50m < 180;  -- 85개
-- XOR : 좌항과 우항이 다르면 true 
SELECT * FROM jeju WHERE speed_80m > 4 XOR direction_50m < 180; -- 43개 교집합 뺀거디

-- LIKE 연산자: 문자열을 비교할 때 패턴을 기준으로 비교

-- % : 임의의 개수 (0 ~ 무한대)의 문자
-- _ : 임의의 한 개 문자
SELECT * FROM jeju WHERE observe_date LIKE '20%'; -- 20으로 시작하는 문자열
SELECT * FROM jeju WHERE observe_date LIKE '%08'; -- 08로 끝나는 문자열
SELECT * FROM jeju WHERE observe_date LIKE '%08%'; -- 08월과 08로 끝나는 문자열
SELECT *FROM jeju WHERE observe_date LIKE '20_'; -- 20으로 시작하는 3세자리 문자열
SELECT *FROM jeju WHERE observe_date LIKE '2023-__-08'; 
 -- _가 두개 들어갔으니 고정된 2023과 08을 포함한 두개의 문자열 찾는거 3개나옴

-- 정렬
-- ORDER BY: 쿼리 결과 기준으로 정렬
-- ASC : 오름차순 정렬
-- DESC : 내림차순 정렬
SELECT * FROM jeju ORDER BY speed_80m ASC;   
SELECT * FROM jeju ORDER BY speed_80m DESC;
SELECT observe_date FROM jeju ORDER BY speed_80m DESC;

-- 중복제거
-- DISTINCT: SELECT 결과에서 컬럼의 조합의 중복을 제거하여 출력
SELECT DISTINCT above_avg_spd FROM jeju;
SELECT DISTINCT above_avg_spd, above_avg_dir FROM jeju;





