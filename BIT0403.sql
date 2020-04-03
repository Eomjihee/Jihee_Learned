
--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
SELECT ename, sal
from emp
where sal > (select sal from emp where ename like 'SMITH');

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.

--�̰� Ǭ�ſ��� 
select ename, sal, empno
from emp
where sal in (select sal from emp where deptno = 10);

--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename like 'BLAKE') 
      and ename not like 'BLAKE';

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.
select empno, ename
from emp
where ename like '%T%';

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
select ename, empno , sal
from emp
where sal > (select max(sal)
                from emp
                where deptno = 30);
--ALL�� Ǯ��
select ename, deptno, sal
from emp
where sal > all(select sal from emp where deptno = 30);
--��Ǯ����.
 
--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�.
select e.ename, e.deptno, e.job
from emp e join dept d on e.deptno = d.deptno
where d.loc like 'DALLAS';

select*
from dept;
--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.
select empno, ename, job
from emp e join dept d on e.deptno = d.deptno
where d.dname like 'SALES';
 
--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)
select e.ename, e.sal , e.mgr, ee.ename 
from emp e join emp ee on e.mgr = ee.empno
where ee.ename like 'KING';

select * from emp; 
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.
select ename ,deptno
from emp
where sal > (select round(avg(sal),0) from emp) and ename like '%S%';

select e.empno, e.ename , e.sal, e.deptno
from emp e join (select deptno
                from emp
                where sal > (select round(avg(sal),0) from emp) and ename like '%S%') s 
                on e.deptno = s.deptno;
--�� �ι� �������� �𸣰���..

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����
-- �̸�, ����, �μ���ȣ�� ����϶�.
select*
from emp
where comm is not null;

select*
from emp e 
where deptno in(select deptno from emp where comm is not null);
--�𸣰���

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
-- ������� �̸�, ����, Ŀ�̼��� ����϶�.

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

�⺻ �Լ� ~~���� �Լ�����
join (�ϳ��̻� ���̺��� ������ �������� : ���� ���̺� : ����)
subquery
*/

--[INSERT], [UPDATE], [DELETE]-- �翬�� �ϱ��ؾ���

/*
����Ŭ ����
DDL (������ ���Ǿ�) create , alter, drop, truncate (rename, modify)
DML (������ ���۾�) insert, update, delete   ������ O 20%
DQL (������ ���Ǿ�) select                   ������ O 70%
DCL (�����) ����(grant , revoke)            �����ڰ� �ϴ��� (DBA) (����͸�, ���, ����)
TCL (Ʈ������) commit, rollback, savepoint  ������ O

�����ڰ� �ϴ��� CRUD (create > DB�� ġ�� insert, READ > select, U > update , D > delete)
�����͸� ����� �а� ������Ʈ�ϰ� ������ �� �˸� ��
*/

-- DML (Ʈ����� : �ϳ��� ������ �۾�����. lock ������ ** �����߿� ** �ڹٷ� ġ�� ����ȭ.) 

--��ó�� ���� : ������ Ʈ������� ���ǰ� �ƴѰ���?
-- A��� ���࿡�� �� ���� B��� ���࿡ �Ա�
-- A : update .. 1000 > 500
-- B : update .. 1000 > 1500
-- �Ѵ� �����ϸ� commit
-- �� �� �ϳ��� �����ϸ� rollback

-- ������ ������ ���� �۾��� Ʈ������� ������ �� �ִ�.

select* from tab; --������ ����ڰ� ���� ��� ���̺� ���
-- create ���̺� �Ҷ� �̸��ߺ����� �ʴ��� Ȯ���Ҷ�

select * from tab where tname = 'BOARD'; --�������̺� �̹� ����
select * from col; --���� ���� col��
select * from col where tname = 'EMP'; -- emp���� ���� ���� col��
--�̷��ɷ� �� ���� DB���� ������� �߾�����
select * from user_tables;-- ������
select* from user_tables where table_name = 'DEPT';
----------------------------------------------------------------------------
--DML (����Ŭ pdf 168page �� 10��)
create table temp(
    id number primary key, -- id�÷����� not null �� unique�� �����͸� ���� �� �ִ�.
                           -- ȸ�������� �� �ߺ����� �� �ʼ��Է°� ����
    name varchar2(20)
    --default null�� ���
);
select *from temp;
/*
���� Ÿ��
char(20) >>20byte >> �ѱ� 10��, ������ 20�� >> �������� ���ڿ�
varchar2(20)>> 20byte >> �ѱ� 10��, ������ 20�� >> �������� ���ڿ�

char(20) >> "ȫ�浿" >> 6byte >> [ȫ�浿       ] >> 20byte
varchar(20) >> "ȫ�浿" >> 6byte >> [ȫ�浿] >> 6byte

ex) �������� ������ : ��, �� : char(2)
    �������� ������ : �̸�...
    
    �������� ���� : char() > varchar()�켱....
    �׷��� �츮�� �ؾ��ϴ� ����? �������� �����ʹ� �����ϸ� char()�� ���°��� �̵�.
    
    �ѱ� ���� (unicode : 2byte) >> �ѱ�,  ������, Ư������, ����
    nchar(20) >> 20���� >> ���ڼ� ���� >> �� byte >> 2*20 >> 40byte
    nvarchar(10) >> 10���� 
*/
select *from temp;
--1. ���� �Ϲ����� insert
insert into temp(id,name)
values(100, 'ȫ�浿');
--�� �ݿ�
commit;
--2. �÷� ��� ���� (�÷� ����Ʈ ���� ����������.. ����������)
insert into temp
values(200, '������'); -- ������ �÷��� ��� �÷� ����, ���� �� ���������

--1. ���� ��Ȳ
insert into temp(id, name)
values(100,'�ƹ���'); -- �ߺ��� ����. id number primary key �̱� ������ null�ȵǰ� �ߺ��� �ȵ�.
--ORA-00001: unique constraint (BIT.SYS_C007003) violated

insert into temp(name)
values('�ƹ���'); --ORA-01400: cannot insert NULL into ("BIT"."TEMP"."ID")
------------------------------------------------------------------------------------------
--�Ϲ� sql ���� ���α׷��� ��� (x)

--PL-SQL (���) ���α׷����� ���(���, ����)
--PL-SQL
create table temp2(id varchar2(20));
--������ �׽�Ʈ .. ������ 1000�� 1000�� �����ؾ��ϳ���?
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
    name varchar2(10), --null ���
    regdate DATE default sysdate -- �⺻ �� �����ϱ� (��¥ insert ����������..)
);

select sysdate from emp;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name , regdate)
values(100,'ȫ�浿', '2020-04-03');
commit;
insert into temp3(memberid, name)
values(200, '�ƹ���');
select *from temp3;
commit;

insert into temp3(memberid)
values(300);
select *from temp3;
--300		2020-04-03 12:15:26

insert into temp3(name)
values('�̸���');
--ORA-01400: cannot insert NULL into ("BIT"."TEMP3"."MEMBERID")

--insert (TIP)
--1. �뷮 ������ insert�ϱ�
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

--�䱸���� : temp4�� �ִ� ��� �����͸� temp5�� �ְ�;��
--insert into ���̺�� (�÷�����Ʈ) values(������Ʈ)
--insert into ���̺�� (�÷�����Ʈ) select ��(�÷�����Ʈ�� ������ Ÿ�� ����) ����
insert into temp5(num)
select id from temp4; --<<<�ܿ�!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

select *from temp5;

--2. insert tip
--���̺� ���� ��Ȳ���� [���̺� ����] + [�뷮 ������ ����]
--�� ���簳��(���� ������ ���� �ȵſ� PK, FK)
--������ ���̺� ���� (�÷� �̸� , Ÿ��) ����

--create table copyemp ~
create table copyemp --emp���� ������ ����� ������ ����
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
--���� :  ����(Ʋ) �� �����ϰ� ������ �����ϰ���� �ʾƿ�
create table copyemp3
as
    select * from emp
    where 1=2; --������ false ����
select * from copyemp3;

-----------------------[insert end]----------------------
--[update]
/*
update table_name
set colum1 = value1, column2 = value2...
where ����

update table_name
set column1 = (subquery)
where ����
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

--�������� �÷��� update
update copyemp
set ename = 'AAAA' , job = 'BBBB', hiredate = sysdate, sal = 1111
where deptno = 10;

select * from copyemp where deptno= 10;
commit;
-------------------------------[update end]-------------------------------
--[DELETE]
--��Ģ >> delete -> commit , rollbact -> ���� �Ұ� ->�� ����ߴٸ� ����
delete from copyemp;
select *from copyemp;
rollback;
delete from copyemp where deptno in(10,20); --deptno = 10
select * from copyemp where deptno in(10,20);
commit;
------------------------------[DELETE END]--------------------------------
/*
app(JAVA) -->JDBC API(�ڹ� �����ͺ��̽� Ŀ�ؼ� API) -->       ORACLE (DB)

CRUD
create : insert
read : select
update : update
delete : delete

DML:(insert, update, delete)Ʈ�����(commit, rollback)
JDBC -> Oracle -> EMP���̺� �۾�
--��ü ��ȸ(�Լ�)
--���� ��ȸ(�����)(�Լ�)
--����(�Լ�)
--����(�Լ�)
--����(�Լ�)

--JAVA
--public List<Emp> getEmpAllList() {String sql = "select * from emp" };
--public Emp getEmpListByEmpno() {String sql = "select * from emp where empno = 777" };
--public int insertEmpData(Emp emp) {String sql = "insert into emp()..." };

*/
------------------------------------------------------------------------------------------------
--[DDL]
--create, alter, drop (���̺����)
select * from tab;
select * from tab where tname = 'BOARD';
--����� ����� ����. DELETE���� ���� �ܰ�
drop table board;

create table board(
    boardid number,
    title nvarchar2(100),
    content nvarchar2(2000),
    regdate date
);

--�л����� ���̺�
--����, ����, ����, ���� �÷�
--����, ����, ���� ������ ������ �ڵ����� ������ ���Ǹ� ���
--ORACLE 11g ����(���� �÷�(�����÷�))
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

--�÷��� ���� ����
select column_name, data_type, data_default
from user_tab_columns where table_name='VTABLE';
--NO3	NUMBER	"NO1"+"NO2"

--�ǹ����� Ȱ��Ǵ� �ڵ�
--��ǰ ���� (�԰���) .. �б⺰ ����(4�б�)
--�԰��� : 2020-03-01 >> 1�б� ������ 
--��¥�� ������ �ڵ����� 1�б� �����ͷ� ����;�
create table vtable2
(
    no number, --����
    p_code char(4), --��ǰ �ڵ�(A001, ...)
    p_date char(8), --�԰���
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