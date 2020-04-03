
--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT ename, sal
from emp
where sal > (select sal from emp where ename like 'SMITH');

--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.

--이게 푼거였다 
select ename, sal, empno
from emp
where sal in (select sal from emp where deptno = 10);

--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename like 'BLAKE') 
      and ename not like 'BLAKE';

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;

--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
select empno, ename
from emp
where ename like '%T%';

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
select ename, empno , sal
from emp
where sal > (select max(sal)
                from emp
                where deptno = 30);
--ALL로 풀면
select ename, deptno, sal
from emp
where sal > all(select sal from emp where deptno = 30);
--못풀었다.
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
select e.ename, e.deptno, e.job
from emp e join dept d on e.deptno = d.deptno
where d.loc like 'DALLAS';

select*
from dept;
--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
select empno, ename, job
from emp e join dept d on e.deptno = d.deptno
where d.dname like 'SALES';
 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
select e.ename, e.sal , e.mgr, ee.ename 
from emp e join emp ee on e.mgr = ee.empno
where ee.ename like 'KING';

select * from emp; 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
select ename ,deptno
from emp
where sal > (select round(avg(sal),0) from emp) and ename like '%S%';

select e.empno, e.ename , e.sal, e.deptno
from emp e join (select deptno
                from emp
                where sal > (select round(avg(sal),0) from emp) and ename like '%S%') s 
                on e.deptno = s.deptno;
--왜 두번 나오는지 모르겠음..

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
select*
from emp
where comm is not null;

select*
from emp e 
where deptno in(select deptno from emp where comm is not null);
--모르겠음

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.

select ename, sal, comm
from emp
where sal not in(select sal  from emp where deptno =30) and comm not in(select nvl(comm,0) from emp where deptno = 30);


-------------------------------------------------------------------------------------------------------------------
/*
select
from
where
group by
having
order by

기본 함수 ~~집계 함수까지
join (하나이상 테이블에서 데이터 가져오기 : 다중 테이블 : 관계)
subquery
*/

--[INSERT], [UPDATE], [DELETE]-- 당연히 암기해야함

/*
오라클 기준
DDL (데이터 정의어) create , alter, drop, truncate (rename, modify)
DML (데이터 조작어) insert, update, delete   개발자 O 20%
DQL (데이터 질의어) select                   개발자 O 70%
DCL (제어어) 권한(grant , revoke)            관리자가 하는일 (DBA) (모니터링, 백업, 복원)
TCL (트랜젝션) commit, rollback, savepoint  개발자 O

개발자가 하는일 CRUD (create > DB로 치면 insert, READ > select, U > update , D > delete)
데이터를 만들고 읽고 업데이트하고 삭제할 줄 알면 됨
*/

-- DML (트랜잭션 : 하나의 논리적인 작업단위. lock 동반함 ** 완전중요 ** 자바로 치면 동기화.) 

--정처기 예시 : 다음중 트랜잭션의 정의가 아닌것은?
-- A라는 은행에서 돈 인출 B라는 은행에 입금
-- A : update .. 1000 > 500
-- B : update .. 1000 > 1500
-- 둘다 성공하면 commit
-- 둘 중 하나라도 실패하면 rollback

-- 데이터 변경이 들어가는 작업은 트랜잭션을 동반할 수 있다.

select* from tab; --접속한 사용자가 만든 모든 테이블 목록
-- create 테이블 할때 이름중복되지 않는지 확인할때

select * from tab where tname = 'BOARD'; --보드테이블 이미 존재
select * from col; --내가 만든 col명
select * from col where tname = 'EMP'; -- emp에서 내가 만든 col명
--이런걸로 웹 전용 DB툴을 만들려고 했었다함
select * from user_tables;-- 관리자
select* from user_tables where table_name = 'DEPT';
----------------------------------------------------------------------------
--DML (오라클 pdf 168page 제 10장)
create table temp(
    id number primary key, -- id컬럼에는 not null 과 unique한 데이터만 넣을 수 있다.
                           -- 회원가입할 때 중복제거 및 필수입력과 같음
    name varchar2(20)
    --default null값 허용
);
select *from temp;
/*
문자 타입
char(20) >>20byte >> 한글 10자, 영문자 20자 >> 고정길이 문자열
varchar2(20)>> 20byte >> 한글 10자, 영문자 20자 >> 가변길이 문자열

char(20) >> "홍길동" >> 6byte >> [홍길동       ] >> 20byte
varchar(20) >> "홍길동" >> 6byte >> [홍길동] >> 6byte

ex) 고정길이 데이터 : 남, 여 : char(2)
    가변길이 데이터 : 이름...
    
    성능적인 문제 : char() > varchar()우선....
    그러면 우리가 해야하는 것은? 고정길이 데이터는 웬만하면 char()를 쓰는것이 이득.
    
    한글 문자 (unicode : 2byte) >> 한글,  영문자, 특수문자, 공백
    nchar(20) >> 20글자 >> 글자수 기준 >> 총 byte >> 2*20 >> 40byte
    nvarchar(10) >> 10글자 
*/
select *from temp;
--1. 가장 일반적인 insert
insert into temp(id,name)
values(100, '홍길동');
--실 반영
commit;
--2. 컬럼 목록 생략 (컬럼 리스트 생략 가능하지만.. 하지마세요)
insert into temp
values(200, '김유신'); -- 데어터 컬럼의 모든 컬럼 개수, 순서 다 맞춰줘야함

--1. 문제 상황
insert into temp(id, name)
values(100,'아무개'); -- 중복값 에러. id number primary key 이기 때문에 null안되고 중복값 안됨.
--ORA-00001: unique constraint (BIT.SYS_C007003) violated

insert into temp(name)
values('아무개'); --ORA-01400: cannot insert NULL into ("BIT"."TEMP"."ID")
------------------------------------------------------------------------------------------
--일반 sql 문은 프로그램적 요소 (x)

--PL-SQL (고급) 프로그래밍적 요소(제어문, 변수)
--PL-SQL
create table temp2(id varchar2(20));
--데이터 테스트 .. 일일이 1000건 1000번 실행해야하나요?
/*
BEGIN
    FOR i in 1..1000 LOOP
        INSERT INTO temp2(id) values('A'||to_char(i));
    END LOOP;
END;
*/
commit;
-------------------------------------------------------------------------------
create table temp3(
    memberid number(3) not null,
    name varchar2(10), --null 허용
    regdate DATE default sysdate -- 기본 값 설정하기 (날짜 insert 하지않으면..)
);

select sysdate from emp;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name , regdate)
values(100,'홍길동', '2020-04-03');
commit;
insert into temp3(memberid, name)
values(200, '아무개');
select *from temp3;
commit;

insert into temp3(memberid)
values(300);
select *from temp3;
--300		2020-04-03 12:15:26

insert into temp3(name)
values('이름만');
--ORA-01400: cannot insert NULL into ("BIT"."TEMP3"."MEMBERID")

--insert (TIP)
--1. 대량 데이터 insert하기
create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);
select * from temp4;

--요구사항 : temp4에 있는 모든 데이터를 temp5에 넣고싶어요
--insert into 테이블명 (컬럼리스트) values(값리스트)
--insert into 테이블명 (컬럼리스트) select 절(컬럼리스트의 개수와 타입 동일) 조건
insert into temp5(num)
select id from temp4; --<<<외워!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

select *from temp5;

--2. insert tip
--테이블에 없는 상황에서 [테이블 생성] + [대량 데이터 삽입]
--단 복사개념(제약 정보는 복사 안돼요 PK, FK)
--순수한 테이블 구조 (컬럼 이름 , 타입) 복사

--create table copyemp ~
create table copyemp --emp같은 구조를 만들고 데이터 삽입
as
    select * from emp;
select * from copyemp;

create table copyemp2
as
    select empno, ename, sal
    from emp
    where deptno=30;
    
select * from copyemp2;
select * from col where tname = 'COPYEMP2';
--질문 :  구조(틀) 만 복사하고 데이터 복사하고싶지 않아요
create table copyemp3
as
    select * from emp
    where 1=2; --무조건 false 조건
select * from copyemp3;

-----------------------[insert end]----------------------
--[update]
/*
update table_name
set colum1 = value1, column2 = value2...
where 조건

update table_name
set column1 = (subquery)
where 조건
*/
select*from copyemp;
update copyemp
set sal = 0;
rollback;

update copyemp
set sal = 0
where deptno = 20;

select*from copyemp order by deptno;
commit;

update copyemp
set sal = (select sum(sal)from emp)
where deptno = 20;

--여러개의 컬럼을 update
update copyemp
set ename = 'AAAA' , job = 'BBBB', hiredate = sysdate, sal = 1111
where deptno = 10;

select * from copyemp where deptno= 10;
commit;
-------------------------------[update end]-------------------------------
--[DELETE]
--원칙 >> delete -> commit , rollbact -> 복원 불가 ->단 백업했다면 가능
delete from copyemp;
select *from copyemp;
rollback;
delete from copyemp where deptno in(10,20); --deptno = 10
select * from copyemp where deptno in(10,20);
commit;
------------------------------[DELETE END]--------------------------------
/*
app(JAVA) -->JDBC API(자바 데이터베이스 커넥션 API) -->       ORACLE (DB)

CRUD
create : insert
read : select
update : update
delete : delete

DML:(insert, update, delete)트랜잭션(commit, rollback)
JDBC -> Oracle -> EMP테이블 작업
--전체 조회(함수)
--조건 조회(사번이)(함수)
--삭제(함수)
--수정(함수)
--삽입(함수)

--JAVA
--public List<Emp> getEmpAllList() {String sql = "select * from emp" };
--public Emp getEmpListByEmpno() {String sql = "select * from emp where empno = 777" };
--public int insertEmpData(Emp emp) {String sql = "insert into emp()..." };

*/
------------------------------------------------------------------------------------------------
--[DDL]
--create, alter, drop (테이블기준)
select * from tab;
select * from tab where tname = 'BOARD';
--지우는 방법이 있음. DELETE보다 높은 단계
drop table board;

create table board(
    boardid number,
    title nvarchar2(100),
    content nvarchar2(2000),
    regdate date
);

--학생성적 테이블
--국어, 영어, 수학, 총점 컬럼
--국어, 영어, 수학 점수가 들어오면 자동으로 총점이 계산되면 어떨까
--ORACLE 11g 버전(가상 컬럼(조합컬럼))
create table vtable(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 + no2) virtual
);

insert into vtable(no1, no2)
values(100,200);
select * from vtable;
insert into vtable(no1,no2)
values(33,44);

select * from vtable;

insert into vtable(no1,no2,no3)
values(10,20,30);--ORA-54013: INSERT operation disallowed on virtual columns

--컬럼의 정보 보기
select column_name, data_type, data_default
from user_tab_columns where table_name='VTABLE';
--NO3	NUMBER	"NO1"+"NO2"

--실무에서 활용되는 코드
--제품 정보 (입고일) .. 분기별 관리(4분기)
--입고일 : 2020-03-01 >> 1분기 데이터 
--날짜가 들어오면 자동으로 1분기 데이터로 빼고싶어
create table vtable2
(
    no number, --순번
    p_code char(4), --제품 코드(A001, ...)
    p_date char(8), --입고일
    p_qty number,
    p_bungi number GENERATED ALWAYS as(
                                        case when substr(p_date,5,2) in (01,02,03) then 1
                                             when substr(p_date,5,2) in (04,05,06) then 2
                                             when substr(p_date,5,2) in (07,08,09) then 3
                                             else 4
                                        end
                                       )virtual
);

select * from vtable2;
select column_name, data_type, data_default
from user_tab_columns where table_name='VTABLE2';

insert into vtable2(p_date) values ('20200101');
insert into vtable2(p_date) values ('20200201');
insert into vtable2(p_date) values ('20200301');
insert into vtable2(p_date) values ('20200401');
insert into vtable2(p_date) values ('20200501');
insert into vtable2(p_date) values ('20200601');
insert into vtable2(p_date) values ('20200701');
insert into vtable2(p_date) values ('20200801');
insert into vtable2(p_date) values ('20200901');
insert into vtable2(p_date) values ('20201001');
insert into vtable2(p_date) values ('20201101');
insert into vtable2(p_date) values ('20201201');