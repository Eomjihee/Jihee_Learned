
/* 순서 41235
select 
from
where
group by
order by
*/

--직종별 평균 급여가 3000달라 이상인 사원의 직종과 평균 급여를 출력하세요
--**group by 조건절 >> having 절
select job, avg(sal) as "평균 급여" 
from emp
group by job
having avg(sal) >= 3000;
--PRESIDENT	5000
--ANALYST	3000

--from 조건절 >> where
--group by 조건절 >> having 해빙절은 그룹바이가 있어야 쓸수있다.

/* -- 하나의 테이블을 대상으로 쓸 수 있는 구문의 전부임
select 
from
where
group by
having
order by
*/

--1. 사원테이블에서 직종별 급여합을 출력하되 수당은 지급받고 급여의 합이 5000이상인 사원들의 목록을 출력, 급여의 합이 낮은순으로
select job, sum(sal) as "sumsal", count(job)
from emp
where comm is not null
group by job -- select절의 직계함수 외에 다른 게 오면 group by로 반드시 묶어줘야한다.
having sum(sal) >= 5000
order by "sumsal" asc ;

--2. 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하세요
select deptno , count(deptno) as  "인원수", sum(sal)
from emp
group by deptno
having count(deptno) > 4;

--3. 사원 테이블에서 직종별 급여의 합이 5000을 초과하는 직종과 급여의 합을 출력하세요.
--   단 판매직종(SALESMAN)은 제외하고 급여합으로 내림차순 정렬하세요.
-- where은 group by가 없어도 되는 조건! 으로 구분하자.
select job ,sum(sal)
from emp
where job !='SALESMAN'
group by job
having sum(sal) > 5000 -- 현재 조건은 having에 걸어도 나오지만 사전에 먼저 걸러주는게 좋기때문에 where에 걸어주는것이 좋다.
order by sum(sal) desc;

---------------------------------------------------------------------------------------------
--[join] (pdf 85 page)
--관계형 데이터 베이스 ( RDBMS ) >> ORDB (객체 DB) : 거의 폐기했다함; >>Framework (객체 매핑 : JDA , Mybatis)

/*
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;
*/
select * from m;
select * from s;
select * from x;
--종류
--1. 등가 조인 (equi join)
--원 테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑
--JOIN문법
--1. SQL JOIN 문법
--2. ANSI 문법 (권장)(표준)

--SQL JOIN문법
select *
from m,s
where m.m1 = s.s1;
--null은 비교대상이 되지 않는다.
--union이 밑으로 붙었다면, SQL JOIN문법은 옆으로 붙는다.
--A     	1         	A     	X         
--B     	1         	B     	Y         
select m.m1, m.m2, s.s2
from m,s
where m.m1 = s.s1;
--이 문법은 되도록 쓰지않는게 좋다
--ANSI 문법 (이 문법을 권장함)--
--where (from 조건절)
--where JOIN의 조건과 일반 조건을 혼재하면 혼란스러움
--JOIN의 조건은 분리하자 >> ON 절
select *
from m INNER JOIN s -- INNER JOIN이 등가조인의 문법. inner는 생략가능
ON m.m1 = s.s1; --같은 조건이라면 데이터를 뽑아주세요 : 결과는 동일

--비등가 조인 : 내 급여가 몇급에 속하는지를 비교할때.. 
--아예 한칸당 한칸의 데이터 비교값이 아닌 맥시멈과 미니멀 사이에서 어디에 속하는지 등을 볼때..

--테이블의 원칙 : 나눌수 있는만큼 나눠라
--한군데에 다 넣으면 셀렉트는 편하지만.. 수정변경에는 불리
--데이터는 앞으로 늘어날 것으로 전제하고 해야함. 그래서 무조건 쪼개야함! 

--사원번호, 사원이름, 사원부서번호, 사원 부서명을 알고 싶어요
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp join dept
on emp.deptno = dept.deptno;

--근데 이거 너무길어욥! 할때 별칭을 붙일 수 있다
--Join 테이블에 가명칭 부여한 뒤 그 이름으로 접근.
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on emp.deptno = dept.deptno;

--Join(2,3..)여러개 테이블
select m.m1, m.m2, s.s2, x.x2
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
--A == B, B == C, C == A

--Ansi 문법
select *
from m join s on m.m1 = s.s1 
       join x on s.s1 = x.x1;
--     join y on x.x1 = y,y1;

--HR계정으로 이동
select * from employees;
select * from departments;
select * from locations;
--1. 사번, 이름 (last_name) ,부서 번호, 부서 이름을 출력해보세요
select e.employee_id, e.last_name, e.department_id,0 ,d.department_name -- 107명인데 106명 출력됨
from employees e join departments d 
                 on e.department_id = d.department_id;
select *
from employees where department_id is null; --178 사원이 부서번호가 null
--등가조인만으로는 해결 불가 (outer join)사용해 해결
--2. 사번, 이름(last_name), 부서 번호, 부서명, 지역코드, 도시명을 출력해보세요
select e.employee_id, e.last_name, e.department_id, 
       d.department_name, d.location_id,
       l.city
from employees e join departments d
                 on e.department_id = d.department_id
                 join locations l
                 on d.location_id = l.location_id;
--bit 계정--
--2. 비등가 조인 (non-equi join) -> 의미만 존재 -> 등가조인 문법
--원 테이블과 대응되는 테이블 있는 컬럼이 1:1 매핑되지 않는 경우

select * from emp;
select * from salgrade;

select * 
from emp e join salgrade s
on e.sal between s.losal and s.hisal;
--결국 문법적으로는 등가조인--
--안만드는게 좋아요~ 실습용이라 일부러 만들었어요 ^^
--현업에서는 많이 볼 일 없어요~

----------------------------------------------------------------------------------
--3. outer join (equi join + null)
--outer join (주종관계 파악) >>주가 되는 테이블에 있는 남은 데이터를 갖고오는 방법
--문법 3가지
--1. left outer join (왼쪽 주인)
--2. right outer join (오른쪽 주인)
--3. full outer join (왼쪽 주인 + 오른쪽 주인 >> union)

select*
from m join s
on m.m1 = s.s1;
--A     	1         	A     	X         
--B     	1         	B     	Y         

select *
from m left outer join s
on m.m1 = s.s1;
--A     	1         	A     	X         
--B     	1         	B     	Y         
--	        3         		
--C     	3         

select *
from m right outer join s
on m.m1 = s.s1;
--A     	1         	A     	X         
--B     	1         	B     	Y         
--			                    Z         

select *
from m full outer join s
on m.m1 = s.s1;
--A     	1         	A     	X         
--B     	1         	B     	Y         
--C     	3         		
--	        3         		
--			                    Z         

--hr 전환
select e.employee_id, e.last_name, e.department_id, d.department_name -- 107명 출력됨
from employees e left outer join departments d 
                 on e.department_id = d.department_id;
                 
                 
--------------------------BIT 전환--------------------------------------


--self join(자기참조) ->의미만 존재 >> 문법은 등가조인을 따라간다.
--하나의 테이블에서 특정 컬럼이 다른 컬럼을 참조하는 경우
--조인(테이블이 한개 이상이어야 한다.)
--테이블의 가명칭을 달리해서 여러개 테이블처럼 취급한다.
select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.EMPNO;
--문제 : 우리는 14명 근데 13명의 결과만 출력되었다. 이 경우 outer join을 사용해주면 된다.
--관리자도 우리회사 사원이다. 관리자 테이블을 따로 만들 필요가 없이 셀프조인을 사용하면 된다.



----------------- JOIN TEST -------------------
select* from emp;
select* from dept;
select* from salgrade;


-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
select e.ename, e.deptno, d.dname
from emp e join dept d on e.deptno = d.deptno;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
select e.ename, d.dname
from emp e join dept d on e.deptno = d.deptno
where e.ename like '%A%';



-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
select e.ename , d.dname
from emp e join dept d on e.deptno = d.deptno
where e.sal >= 3000;
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
select e.job, e.ename, d.dname
from emp e join dept d on e.deptno = d.deptno
where job = 'SALESMAN';

 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
select e.empno as "사원번호" , e.ename as "사원이름", sal*12 as "연봉", (sal*12)+nvl(comm,0)as "실급여", sg.grade as "급여등급"
from emp e join salgrade sg on e.sal between sg.losal and  sg.hisal
where e.comm is not null;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d on e.deptno = d.deptno 
           join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = 10;
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
select e.deptno, d.dname, e.ename, sal, s.grade
from emp e join dept d on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
--where e.deptno between 10 and 20 땡! 10번과 20번만!
where e.deptno in(10,20)
order by deptno asc , sal desc;
 
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
select e.empno, e.ename, e.mgr, ee.ename
from emp e left join emp ee on e.mgr = ee.empno;

----------------------------------------------------------------------
--subquary (오라클 pdf 7장 100page)
--sql의 꽃 >> sql 만능 해결사
--함수 >> 조인 >> subquery

--사원 테이블에서 사원들의 평균 월급보다 더 많은 급여를 받는 사원의
--사번, 이름, 급여를 출력하세요.

select round(avg(sal),0) from emp;
select empno,ename,sal
from emp
where sal > 2073;

select *
from emp
where sal > (select avg(sal) from emp);

--subquery
--1. single row subquery : subquery의 결과가 1개의 row를 가질때(단일값) : 한개의 값 /단일컬럼 단일값
--2. multi row subquery : subquery의 결과가 1개 이상의 row를 가질때(여러개의 값) /단일컬럼 여러개 값

--구분하는 이유 : 사용되는 연산자의 차이
--multi row (IN , NOT IN) (ANY , ALL)
--ALL(and로 해석) : sal > 1000 and sal > 2000 and ... (약간 부정적)
--ANY(or로 해석) : sal > 1000 or sal > 2000 or ...

--정의(subquery)
--1.무조건 괄호안에 있어야한다 (select avg(sal) from emp)
--2.단일컬럼으로 구성 >> select sal, deptno from emp, >> (X) 단일컬럼이 아니면안됨. 두개의 컬럼중에 어떤걸 비교할 지 판단할 수 없음
--3.단독으로 실행 가능해야 한다!

--실행 순서
--1. 무조건 subquery 먼저 실행
--2. subquery의 결과값을 가지고 main query 실행

--사원테이블에서 jones 급여보다 더 많은 급여를 받는 사원의 사번 이름 급여 출력하세요.
select empno, ename, sal
from emp 
where sal > (select sal from emp where ename = 'JONES');

select empno, ename, sal
from emp 
where sal > (select sal from emp where sal > 2000); 
-- subquary가 문제있지는 않지만 돌려주는 select컬럼값이 여러개므로 안됨

select empno, ename, sal
from emp 
where sal in (select sal from emp where sal > 2000); 
-- 해당문장은 아래와 같은 뜻임
-- where sal = 2975 or sal = 2850 or sal = 2450 or sal = 3000
select empno, ename, sal
from emp 
where sal not in (select sal from emp where sal > 2000);
--(부정의 and)
--where sal !=2975 and sal != 2850 and sal != 2450 and sal != 3000

--부하직원 있는 사원
select empno, ename
from emp
where empno in (select mgr from emp);
-- 부하직원 없는 사원
select empno, ename
from emp
where empno not in (select mgr from emp where empno is null);

--king이 직속상관인 사원의 사번, 이름, 직종, 관리자 사번
select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');

--20번 부서 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 사번 이름 급여
select*
from emp
where sal > (select max(sal) from emp where deptno = 20);

--point
--subquery >> select 절
--         >> from 
--         >> where

select *
from emp
where deptno in (select deptno from emp where job = 'SALESMAN')
      and sal in (select sal from emp where job = 'SALESMAN');
      
--Quiz
--실무 활용
-- 자기부서의 평균월급보다 더많은 월급 받는 사원의 사번 이름 부서번호 부서별 평균 월급
select * from emp;

select avg(sal)
from emp
group by deptno;

-- from절 subquery 사용 가능.. (가상테이블) 
select *
from emp e join(select deptno, round(avg(sal),0) as avgsal
                from emp group by deptno) s 
                on e.deptno = s.deptno
where e.sal> s.avgsal;