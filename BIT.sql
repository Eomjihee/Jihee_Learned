/*
실습환경 구성하기

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/

select*from emp;
select*from dept;
select*from salgrade;



--사원 테이블에서 모든 데이터를 출력하세요 (대소문자 상관없다.)
select*FROM emp; --쿼리문장은 대소문자 구별 안한다.

/*

1.2 Syntax
SELECT [DISTINCT] {*, column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
DISTINCT 중복 행 제거 옵션
* 테이블의 모든 column 출력
alias 해당 column 에 대한 다른 이름 부여
table_name 테이블명 질의 대상 테이블 이름
WHERE 조건을 만족하는 행들만 검색
condition column, 표현식, 상수 및 비교 연산자
ORDER BY 질의 결과 정렬을 위한 옵션(ASC:오름차순(Default),DESC 내림차순)

*/

--2.특정 컬럼 데이터 출력하기
SELECT empno, ename, sal from emp;
SELECT ename from emp;

--3.컬럼에 가명칭(별칭, 닉네임, alias)부여하기
    SELECT empno as "  사   번   ", ename as "  이   름   "
from emp; --엔터를 쳐도 상관 없다. ;가 문장을 끝내는 표식.
--기본적으로 alias name에는 ""를 붙인다. 그러면 하나의 문자열임을 인지한다. 정식 문법은 아님(as가 빠진것이 비정식).

--정식(표준) (ansi 문법) : SELECT empno as "  사   번   ", ename as "  이   름   "

--Oracle 데이터 관리 (문자열 : 엄격하게 대소문자 구분)
--문자열의 표기('문자열')
--소문자 'a' 와 대문자 'A'는 다른 문자열이다.

SELECT empno, ename
from emp
where ename = 'KING';
--emp table에서 ename이 king인 사람의 empno와 ename을 보여줘라

--Oracle SQL 언어 : 연산자(결합 연산자(||), 산술 연산자(+)) 구분
--java의 + (숫자 + 숫자 >> 연산)
--java의 + (문자열 + 문자열 >> 결합)
--TIP) ms-sql에서는 (+가 연산과 결합 기능을 모두 가지고 있다)

select '사원의 이름은'||ename||'입니다' as"사원정보" 
from emp;

--empno, ename >> 컬럼 >> 타입
--타입 (자료형) : 숫자, 문자(문자열), 날짜

--table의 기본 정보 출력(컬럼명, null값 허용하는지, 타입정보)
desc emp;
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) @@여기부분 설명 놓침
JOB               VARCHAR2(9)  : 자바의 문자열
MGR               NUMBER       
HIREDATE          DATE   : 자바의 날짜      
SAL               NUMBER : 자바의 숫자      
COMM              NUMBER       
DEPTNO            NUMBER  
*/

select empno||ename
from emp; -- empno가 가진 데이터와 ename이 가진 데이터를 결합하겠다.
--(숫자타입과 문자열이 결합됨) > 내부적으로 숫자타입이 문자열로 바뀌어서 결합됨

select empno + ename -- 오류발생. 오라클에서 +는 산술연산에 사용됨
from emp; 
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

--우리 회사의 직종의 개수 구하기
SELECT job from emp; -- 이렇게 보여주면 모든 사원들의 직종이 나열되기만 한다 중복 제거 안됨

SELECT DISTINCT job from emp; -- distinct : 중복데이터를 제거하는 키워드

SELECT DISTINCT job, deptno from emp ORDER by job;
--직종별로 deptno가 중복되지 않도록 나열한 데이터
--distinct의 원리는 그룹핑이다. 일단 같은 것 끼리 그룹을 잡는다. 
--일단 job으로 그룹을 묶고 그 안에서 deptno를 기준으로 다시 그룹을 묶어서 나온 결과.
--distinct : grouping의 논리로 데이터를 처리한다.

select DISTINCT job, deptno from emp order by job;
select distinct deptno, job from emp order by deptno;

--Oracle 언어
--Java 언어
--Oracle 연산자가 Java와 거의 동일(+, *, - ...)
--% 자바에서는 나머지, % 오라클에서는 검색패턴 연산자이다.

--오라클의 연산자(+, -, *, /) 나머지함수 >> Mod()

--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요
select empno, sal, sal+100 as "인상급여" from emp;
--sal의 data가 숫자타입이기 때문에 연산이 가능함.


--dual 임시테이블
select 100 + 100 from dual; --dual이라는 가상공간(임시테이블)에 담아서 출력한다.
select 100 || 100 from dual; --내부적으로 형변환이 일어나서  문자열 || 문자열 의 결과가 나온다.
select '100' + 100 from dual; -- +는 무조건 산술연산자. 따라서 산술이 가능한 형태로 형변환을 시킨다.
select '100A' + 100 from dual; -- 이건 에러나는 코드. 100A는 문자열이다.

--비교연산자
-- > < <=
--java의 같다 (==) 할당(=)
--Oracle은 할당이 없다. 따라서 같다(=), 같지 않다(!=).

--논리연산자
--AND, OR, NOT


--조건절(원하는 row만 가져오겠다.)
select*
from emp
where sal >= 3000; -- 사원테이블에서 급여가 3000달러 이상인 모든 직원을 출력해라

select empno, ename, sal
from emp
where sal > 3000; --데이터베이스에서는 에러가 잘 발생하지 않는다.


--이상, 이하 (= 포함)
--초과, 미만 (= 포함하지 않음) : 현업에서 이 단어들을 제대로 구분해서 말하지 않는다.
--따라서 그 내용을 확실히 해야한다.

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요
--SELECT*
--from emp
--where empno = 7788; 이렇게 먼저 출력해서 입사일의 컬럼명이 뭔지 확인한다.

select empno, ename, job, hiredate
from emp
where empno=7788;
--실행순서 :  from(가져오기) > where(거르기) > select(원하는 정보 뽑아내기)

--DB의 4가지 직종 관리자, 개발자, 
--튜닝(고임금. 연차가 많이 쌓여야한다. 단순 공부로는 할 수 없고 많은 경험이 필요하다. 문제의 원인이 무엇인지 파악해야한다.), 
--설계(고임금)


--사원의 이름이 king인 사원의 사번, 이름, 급여 정보를 출력하세요
select empno, ename, sal
from emp
where ename = 'KING'; -- 데이터타입이 날짜 또는 문자인 경우에는 ''를 붙인다.


--논리(AND, OR)
--급여가 2000달러 이상이면서 직종이 manager인 사원의 모든 정보를 출력하시오.

select*
from emp
where sal >= 2000 AND job = 'MANAGER'; --manager라고 하면 안나옴. 대소문자 구분.

--급여가 2000 달러 이거나 직종이 manager인 사원의 모든 정보를 출력하시오.
select*
from emp
where sal >= 2000 OR job = 'MANAGER';


--오라클 날짜(DB server의 날짜)
--오라클 날짜 함수 (sysdate)
select sysdate from dual; -- 날짜 포맷은 보는사람이 언제든 바꿀 수 있다.



--현재 접속한 사용자가 날짜 형식을 'YYYY-MM-DD HH24:MI:SS'이렇게 보도록 수정하겠다.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select* from SYS.nls_session_parameters; --system 설정을 가지고 있는 환경 table
--NLS_DATE_FORMAT	YYYY/MM/DD 기본설정
--NLS_LANGUAGE	KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select sysdate from dual; --2020-03-31 14:37:56
--접속을 끊었다 다시 들어오면 원래 형식으로 복구된다.

select hiredate from emp;


--입사일이 1980년 12월 17일인 사원의 모든 정보를 출력하시오.

select*
from emp
where hiredate = '1980-12-17';

select*
from emp
where hiredate = '80/12/17';
--형식을 RR-MM-DD 에서 YYYY-MM-DD로 바꿨기 때문이 이전형태의 자료는 검색할 수 없다.


--사원의 급여가 2000달러 이상이고 4000달러 이하인 모든 사원의 정보를 출력하시오

select*
from emp
where sal >= 2000 AND sal <= 4000;

--연산자 : between A and B(주의사항 : =를 포함하고 있다. 미만, 초과에서는 사용금지)
select*
from emp
where sal between 2000 and 4000;

--사원의 급여가 2000달러 초과이고 4000달러 미만인 모든 사원의 정보를 출력하시오
select*
from emp
where sal > 2000 AND sal < 4000;


--부서 번호가 10 또는 20 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하시오

 select empno, ename, sal, deptno
 from emp
 where deptno = 10 or deptno = 20 or deptno = 30; -- 무식한 방법
 
 --in 연산자
 select empno, ename, sal, deptno
 from emp
 where deptno in (10,20,30); -- 이렇게 쓰더라도 툴이 위의 내용처럼 풀어서 작동시킴
 --in 연산자를 풀어쓰세요
  select empno, ename, sal, deptno
 from emp
 where deptno = 10 or deptno = 20 or deptno = 30; 


--부서번호가 10또는 20이 아닌 사원의 사번, 이름, 급여, 부서번호 출력

select empno, ename, sal, deptno
from emp
where deptno != 10 AND deptno != 20;

--IN의 부정은  NOT IN(부정값의 and)
select empno, ename, sal, deptno
from emp
where deptno not in (10, 20);


--POINT : Oracle 값 표현 (데이터가 없다 = null)
--null 필요악

create table member( --멤버라는 이름의 클래스를 만든 것과 똑같은 작업
    userid varchar2(20) not null, -- 20이란 숫자는 byte 20byte까지 올 수 있다. not null > 필수입력 
    name varchar2(20) not null, --필수입력
    hobby varchar2(50) -- default로 null이 붙는다(null값을 허락하겠다, 데이터를 받지 않아도 된다.)
    
    );

select* from member;
--insert into member(userid, hobby) values('hong','잠자기');
insert into member(userid, name) values ('hong','졸려');
--hobby 컬럼의 데이터는 자동 null

insert into member(userid, name, hobby) values ('hong','졸려','잠자기');
--컬럼명을 생략할 수 있는데, 그럼 입력값이 컬럼 순서대로 들어간다. 그리고 하나라도 없으면 들어가지 않는다.

--실반영 해야 데이터가 영속적으로 남는다. 
--실반영 하지 않으면 프로그램을 껐다 키면 사라진다. 혹은 다른사람은 볼 수 없다.
commit;

--수당을 받지 않는 모든 사원의 정보를 출력하세요
--0도 데이터로 취급한다 (받는 조건에 포함)
--select*
--from emp
--where comm = null; --이 방식은 없는 문법 이래서 null이 더럽다.. null은 문법이 다르다

select* from emp where comm is null; --null의 비교는 is null/is not null로 해야한다.

--수당을 받는 모든 사원의 정보를 출력하세요
select* from emp where comm is not null;

--사번 테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요
--총급여 (급여+수당)

select empno, ename, sal, comm, sal+comm as "총급여"
from emp; --null 때문에 총급여가 제대로 나오지 않는다.

--@@@@@@@@@@@@POINT >> null
--1.null과의 모든 연산은 그 결과가 null이다.
--2.위 문제 해결 : nvl(), nvl2() >> null값을 다른 값으로 바꿔주는 함수, replace하는 함수
--Tip) ms-sql : convert()
--      my-sql : IFNULL()

select null + 100 from dual;
select '졸려'||null from dual; -- 이건 결합이기 때문에  null의  의미가 없다.
select 100 + nvl(null,0) from dual;

select comm, nvl(comm, 1111) from emp;

select empno, ename, sal, comm, nvl(comm,0) + sal as "총급여" --nvl()이 들어가는 위치 주의하기
from emp;

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하시오

select empno, ename, job, sal, comm
from emp
where sal >= 1000 AND comm is null; -- nvl2()는 조건을 하나 더 거는 것이다.

----------------------기본 완료------------------------------------------------------

--DQL(data query language) : select     (60%)
--DDL : create, alter, drop(객체(테이블) 생성, 수정, 삭제)     (30%)
--DML : insert, update, delete(데이터 조작)      (10%)
--이거 세가지 배우면 끝난다.

--java : class Board { private boardno int }
--Oracle : create table Board (boardno number not null)

create table board( --테이블안에는 컬럼명, 타입이 들어간다
    boardid number not null, --숫자, 필수입력
    title varchar2(20) not null, --한글 10자, 영문자, 특수문자, 공백 20자 필수 (툴마다 한글을 3byte잡는게 있어서 확인해야한다.)
    content varchar2(2000) not null, -- 필수입력 ( 파일은 DB에 올라가지 않고 웹하드에 올린 후 경로만 가져온다)
    hp varchar2(20) --default로 null허용(필수입력이 아니다)
);

select*from board;
--desc board;


--DML(데이터 조작어) 실 반영 여부를 결정
--insert
--update
--delete
--이런 작업을 하면 반드시 그 결과를 반영할지 취소할지를 결정해야한다.
--이러한 의사결정이 바로 commit(실제 반영)과 rollback(반영 취소)이다.

insert into board(boardid, title, content)
values(100,'오라클','즐거운 오라클');
insert into board(boardid, title, content)
values(200,'자바','복습하자');

commit;

select*from board;

rollback; -- commit하기 전 까지의 data 삽입, 업데이트, 삭제를 되돌리는 기능

insert into board(boardid, title, content)
values(200,'자바','그립다');

drop table board;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual;


insert into board(boardid, title, content,hp)
values(300,'오늘','수업중','010-0000-0000');

select*from board;

commit;

select boardid, nvl(hp,'empty') as "hp" from board; -- hp컬럼에서 null값을 만나면 empty라고 출력해라

--문자열 검색
--주소검색 : [역] 입력 >> 역삼동, 역동, 등등이 다 나옴.(Like 패턴 검색)
--문자열 패턴 검색 연산자 : like
--like 연산자 도움(와일드카드 문자(% : 모든 것, _ : 한문자)를 결합)

select ename
from emp
where ename like '%A%'; --ename의 data중에 A를 포함하는 모든 사원 검색.


select ename 
from emp where ename like '%a'; -- 문자열 검색에서도 대소문자를 구분한다
--(오라클은 문자열 데이터에 대하여 엄격하게 대소문자를 구분한다.)

select ename
from emp where ename like 'A%';

select ename
from emp where ename like '%S';



select ename
from emp where ename like '%LL%'; -- LL 붙어있어야 함

select ename
from emp where ename like '%L%L%'; -- L 2개 있으면 ok

select ename
from emp where ename like '%A%A%';

select ename
from emp where ename like '_A%'; --첫 글자는 어떤 것이 와도 상관없고, 두번째 글자는 반드시 A, A 뒤로는 아무거나 와도 됨.
--A라는 글자의 자릿수를 잡아준 것. /  _ : 한문자


--정규표현식 (java, db, script에서 모두 사용됨)
--regexp_like
select * from emp where REGEXP_LIKE(ename,'[A-C]'); --이렇게 정규표현식을 넣으면 상세한 검색이 가능하다.
--정규표현 예제 5개 만들기 (추후 과제 공지 예정, 아직 하지 말기)

-------------------------------------------------------------------------------

--데이터 정렬하기
--order by 컬럼명 : 문자열, 숫자, 날짜 정렬가능
--오름차순 : asc : 낮은순(사전순서) (default)
--내림차순 : desc : 높은순

select * from emp
order by sal asc; -- sal을 기준으로 asc로 정렬, asc를 생략하면 default로 정렬된다.

--급여를 많이 받는 순으로 정렬해서 출력
select * from emp order by sal desc;


--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일 데이터를 출력하기
select empno, ename, sal, hiredate
from emp
order by hiredate desc;
/*
select      3
from        1
where       2
order by    4

DB가 가장 싫어하는 작업이 정렬작업.
select한 결과를 정렬하는 것이 훨씬 효율적이다.
정렬할 대상을 최소한으로 줄여준 다음에 정렬한다.
3번까지 먼저 실행해보고 문제가 없다면 order by를 추가하면 된다. 디버깅하기가 수월해짐
*/

select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;
--emp테이블에서 직종이 매니저인 직원의 사번, 이름, 연봉, 직종, 입사일을 뽑아 입사일이 최근인 기준으로 정렬하시오.

--order by 컬럼명 desc, 컬럼명 asc, 컬럼명 desc
select job, deptno
from emp
order by job asc, deptno desc; --걸러낼 조건이 없다면 where절은 생략 가능
-- emp테이블에서 직종과 부서번호를 뽑아 직종 기준으로 내림차순 정렬한 후, 같은 직종이면 부서번호를 기준으로 다시 오름차순 정렬하시오.
--grouping 원리. grouping을 한 후 그 그룹 안에서 다시 정렬해준다.
--위와 같은 코드엄청 많이 씀.

---------------------------------------------------------------------------------------

--연산자
--합집합(union) : 테이블과 데이블의 데이터를 합치는 것 (기본 : 중복값 배제)
--합집합(union all) : 테이블과 데이블의 데이터를 합치는 것 (중복값 허용)


create table uta (name varchar2(20));
insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');

commit;

select * from uta;


create table ut (name varchar2(20));
insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');

commit;

----------------------------union
select* from ut
union
select* from uta;


select* from ut
union all
select* from uta;

--union 규칙
--1. 대응되는 컬럼의 타입이 동일해야한다.

select empno, ename from emp
union
select dname, deptno from dept; -- 먼저 쓴게 기다리고 있는 것. 뒤에 쓴게 놀러가는 것.
--에러 발생 코드. "expression must have same datatype as corresponding expression"
--deptno는 숫자형인데 문자형인 ename의 자리에 들어가려고 해서 발생한 문제

select empno, ename from emp
union
select deptno, dname from dept;
--이렇게 바꿔주면 empno,deptno가 짝, ename,dname이 짝이 돼서 오류없이 실행된다.

--2.대응되는 컬럼의 개수가 동일(null이 도와줄 수 있다!)
select empno, ename, job, sal from emp
union
select deptno, dname, loc, null from dept; --dept의 컬럼이 3개 뿐인데 방을 4개 준비해놓으면 에러가 발생

--실무에서는 subquery를 사용한다. (in line view)
select*
from (
    select empno, ename, job, sal from emp
    union
    select deptno, dname, loc, null from dept
    ) order by empno desc;
--가상테이블(소괄호)을 만들어서 사용하면 그 뒤에 order by 를 붙여 쓸 수 있다. union된 결과를 가지고 논다.

------------------------------------------여기까지가 초보 걸음마(의무교육) 테이블 한개(단일 테이블)--------

--지금부터 오라클의 함수를 배울 것이다.
/*
 단일 행 함수의 종류 
 1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다. 
 -2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다. 
 3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다. 
 4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. (to_char(), to_number(), to_date())
 5) 일반적인 함수 : NVL, DECODE 
*/
/*
한글 문제. 추후 변경도 가능. 지금 안함
select * from SYS.nls_database_parameters;
--NLS_CHARACTERSET   AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from SYS.nls_database_parameters where parameter like '%CHAR%';    
*/

--문자열 함수
select initcap('the super man') from dual; -- 영문 단어 첫글자 대문자로 변환

select lower('AAA'), upper('aaa') from dual; -- 영문 대문자를 소문자로 소문자를 대문자로 변환
select ename, lower(ename) as "ename" from emp; -- 컬럼에 적용하기
select* from emp where lower(ename) = 'king'; -- 컬럼 내용을 소문자로 바꿔서 검색하기

--문자열 개수
select length('abcd') from dual; -- 4개
select length('히비스커스') from dual; -- 5개 > 한글도 적용가능
select length(' 맛m 있 다') from dual; -- 공백도 1자로 인식한다.

--결합 연산자 ||
--결합 함수 : concat()
select 'a' || 'b' || 'c' as "data" from dual; --연산자를 사용한 결합
select concat('a','b','c') from dual;--"invalid number of arguments" parameter 2개만 입력 가능.
--결합 연산자가 더 유연하다.
select concat(ename, job)as "concat" from emp;--결합함수
select ename || ' : ' || job as "||" from emp;--결합연산자는 parameter의 제한이 없어서 중간에 공백이나 다른 문자를 넣을 수 있다.

--부분 문자열 추출
--java(substring)
--Oracle(substr) >> java와 규칙이 조금 다르다. parameter값이 인덱스가 아니다.
select substr('ABCDE',2,3) from dual;-- (대상,시작위치,시작위치부터 몇개까지 끊을 것인지(자기 자신을 포함))
select substr('ABCDE',1,1) from dual;
select substr('ABCDE',3,1) from dual;
select substr('ABCDE',3) from dual;--CDE / 몇개 끊을 것인지 지정해주지 않으면 뒷 내용이 다 출력된다.
select substr('ABCDE',-2,1) from dual;--D / -가 붙으면 역순으로 세기
--언어마다 substring의 정의가 다 다르다. 사용시 주의하기

--사원테이블에서 ename 컬럼데이터에 대해 첫글자는 소문자로 나머지는 대문자로 출력하세요
--단, 위 결과를 하나의 컬럼으로 출력하고 컬럼의 이름은 fullname, 첫글자와 나머지 문자 사이에 공백 하나를 넣어서 출력하시오.
--  select lower(substr(ename,1,1))|| ' ' || upper(substr(ename,2)) as "fullname" --어차피 이름 다 대문자
    select lower(substr(ename,1,1))|| ' ' || substr(ename,2) as "fullname"
    from emp;
--공백이 없는 경우에는 concat을 써도 된다.

--lpad, rpad(채우기)
select lpad('ABC',10,'*') from dual; --*******ABC (표시할 문자열, 전체길이,빈 공간 채울 문자)
select rpad ('ABC',10,'^') from dual; --ABC^^^^^^^

--Quiz
--사용자비번 : hong1006
--화면 : ho****** 출력하고 싶어요

select rpad(substr('hong1006',1,2), length('hong1006'),'*') as "password" from dual;

--emp 테이블에서 ename 컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지는 *로 표시하기
select rpad(substr(ename,1,1),length(ename),'*') as "ename" from emp;


create table member2(
    id number,
    jumin varchar2(14)
    );
    
insert into member2(id, jumin) values(100,'123456-1234657');
insert into member2(id, jumin) values(200,'234567-1234657');
commit;
select* from member2;

--하나의 컬럼으로 결과값을 출력. 
--100 : 123456-*******
--200 : 234567-*******
--출력결과으 컬럼 명은 "juminnumber"

select id || ' : ' || rpad (substr(jumin,1,7), length(jumin), '*') as "juminnumber"
from member2;

--rtrim함수 : 오른쪽 문자를 지워라.  ltrim도 동일
select rtrim('MILLER','ER') from dual; --MILL
select ltrim('MILLLLLLLLER','MIL') from dual; --ER 중복값도 같이 지워준다! 주의하기

select '>' || rtrim('MILLER                 ',' ') || '<' from dual;
select '>' || rtrim('               MILLER                 ',' ') || '<' from dual; --오른쪽 공백은 지워지지 않는다.


--치환함수 (replace)
select ename, replace(ename,'A','rainbow A') from emp;

------------------------------------문자열함수 END--------------------------------------------------

--[숫자 함수]
--round(반올림)
--truc(절삭함수)
--mod(나머지를 구하는 함수)


-- .....-3  -2  -1  0  1  2  3  ....
select round(12.345,0) as "r" from dual; --parameter가 0일 때, 정수부만 남겨라 : 12
select round(12.567,0) as "r" from dual; -- : 13(반올림됨)
select round(12.345,1) as "r" from dual; --parameter가 1 일 때, 소수점 이하 첫번째 자리까지만 남겨라 :12.3 
select round(12.567,1) as "r" from dual; --12.6

select round(12.345,-1) as "r" from dual; --.을 기준으로 2번째 자리부터 반올림
select round(12.567,-1) as "r" from dual;


select trunc(12.345,0) as "r" from dual; --parameter가 0일 때, 정수부만 남겨라: 12
select trunc(12.567,0) as "r" from dual; -- : 13(반올림 안됨)
select trunc(12.345,1) as "r" from dual; --parameter가 1 일 때, 소수점 이하 첫번째 자리까지만 남겨라 반올림 안됨 :12.3
select trunc(12.567,1) as "r" from dual; -- 반올림 안됨 12.5

select trunc(12.345,-1) as "r" from dual;
select trunc(12.567,-1) as "r" from dual;

--나머지 구하기
select 12/10 from dual;
select mod(12,10) from dual; -- 2 (나머지.. 함수로 구현)
select mod(0,0) from dual; --0

----------------------------------숫자함수 끝------------------------------------
--날짜함수
select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--Date + Number >> 날짜가 출력. Date
--Date + Number >> Date
--Date - Date >> >> Number (일수) (근속일수 같은거...)
select hiredate from emp;
select months_between('2018-01-01','2010-01-01') from dual;

select MONTHS_BETWEEN(SYSDATE,'2010-01-15') from dual;
select round(MONTHS_BETWEEN(SYSDATE,'2010-01-15'),1)from dual; -- 딱떨어지지 않음 122.565016427718040621266427718040621266
--122.6 round씌웠음
--point
--날짜 형식의 문자열을 날짜로 바꾸는 함수 (to_date())
select to_date('2020-04-01') + 100 from dual;
select sysdate+1000 from dual; --2022-12-27
select sysdate-to_date('2013-07-23') as "꽃분이 만난 날" from dual;

--Quiz
--1. 사원테이블에서 입사일에서 현재날짜까지의 근속월수
-- 근속월수는 정수만 반올림 안함
--2. 한달이 31이라는 기준에서 근속 월수
-- 함수 사용하지 말고 >> 날짜 - 날짜 >> 150일

select ename, trunc(MONTHS_BETWEEN(sysdate,hiredate),0) as "근속월수"
from emp;
select ename, hiredate, trunc((sysdate- hiredate) / 31,0) as "근속월수"
from emp;

--[변환 함수]: Today Point
--오라클 : 문자, 숫자, 날짜
--to_char() : 숫자 -> 문자로 바꿀때 (1000 -> $1000) , 
--            날짜 -> 문자(2020-01-01 -> 2020년 01월 01일) format
--가장 많이 쓰임

--to_date() : 문자 -> 날짜 >> select '2020-12-12' + 100
--                          select to_date('2020-12-12')+100

--to_number() : 문자 -> 숫자(내부 자동 형변환)
select '100' + 100 from dual;
select to_number('100' + 100) from dual;
select '1' + 100 from dual; --
select to_number('1') + 100 from dual;

--to_char() : format >> 숫자 , 날짜 (형식문자)
select to_char(sysdate) || '일' from dual; --2020-04-01 12:56:11일
select sysdate,
to_char(sysdate, 'yyyy') || '년' as "YYYY",
to_char(sysdate, 'mm') || '월' as "MM",
to_char(sysdate, 'dd') || '일' as "DD",
to_char(sysdate, 'dy') || '요일' as "DY"
from dual; --2020-04-01 12:59:31	2020년	04월	01일	수요일

--입사월이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요
select *
from emp
where to_char(hiredate,'mm') = 12;
select to_char(hiredate, 'yyyy"년" mm"월" dd"일"') from emp; --""안에 넣어줘야함

--to_char() 숫자 -> 문자로 (형식문자)
--pdf 파일 71페이지 표
--100000 >> 출력 >> $1,000,000 (문자)

select '>'||to_char(12345, '999999999999')||'<' from dual;
select '>'||to_char(12345, '099999999999')||'<' from dual; --> 000000012345<
select '>'||to_char(12345, '$9,999,999,999')||'<' from dual;
select sal, to_char(sal,'$999,999') from emp;
--800	     $800
--1600	   $1,600

--hr계정으로 전환
select* from employees;
/*
사원테이블에서 사원의 이름은 last_name, first_name합쳐서 fullname 별칭 부여해서 출력하고 입사일은 yyyy-mm-dd 형식으로 출력하고
연봉 (급여*12)을 구하고 연봉의 10%(연봉*1.1)인상한 값을 출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요ㅣ
단 2005년 이후 입사자들만 출력하고, 연봉이 높은 순으로 출력하세요
*/

SELECT employee_id,
last_name || first_name as "fullname",
to_char(hire_date,'yyyy-mm-dd') , 
salary*12 ,
to_char((salary*12)*1.1,'$9,999,999,999')
FROM employees
where to_char(hire_date,'yyyy') >= '2005';
--bit계정으로 변환
---------------------------------변환함수 (to_char(), to_date(), to_number())---------------------------------
--[일반 함수(프로그래밍적 성격)]
--nvl(), nvl2() >> null처리 담당
--decode()함수 >> java if 문(switch) 비슷
--case()함수 >> java if문 (switch)
select comm, nvl(comm,0)from emp;

create table t_emp(
    id number(6),
    job varchar2(20)
);

insert into t_emp(id, job) values(100,'IT');
insert into t_emp(id, job) values(200,'SALES');
insert into t_emp(id, job) values(300,'MGR');
insert into t_emp(id) values(400);
insert into t_emp(id, job) values(500,'MGK');
SELECT
    *
FROM t_emp;
commit;
rollback;
drop table t_emp;

select decode(deptno, 10, '인사부',
                    20, '관리부',
                    30, '회계부',
                    '기타부서') as "부서"
from emp;

select id ,job, decode(id, 100, '인사부',
                  200, '관리부',
                  300, '회계부',
                  '기타부서') as "부서"
from t_emp;


--quiz
CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);
INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;
SELECT * FROM t_emp2;

/*
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면 남성 2이면 여성 3이면 중성 그외는 키타
*/
select id, decode(substr(jumin,1,1),1,'남성',
                                    2,'여성',
                                    3,'중성',
                                    '기타')as "gender"
from t_emp2;

SELECT empno, ename, decode(deptno,20,
                            decode(ename,'SMITH','HELLO','WORLD')
                            ,'etc')
FROM emp;

--case문
--java switch
--case 조건식 when 결과1 then 출력1
--           when 결과2 then 출력2
--           when 결과3 then 출력3
--           else 출력4
--end "컬럼명"
create table t_zip(
    zipcode number(10)
);
insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(33);
insert into t_zip(zipcode) values(41);
SELECT
    *
FROM t_zip;
commit;
select '0' || to_char(zipcode), 
        case zipcode when 2 then '서울'
                     when 31 then '경기'
                     when 32 then '강원'
                     when 41 then '제주'
                     else '기타 지역'
        end "regionname"
from t_zip;

/*
사원테이블에서 사원급여가 1000달러 이하면 4급
1001 ~ 2000 3급
2001 ~ 3000 2급
3001 ~ 4000 1급
4001 ~ 특급

1. case 컬럼명 when 결과 then 출력 ( = 처리할때 조건)
2. 비교조건 
    case when 컬럼명 조건 비교식 then 출력
*/
SELECT ename, 
case when sal <= 1000 then '4급'
     when sal between 1001 and 2000 then '2급'
     when sal between 2001 and 3000 then '2급'
     when sal between 3001 and 4000 then '1급' 
     else '특급'
end "급수"
FROM emp;

------------------------------------------
--문자함수
--숫자함수
--날짜함수
--변환함수(to_char, to_date, to_number)
--일반함수 (nvl(), decode(), case())
------------------------------------------

--[집계함수] page 75
/*
count(*) > row 줄수, count(컬럼명) >>데이터 건수(null 을 포함하지는 않는다)
sum()
avg()
max()
min()
등등

1. 집계함수는 group by절과 같이 사용
2. 모든 집계함수는 null값을 무시
3. select 절에 집계함수 이외 다른 컬럼이 오면 반드시 그 컬럼은 group by절에 명시되어야 한다.
*/

select count(*) from emp; --줄수를 세는것
select count(comm) from emp; --6개밖에 안나옴 왜? null값 무시됨
select count(empno) from emp;

select count(nvl(comm,0)) from emp; --14개 잘 출력됨

--급여의 합
select sum(sal) as "급여 합" from emp; --29025
select round(avg(sal),0) as "평균 급여" from emp;

-- 사장님이 회사 총 수당 얼마나 지급되고있나 
select trunc(avg(comm),0) from emp;
select trunc(sum(comm) / count(comm)) from emp; -- 위에것과 같음. null값이 아닌 사원수 6명만 취급.
--노조에서 ~~~~~~~~~~~~~~~난리~~~~~~~~~~~~~~~~
select trunc(avg(nvl(comm,0)),0) from emp;
select trunc(sum(comm) / 14) from emp;
--회사 규정이 전체 사원수로 나눈다 한다면 309가 맞음
--회사 규정이 받는 사원수로 나눈다 한다면 721이 맞음

--검증 : 코드
select count(*) from emp where comm is null; --8
select count(*) from emp where empno is null; --null값 없음
select max(sal) from emp; --5000
select min(sal) from emp; --800
--
select empno, count(empno) from emp; --안됨. empno는 14건이 나와야되고 count는 무조건 1건으로 몇개인지만 표기해줘야됨
select sum(sal), avg(sal), max(sal), min(sal), count(sal)
from emp;
--부서별 평균 급여를 출력하세요
select deptno, avg(sal)
from emp
group by deptno; --그룹핑 후 각각의 평균 값 계산
--직종별 평균 급여
select job, avg(sal)
from emp
group by job;
--직종별 평균 급여, 급여합, 최대급여, 최소급여, 건수 출력
select job, avg(sal)as "평균 급여", sum(sal)as "급여 합", max(sal)as "최대 급여", min(sal)as "최소 급여", count(job)as "건수"
from emp
group by job;
/*
grouping 원리
distinct 컬럼명1, 컬럼명2
order by 컬럼명1, 컬럼명2
group by 컬럼명1, 컬럼명2, 컬럼명3

*/
--부서별, 직종별 급여의 합을 구하세요.

select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job
order by deptno;

select 
from
where
group by
order by