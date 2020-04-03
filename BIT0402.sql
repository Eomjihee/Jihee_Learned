
/* ���� 41235
select 
from
where
group by
order by
*/

--������ ��� �޿��� 3000�޶� �̻��� ����� ������ ��� �޿��� ����ϼ���
--**group by ������ >> having ��
select job, avg(sal) as "��� �޿�" 
from emp
group by job
having avg(sal) >= 3000;
--PRESIDENT	5000
--ANALYST	3000

--from ������ >> where
--group by ������ >> having �غ����� �׷���̰� �־�� �����ִ�.

/* -- �ϳ��� ���̺��� ������� �� �� �ִ� ������ ������
select 
from
where
group by
having
order by
*/

--1. ������̺��� ������ �޿����� ����ϵ� ������ ���޹ް� �޿��� ���� 5000�̻��� ������� ����� ���, �޿��� ���� ����������
select job, sum(sal) as "sumsal", count(job)
from emp
where comm is not null
group by job -- select���� �����Լ� �ܿ� �ٸ� �� ���� group by�� �ݵ�� ��������Ѵ�.
having sum(sal) >= 5000
order by "sumsal" asc ;

--2. ������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����ϼ���
select deptno , count(deptno) as  "�ο���", sum(sal)
from emp
group by deptno
having count(deptno) > 4;

--3. ��� ���̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���.
--   �� �Ǹ�����(SALESMAN)�� �����ϰ� �޿������� �������� �����ϼ���.
-- where�� group by�� ��� �Ǵ� ����! ���� ��������.
select job ,sum(sal)
from emp
where job !='SALESMAN'
group by job
having sum(sal) > 5000 -- ���� ������ having�� �ɾ �������� ������ ���� �ɷ��ִ°� ���⶧���� where�� �ɾ��ִ°��� ����.
order by sum(sal) desc;

---------------------------------------------------------------------------------------------
--[join] (pdf 85 page)
--������ ������ ���̽� ( RDBMS ) >> ORDB (��ü DB) : ���� ����ߴ���; >>Framework (��ü ���� : JDA , Mybatis)

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
--����
--1. � ���� (equi join)
--�� ���̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1 ����
--JOIN����
--1. SQL JOIN ����
--2. ANSI ���� (����)(ǥ��)

--SQL JOIN����
select *
from m,s
where m.m1 = s.s1;
--null�� �񱳴���� ���� �ʴ´�.
--union�� ������ �پ��ٸ�, SQL JOIN������ ������ �ٴ´�.
--A     	1         	A     	X         
--B     	1         	B     	Y         
select m.m1, m.m2, s.s2
from m,s
where m.m1 = s.s1;
--�� ������ �ǵ��� �����ʴ°� ����
--ANSI ���� (�� ������ ������)--
--where (from ������)
--where JOIN�� ���ǰ� �Ϲ� ������ ȥ���ϸ� ȥ��������
--JOIN�� ������ �и����� >> ON ��
select *
from m INNER JOIN s -- INNER JOIN�� ������� ����. inner�� ��������
ON m.m1 = s.s1; --���� �����̶�� �����͸� �̾��ּ��� : ����� ����

--�� ���� : �� �޿��� ��޿� ���ϴ����� ���Ҷ�.. 
--�ƿ� ��ĭ�� ��ĭ�� ������ �񱳰��� �ƴ� �ƽøذ� �̴ϸ� ���̿��� ��� ���ϴ��� ���� ����..

--���̺��� ��Ģ : ������ �ִ¸�ŭ ������
--�ѱ����� �� ������ ����Ʈ�� ��������.. �������濡�� �Ҹ�
--�����ʹ� ������ �þ ������ �����ϰ� �ؾ���. �׷��� ������ �ɰ�����! 

--�����ȣ, ����̸�, ����μ���ȣ, ��� �μ����� �˰� �;��
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp join dept
on emp.deptno = dept.deptno;

--�ٵ� �̰� �ʹ�����! �Ҷ� ��Ī�� ���� �� �ִ�
--Join ���̺� ����Ī �ο��� �� �� �̸����� ����.
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on emp.deptno = dept.deptno;

--Join(2,3..)������ ���̺�
select m.m1, m.m2, s.s2, x.x2
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
--A == B, B == C, C == A

--Ansi ����
select *
from m join s on m.m1 = s.s1 
       join x on s.s1 = x.x1;
--     join y on x.x1 = y,y1;

--HR�������� �̵�
select * from employees;
select * from departments;
select * from locations;
--1. ���, �̸� (last_name) ,�μ� ��ȣ, �μ� �̸��� ����غ�����
select e.employee_id, e.last_name, e.department_id,0 ,d.department_name -- 107���ε� 106�� ��µ�
from employees e join departments d 
                 on e.department_id = d.department_id;
select *
from employees where department_id is null; --178 ����� �μ���ȣ�� null
--����θ����δ� �ذ� �Ұ� (outer join)����� �ذ�
--2. ���, �̸�(last_name), �μ� ��ȣ, �μ���, �����ڵ�, ���ø��� ����غ�����
select e.employee_id, e.last_name, e.department_id, 
       d.department_name, d.location_id,
       l.city
from employees e join departments d
                 on e.department_id = d.department_id
                 join locations l
                 on d.location_id = l.location_id;
--bit ����--
--2. �� ���� (non-equi join) -> �ǹ̸� ���� -> ����� ����
--�� ���̺�� �����Ǵ� ���̺� �ִ� �÷��� 1:1 ���ε��� �ʴ� ���

select * from emp;
select * from salgrade;

select * 
from emp e join salgrade s
on e.sal between s.losal and s.hisal;
--�ᱹ ���������δ� �����--
--�ȸ���°� ���ƿ�~ �ǽ����̶� �Ϻη� �������� ^^
--���������� ���� �� �� �����~

----------------------------------------------------------------------------------
--3. outer join (equi join + null)
--outer join (�������� �ľ�) >>�ְ� �Ǵ� ���̺� �ִ� ���� �����͸� ������� ���
--���� 3����
--1. left outer join (���� ����)
--2. right outer join (������ ����)
--3. full outer join (���� ���� + ������ ���� >> union)

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

--hr ��ȯ
select e.employee_id, e.last_name, e.department_id, d.department_name -- 107�� ��µ�
from employees e left outer join departments d 
                 on e.department_id = d.department_id;
                 
                 
--------------------------BIT ��ȯ--------------------------------------


--self join(�ڱ�����) ->�ǹ̸� ���� >> ������ ������� ���󰣴�.
--�ϳ��� ���̺��� Ư�� �÷��� �ٸ� �÷��� �����ϴ� ���
--����(���̺��� �Ѱ� �̻��̾�� �Ѵ�.)
--���̺��� ����Ī�� �޸��ؼ� ������ ���̺�ó�� ����Ѵ�.
select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.EMPNO;
--���� : �츮�� 14�� �ٵ� 13���� ����� ��µǾ���. �� ��� outer join�� ������ָ� �ȴ�.
--�����ڵ� �츮ȸ�� ����̴�. ������ ���̺��� ���� ���� �ʿ䰡 ���� ���������� ����ϸ� �ȴ�.



----------------- JOIN TEST -------------------
select* from emp;
select* from dept;
select* from salgrade;


-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
select e.ename, e.deptno, d.dname
from emp e join dept d on e.deptno = d.deptno;
 
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
select e.ename, d.dname
from emp e join dept d on e.deptno = d.deptno
where e.ename like '%A%';



-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
select e.ename , d.dname
from emp e join dept d on e.deptno = d.deptno
where e.sal >= 3000;
 
-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
select e.job, e.ename, d.dname
from emp e join dept d on e.deptno = d.deptno
where job = 'SALESMAN';

 
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
select e.empno as "�����ȣ" , e.ename as "����̸�", sal*12 as "����", (sal*12)+nvl(comm,0)as "�Ǳ޿�", sg.grade as "�޿����"
from emp e join salgrade sg on e.sal between sg.losal and  sg.hisal
where e.comm is not null;
 
-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d on e.deptno = d.deptno 
           join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = 10;
 
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
select e.deptno, d.dname, e.ename, sal, s.grade
from emp e join dept d on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
--where e.deptno between 10 and 20 ��! 10���� 20����!
where e.deptno in(10,20)
order by deptno asc , sal desc;
 
 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
select e.empno, e.ename, e.mgr, ee.ename
from emp e left join emp ee on e.mgr = ee.empno;

----------------------------------------------------------------------
--subquary (����Ŭ pdf 7�� 100page)
--sql�� �� >> sql ���� �ذ��
--�Լ� >> ���� >> subquery

--��� ���̺��� ������� ��� ���޺��� �� ���� �޿��� �޴� �����
--���, �̸�, �޿��� ����ϼ���.

select round(avg(sal),0) from emp;
select empno,ename,sal
from emp
where sal > 2073;

select *
from emp
where sal > (select avg(sal) from emp);

--subquery
--1. single row subquery : subquery�� ����� 1���� row�� ������(���ϰ�) : �Ѱ��� �� /�����÷� ���ϰ�
--2. multi row subquery : subquery�� ����� 1�� �̻��� row�� ������(�������� ��) /�����÷� ������ ��

--�����ϴ� ���� : ���Ǵ� �������� ����
--multi row (IN , NOT IN) (ANY , ALL)
--ALL(and�� �ؼ�) : sal > 1000 and sal > 2000 and ... (�ణ ������)
--ANY(or�� �ؼ�) : sal > 1000 or sal > 2000 or ...

--����(subquery)
--1.������ ��ȣ�ȿ� �־���Ѵ� (select avg(sal) from emp)
--2.�����÷����� ���� >> select sal, deptno from emp, >> (X) �����÷��� �ƴϸ�ȵ�. �ΰ��� �÷��߿� ��� ���� �� �Ǵ��� �� ����
--3.�ܵ����� ���� �����ؾ� �Ѵ�!

--���� ����
--1. ������ subquery ���� ����
--2. subquery�� ������� ������ main query ����

--������̺��� jones �޿����� �� ���� �޿��� �޴� ����� ��� �̸� �޿� ����ϼ���.
select empno, ename, sal
from emp 
where sal > (select sal from emp where ename = 'JONES');

select empno, ename, sal
from emp 
where sal > (select sal from emp where sal > 2000); 
-- subquary�� ���������� ������ �����ִ� select�÷����� �������Ƿ� �ȵ�

select empno, ename, sal
from emp 
where sal in (select sal from emp where sal > 2000); 
-- �ش繮���� �Ʒ��� ���� ����
-- where sal = 2975 or sal = 2850 or sal = 2450 or sal = 3000
select empno, ename, sal
from emp 
where sal not in (select sal from emp where sal > 2000);
--(������ and)
--where sal !=2975 and sal != 2850 and sal != 2450 and sal != 3000

--�������� �ִ� ���
select empno, ename
from emp
where empno in (select mgr from emp);
-- �������� ���� ���
select empno, ename
from emp
where empno not in (select mgr from emp where empno is null);

--king�� ���ӻ���� ����� ���, �̸�, ����, ������ ���
select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');

--20�� �μ� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ��� �̸� �޿�
select*
from emp
where sal > (select max(sal) from emp where deptno = 20);

--point
--subquery >> select ��
--         >> from 
--         >> where

select *
from emp
where deptno in (select deptno from emp where job = 'SALESMAN')
      and sal in (select sal from emp where job = 'SALESMAN');
      
--Quiz
--�ǹ� Ȱ��
-- �ڱ�μ��� ��տ��޺��� ������ ���� �޴� ����� ��� �̸� �μ���ȣ �μ��� ��� ����
select * from emp;

select avg(sal)
from emp
group by deptno;

-- from�� subquery ��� ����.. (�������̺�) 
select *
from emp e join(select deptno, round(avg(sal),0) as avgsal
                from emp group by deptno) s 
                on e.deptno = s.deptno
where e.sal> s.avgsal;