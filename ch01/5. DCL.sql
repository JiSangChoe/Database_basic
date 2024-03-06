USE practice_sql; -- 이 쿼리에서 데이터베이스를 사용하겠디

-- DCL (데이터 제어어)
-- 사용자에게 데이터베이스에 대한 권한 부여 및 회수할 때 사용

-- GRANT: 특정 사용자에게 특정 데이터베이스의 테이블에 대한 권한을 부여하는 명령어
-- GRANT 명령어 on 데이터베이스명.테이블명 TO 유저이름@접근위치
GRANT SELECT ON practice_sql.example_table TO 'developer'@'localhost';

-- REVOKE: 특정 사용자에게 특정 데이터베이스의 테이블에 대한 구너한을 회수하는 명령어
-- REVOKE 명령어 ON 데이터베이스명.테이블명 FROM 유저이름@접근위치
REVOKE SELECT ON practice_sql.example_table FROM 'developer'@'localhost';