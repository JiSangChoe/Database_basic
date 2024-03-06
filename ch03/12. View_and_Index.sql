USE practice_sql;

-- View: 논리적으로만 존재하는 읽기 전용의 가상의 테이블
-- 제한된 보기를 제공할 때, 특정 쿼리문(SELECT)을 미리 작성해두는 용도
CREATE VIEW employee_view AS 
SELECT
	E.employee_number AS employee_number, 
    # employee 테이블의 employee_number 열을 employee_view에서 employee_number라는 이름으로 사용하겠다는 의미
	E.name AS employee_name,
    D.code AS department_code,
    D.name AS department_name,
	D.tel_number AS department_tel_number
FROM employee AS E LEFT JOIN department AS D -- 그럼 FROM에서 별칭 E,D를 정의 안해주면 사용 못하는거?
ON E.department_code = D.code;

SELECT *FROM emloyee_view;
 # 기본 테이블이나 다른 뷰로부터 데이터를 가져오는 쿼리를 기반으로 하기 때문에 실제로 데이터가 물리적으로 저장되어 있지 않음
SELECT *FROM emloyee_view WHERE employee_name = '홍길동';

-- VIEW는 물리적으로 데이터 복사되는 것이 아니고 논리적으로 결과를 불러오는 것이기 때문에 VIEW 자체로
-- INSERT, UPDATE, DELETE가 불가능
INSERT INTO employee_view VALUES (10, '김길동', 'MM', '물류부', '010-1111-1114');

DROP VIEW employee_view;

-- 인덱스 (INDEX): 테이블에서 데이터를 빠르게 조회할 수 있도록 도와주는 요소

CREATE INDEX  department_tel_number_index
ON department (tel_number);

SELECT * FROM department WHERE tel_number = '010-1111-1111';

CREATE INDEX  department_index_1
ON department (name, tel_number);

SELECT * FROM department 
WHERE name = '인사부'
AND tel_number = '010-1111-1111'; -- 이 형태는 검색 속도가 빠르지 않디!

SELECT * FROM department 
WHERE tel_number = '010-1111-1111'
AND name = '인사부'; -- 속도가 안빠르데 -- 순서가 name, tel_number이기 때문에 좀 느리디!

DROP INDEX department_index_1 ON department;


