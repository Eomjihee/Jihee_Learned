/*
�ǽ�ȯ�� �����ϱ�

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



--��� ���̺��� ��� �����͸� ����ϼ��� (��ҹ��� �������.)
select*FROM emp; --���������� ��ҹ��� ���� ���Ѵ�.

/*

1.2 Syntax
SELECT [DISTINCT] {*, column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
DISTINCT �ߺ� �� ���� �ɼ�
* ���̺��� ��� column ���
alias �ش� column �� ���� �ٸ� �̸� �ο�
table_name ���̺�� ���� ��� ���̺� �̸�
WHERE ������ �����ϴ� ��鸸 �˻�
condition column, ǥ����, ��� �� �� ������
ORDER BY ���� ��� ������ ���� �ɼ�(ASC:��������(Default),DESC ��������)

*/

--2.Ư�� �÷� ������ ����ϱ�
SELECT empno, ename, sal from emp;
SELECT ename from emp;

--3.�÷��� ����Ī(��Ī, �г���, alias)�ο��ϱ�
    SELECT empno as "  ��   ��   ", ename as "  ��   ��   "
from emp; --���͸� �ĵ� ��� ����. ;�� ������ ������ ǥ��.
--�⺻������ alias name���� ""�� ���δ�. �׷��� �ϳ��� ���ڿ����� �����Ѵ�. ���� ������ �ƴ�(as�� �������� ������).

--����(ǥ��) (ansi ����) : SELECT empno as "  ��   ��   ", ename as "  ��   ��   "

--Oracle ������ ���� (���ڿ� : �����ϰ� ��ҹ��� ����)
--���ڿ��� ǥ��('���ڿ�')
--�ҹ��� 'a' �� �빮�� 'A'�� �ٸ� ���ڿ��̴�.

SELECT empno, ename
from emp
where ename = 'KING';
--emp table���� ename�� king�� ����� empno�� ename�� �������

--Oracle SQL ��� : ������(���� ������(||), ��� ������(+)) ����
--java�� + (���� + ���� >> ����)
--java�� + (���ڿ� + ���ڿ� >> ����)
--TIP) ms-sql������ (+�� ����� ���� ����� ��� ������ �ִ�)

select '����� �̸���'||ename||'�Դϴ�' as"�������" 
from emp;

--empno, ename >> �÷� >> Ÿ��
--Ÿ�� (�ڷ���) : ����, ����(���ڿ�), ��¥

--table�� �⺻ ���� ���(�÷���, null�� ����ϴ���, Ÿ������)
desc emp;
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) @@����κ� ���� ��ħ
JOB               VARCHAR2(9)  : �ڹ��� ���ڿ�
MGR               NUMBER       
HIREDATE          DATE   : �ڹ��� ��¥      
SAL               NUMBER : �ڹ��� ����      
COMM              NUMBER       
DEPTNO            NUMBER  
*/

select empno||ename
from emp; -- empno�� ���� �����Ϳ� ename�� ���� �����͸� �����ϰڴ�.
--(����Ÿ�԰� ���ڿ��� ���յ�) > ���������� ����Ÿ���� ���ڿ��� �ٲ� ���յ�

select empno + ename -- �����߻�. ����Ŭ���� +�� ������꿡 ����
from emp; 
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

--�츮 ȸ���� ������ ���� ���ϱ�
SELECT job from emp; -- �̷��� �����ָ� ��� ������� ������ �����Ǳ⸸ �Ѵ� �ߺ� ���� �ȵ�

SELECT DISTINCT job from emp; -- distinct : �ߺ������͸� �����ϴ� Ű����

SELECT DISTINCT job, deptno from emp ORDER by job;
--�������� deptno�� �ߺ����� �ʵ��� ������ ������
--distinct�� ������ �׷����̴�. �ϴ� ���� �� ���� �׷��� ��´�. 
--�ϴ� job���� �׷��� ���� �� �ȿ��� deptno�� �������� �ٽ� �׷��� ��� ���� ���.
--distinct : grouping�� ���� �����͸� ó���Ѵ�.

select DISTINCT job, deptno from emp order by job;
select distinct deptno, job from emp order by deptno;

--Oracle ���
--Java ���
--Oracle �����ڰ� Java�� ���� ����(+, *, - ...)
--% �ڹٿ����� ������, % ����Ŭ������ �˻����� �������̴�.

--����Ŭ�� ������(+, -, *, /) �������Լ� >> Mod()

--������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���
select empno, sal, sal+100 as "�λ�޿�" from emp;
--sal�� data�� ����Ÿ���̱� ������ ������ ������.


--dual �ӽ����̺�
select 100 + 100 from dual; --dual�̶�� �������(�ӽ����̺�)�� ��Ƽ� ����Ѵ�.
select 100 || 100 from dual; --���������� ����ȯ�� �Ͼ��  ���ڿ� || ���ڿ� �� ����� ���´�.
select '100' + 100 from dual; -- +�� ������ ���������. ���� ����� ������ ���·� ����ȯ�� ��Ų��.
select '100A' + 100 from dual; -- �̰� �������� �ڵ�. 100A�� ���ڿ��̴�.

--�񱳿�����
-- > < <=
--java�� ���� (==) �Ҵ�(=)
--Oracle�� �Ҵ��� ����. ���� ����(=), ���� �ʴ�(!=).

--��������
--AND, OR, NOT


--������(���ϴ� row�� �������ڴ�.)
select*
from emp
where sal >= 3000; -- ������̺��� �޿��� 3000�޷� �̻��� ��� ������ ����ض�

select empno, ename, sal
from emp
where sal > 3000; --�����ͺ��̽������� ������ �� �߻����� �ʴ´�.


--�̻�, ���� (= ����)
--�ʰ�, �̸� (= �������� ����) : �������� �� �ܾ���� ����� �����ؼ� ������ �ʴ´�.
--���� �� ������ Ȯ���� �ؾ��Ѵ�.

--����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���
--SELECT*
--from emp
--where empno = 7788; �̷��� ���� ����ؼ� �Ի����� �÷����� ���� Ȯ���Ѵ�.

select empno, ename, job, hiredate
from emp
where empno=7788;
--������� :  from(��������) > where(�Ÿ���) > select(���ϴ� ���� �̾Ƴ���)

--DB�� 4���� ���� ������, ������, 
--Ʃ��(���ӱ�. ������ ���� �׿����Ѵ�. �ܼ� ���ηδ� �� �� ���� ���� ������ �ʿ��ϴ�. ������ ������ �������� �ľ��ؾ��Ѵ�.), 
--����(���ӱ�)


--����� �̸��� king�� ����� ���, �̸�, �޿� ������ ����ϼ���
select empno, ename, sal
from emp
where ename = 'KING'; -- ������Ÿ���� ��¥ �Ǵ� ������ ��쿡�� ''�� ���δ�.


--��(AND, OR)
--�޿��� 2000�޷� �̻��̸鼭 ������ manager�� ����� ��� ������ ����Ͻÿ�.

select*
from emp
where sal >= 2000 AND job = 'MANAGER'; --manager��� �ϸ� �ȳ���. ��ҹ��� ����.

--�޿��� 2000 �޷� �̰ų� ������ manager�� ����� ��� ������ ����Ͻÿ�.
select*
from emp
where sal >= 2000 OR job = 'MANAGER';


--����Ŭ ��¥(DB server�� ��¥)
--����Ŭ ��¥ �Լ� (sysdate)
select sysdate from dual; -- ��¥ ������ ���»���� ������ �ٲ� �� �ִ�.



--���� ������ ����ڰ� ��¥ ������ 'YYYY-MM-DD HH24:MI:SS'�̷��� ������ �����ϰڴ�.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select* from SYS.nls_session_parameters; --system ������ ������ �ִ� ȯ�� table
--NLS_DATE_FORMAT	YYYY/MM/DD �⺻����
--NLS_LANGUAGE	KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select sysdate from dual; --2020-03-31 14:37:56
--������ ������ �ٽ� ������ ���� �������� �����ȴ�.

select hiredate from emp;


--�Ի����� 1980�� 12�� 17���� ����� ��� ������ ����Ͻÿ�.

select*
from emp
where hiredate = '1980-12-17';

select*
from emp
where hiredate = '80/12/17';
--������ RR-MM-DD ���� YYYY-MM-DD�� �ٲ�� ������ ���������� �ڷ�� �˻��� �� ����.


--����� �޿��� 2000�޷� �̻��̰� 4000�޷� ������ ��� ����� ������ ����Ͻÿ�

select*
from emp
where sal >= 2000 AND sal <= 4000;

--������ : between A and B(���ǻ��� : =�� �����ϰ� �ִ�. �̸�, �ʰ������� ������)
select*
from emp
where sal between 2000 and 4000;

--����� �޿��� 2000�޷� �ʰ��̰� 4000�޷� �̸��� ��� ����� ������ ����Ͻÿ�
select*
from emp
where sal > 2000 AND sal < 4000;


--�μ� ��ȣ�� 10 �Ǵ� 20 �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ�� ����Ͻÿ�

 select empno, ename, sal, deptno
 from emp
 where deptno = 10 or deptno = 20 or deptno = 30; -- ������ ���
 
 --in ������
 select empno, ename, sal, deptno
 from emp
 where deptno in (10,20,30); -- �̷��� ������ ���� ���� ����ó�� Ǯ� �۵���Ŵ
 --in �����ڸ� Ǯ�����
  select empno, ename, sal, deptno
 from emp
 where deptno = 10 or deptno = 20 or deptno = 30; 


--�μ���ȣ�� 10�Ǵ� 20�� �ƴ� ����� ���, �̸�, �޿�, �μ���ȣ ���

select empno, ename, sal, deptno
from emp
where deptno != 10 AND deptno != 20;

--IN�� ������  NOT IN(�������� and)
select empno, ename, sal, deptno
from emp
where deptno not in (10, 20);


--POINT : Oracle �� ǥ�� (�����Ͱ� ���� = null)
--null �ʿ��

create table member( --������ �̸��� Ŭ������ ���� �Ͱ� �Ȱ��� �۾�
    userid varchar2(20) not null, -- 20�̶� ���ڴ� byte 20byte���� �� �� �ִ�. not null > �ʼ��Է� 
    name varchar2(20) not null, --�ʼ��Է�
    hobby varchar2(50) -- default�� null�� �ٴ´�(null���� ����ϰڴ�, �����͸� ���� �ʾƵ� �ȴ�.)
    
    );

select* from member;
--insert into member(userid, hobby) values('hong','���ڱ�');
insert into member(userid, name) values ('hong','����');
--hobby �÷��� �����ʹ� �ڵ� null

insert into member(userid, name, hobby) values ('hong','����','���ڱ�');
--�÷����� ������ �� �ִµ�, �׷� �Է°��� �÷� ������� ����. �׸��� �ϳ��� ������ ���� �ʴ´�.

--�ǹݿ� �ؾ� �����Ͱ� ���������� ���´�. 
--�ǹݿ� ���� ������ ���α׷��� ���� Ű�� �������. Ȥ�� �ٸ������ �� �� ����.
commit;

--������ ���� �ʴ� ��� ����� ������ ����ϼ���
--0�� �����ͷ� ����Ѵ� (�޴� ���ǿ� ����)
--select*
--from emp
--where comm = null; --�� ����� ���� ���� �̷��� null�� ������.. null�� ������ �ٸ���

select* from emp where comm is null; --null�� �񱳴� is null/is not null�� �ؾ��Ѵ�.

--������ �޴� ��� ����� ������ ����ϼ���
select* from emp where comm is not null;

--��� ���̺��� ���, �̸�, �޿�, ����, �ѱ޿��� ����ϼ���
--�ѱ޿� (�޿�+����)

select empno, ename, sal, comm, sal+comm as "�ѱ޿�"
from emp; --null ������ �ѱ޿��� ����� ������ �ʴ´�.

--@@@@@@@@@@@@POINT >> null
--1.null���� ��� ������ �� ����� null�̴�.
--2.�� ���� �ذ� : nvl(), nvl2() >> null���� �ٸ� ������ �ٲ��ִ� �Լ�, replace�ϴ� �Լ�
--Tip) ms-sql : convert()
--      my-sql : IFNULL()

select null + 100 from dual;
select '����'||null from dual; -- �̰� �����̱� ������  null��  �ǹ̰� ����.
select 100 + nvl(null,0) from dual;

select comm, nvl(comm, 1111) from emp;

select empno, ename, sal, comm, nvl(comm,0) + sal as "�ѱ޿�" --nvl()�� ���� ��ġ �����ϱ�
from emp;

--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ����Ͻÿ�

select empno, ename, job, sal, comm
from emp
where sal >= 1000 AND comm is null; -- nvl2()�� ������ �ϳ� �� �Ŵ� ���̴�.

----------------------�⺻ �Ϸ�------------------------------------------------------

--DQL(data query language) : select     (60%)
--DDL : create, alter, drop(��ü(���̺�) ����, ����, ����)     (30%)
--DML : insert, update, delete(������ ����)      (10%)
--�̰� ������ ���� ������.

--java : class Board { private boardno int }
--Oracle : create table Board (boardno number not null)

create table board( --���̺�ȿ��� �÷���, Ÿ���� ����
    boardid number not null, --����, �ʼ��Է�
    title varchar2(20) not null, --�ѱ� 10��, ������, Ư������, ���� 20�� �ʼ� (������ �ѱ��� 3byte��°� �־ Ȯ���ؾ��Ѵ�.)
    content varchar2(2000) not null, -- �ʼ��Է� ( ������ DB�� �ö��� �ʰ� ���ϵ忡 �ø� �� ��θ� �����´�)
    hp varchar2(20) --default�� null���(�ʼ��Է��� �ƴϴ�)
);

select*from board;
--desc board;


--DML(������ ���۾�) �� �ݿ� ���θ� ����
--insert
--update
--delete
--�̷� �۾��� �ϸ� �ݵ�� �� ����� �ݿ����� ��������� �����ؾ��Ѵ�.
--�̷��� �ǻ������ �ٷ� commit(���� �ݿ�)�� rollback(�ݿ� ���)�̴�.

insert into board(boardid, title, content)
values(100,'����Ŭ','��ſ� ����Ŭ');
insert into board(boardid, title, content)
values(200,'�ڹ�','��������');

commit;

select*from board;

rollback; -- commit�ϱ� �� ������ data ����, ������Ʈ, ������ �ǵ����� ���

insert into board(boardid, title, content)
values(200,'�ڹ�','�׸���');

drop table board;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual;


insert into board(boardid, title, content,hp)
values(300,'����','������','010-0000-0000');

select*from board;

commit;

select boardid, nvl(hp,'empty') as "hp" from board; -- hp�÷����� null���� ������ empty��� ����ض�

--���ڿ� �˻�
--�ּҰ˻� : [��] �Է� >> ���ﵿ, ����, ����� �� ����.(Like ���� �˻�)
--���ڿ� ���� �˻� ������ : like
--like ������ ����(���ϵ�ī�� ����(% : ��� ��, _ : �ѹ���)�� ����)

select ename
from emp
where ename like '%A%'; --ename�� data�߿� A�� �����ϴ� ��� ��� �˻�.


select ename 
from emp where ename like '%a'; -- ���ڿ� �˻������� ��ҹ��ڸ� �����Ѵ�
--(����Ŭ�� ���ڿ� �����Ϳ� ���Ͽ� �����ϰ� ��ҹ��ڸ� �����Ѵ�.)

select ename
from emp where ename like 'A%';

select ename
from emp where ename like '%S';



select ename
from emp where ename like '%LL%'; -- LL �پ��־�� ��

select ename
from emp where ename like '%L%L%'; -- L 2�� ������ ok

select ename
from emp where ename like '%A%A%';

select ename
from emp where ename like '_A%'; --ù ���ڴ� � ���� �͵� �������, �ι�° ���ڴ� �ݵ�� A, A �ڷδ� �ƹ��ų� �͵� ��.
--A��� ������ �ڸ����� ����� ��. /  _ : �ѹ���


--����ǥ���� (java, db, script���� ��� ����)
--regexp_like
select * from emp where REGEXP_LIKE(ename,'[A-C]'); --�̷��� ����ǥ������ ������ ���� �˻��� �����ϴ�.
--����ǥ�� ���� 5�� ����� (���� ���� ���� ����, ���� ���� ����)

-------------------------------------------------------------------------------

--������ �����ϱ�
--order by �÷��� : ���ڿ�, ����, ��¥ ���İ���
--�������� : asc : ������(��������) (default)
--�������� : desc : ������

select * from emp
order by sal asc; -- sal�� �������� asc�� ����, asc�� �����ϸ� default�� ���ĵȴ�.

--�޿��� ���� �޴� ������ �����ؼ� ���
select * from emp order by sal desc;


--�Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի��� �����͸� ����ϱ�
select empno, ename, sal, hiredate
from emp
order by hiredate desc;
/*
select      3
from        1
where       2
order by    4

DB�� ���� �Ⱦ��ϴ� �۾��� �����۾�.
select�� ����� �����ϴ� ���� �ξ� ȿ�����̴�.
������ ����� �ּ������� �ٿ��� ������ �����Ѵ�.
3������ ���� �����غ��� ������ ���ٸ� order by�� �߰��ϸ� �ȴ�. ������ϱⰡ ��������
*/

select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;
--emp���̺��� ������ �Ŵ����� ������ ���, �̸�, ����, ����, �Ի����� �̾� �Ի����� �ֱ��� �������� �����Ͻÿ�.

--order by �÷��� desc, �÷��� asc, �÷��� desc
select job, deptno
from emp
order by job asc, deptno desc; --�ɷ��� ������ ���ٸ� where���� ���� ����
-- emp���̺��� ������ �μ���ȣ�� �̾� ���� �������� �������� ������ ��, ���� �����̸� �μ���ȣ�� �������� �ٽ� �������� �����Ͻÿ�.
--grouping ����. grouping�� �� �� �� �׷� �ȿ��� �ٽ� �������ش�.
--���� ���� �ڵ��û ���� ��.

---------------------------------------------------------------------------------------

--������
--������(union) : ���̺�� ���̺��� �����͸� ��ġ�� �� (�⺻ : �ߺ��� ����)
--������(union all) : ���̺�� ���̺��� �����͸� ��ġ�� �� (�ߺ��� ���)


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

--union ��Ģ
--1. �����Ǵ� �÷��� Ÿ���� �����ؾ��Ѵ�.

select empno, ename from emp
union
select dname, deptno from dept; -- ���� ���� ��ٸ��� �ִ� ��. �ڿ� ���� ����� ��.
--���� �߻� �ڵ�. "expression must have same datatype as corresponding expression"
--deptno�� �������ε� �������� ename�� �ڸ��� ������ �ؼ� �߻��� ����

select empno, ename from emp
union
select deptno, dname from dept;
--�̷��� �ٲ��ָ� empno,deptno�� ¦, ename,dname�� ¦�� �ż� �������� ����ȴ�.

--2.�����Ǵ� �÷��� ������ ����(null�� ������ �� �ִ�!)
select empno, ename, job, sal from emp
union
select deptno, dname, loc, null from dept; --dept�� �÷��� 3�� ���ε� ���� 4�� �غ��س����� ������ �߻�

--�ǹ������� subquery�� ����Ѵ�. (in line view)
select*
from (
    select empno, ename, job, sal from emp
    union
    select deptno, dname, loc, null from dept
    ) order by empno desc;
--�������̺�(�Ұ�ȣ)�� ���� ����ϸ� �� �ڿ� order by �� �ٿ� �� �� �ִ�. union�� ����� ������ ���.

------------------------------------------��������� �ʺ� ������(�ǹ�����) ���̺� �Ѱ�(���� ���̺�)--------

--���ݺ��� ����Ŭ�� �Լ��� ��� ���̴�.
/*
 ���� �� �Լ��� ���� 
 1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�. 
 -2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�. 
 3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ��� �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�. 
 4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�. (to_char(), to_number(), to_date())
 5) �Ϲ����� �Լ� : NVL, DECODE 
*/
/*
�ѱ� ����. ���� ���浵 ����. ���� ����
select * from SYS.nls_database_parameters;
--NLS_CHARACTERSET   AL32UTF8  �ѱ� 3byte �ν�
--KO16KSC5601 2Byte (���� ��ȯ�ϸ� �ѱ� �ٱ���)
select * from SYS.nls_database_parameters where parameter like '%CHAR%';    
*/

--���ڿ� �Լ�
select initcap('the super man') from dual; -- ���� �ܾ� ù���� �빮�ڷ� ��ȯ

select lower('AAA'), upper('aaa') from dual; -- ���� �빮�ڸ� �ҹ��ڷ� �ҹ��ڸ� �빮�ڷ� ��ȯ
select ename, lower(ename) as "ename" from emp; -- �÷��� �����ϱ�
select* from emp where lower(ename) = 'king'; -- �÷� ������ �ҹ��ڷ� �ٲ㼭 �˻��ϱ�

--���ڿ� ����
select length('abcd') from dual; -- 4��
select length('����Ŀ��') from dual; -- 5�� > �ѱ۵� ���밡��
select length(' ��m �� ��') from dual; -- ���鵵 1�ڷ� �ν��Ѵ�.

--���� ������ ||
--���� �Լ� : concat()
select 'a' || 'b' || 'c' as "data" from dual; --�����ڸ� ����� ����
select concat('a','b','c') from dual;--"invalid number of arguments" parameter 2���� �Է� ����.
--���� �����ڰ� �� �����ϴ�.
select concat(ename, job)as "concat" from emp;--�����Լ�
select ename || ' : ' || job as "||" from emp;--���տ����ڴ� parameter�� ������ ��� �߰��� �����̳� �ٸ� ���ڸ� ���� �� �ִ�.

--�κ� ���ڿ� ����
--java(substring)
--Oracle(substr) >> java�� ��Ģ�� ���� �ٸ���. parameter���� �ε����� �ƴϴ�.
select substr('ABCDE',2,3) from dual;-- (���,������ġ,������ġ���� ����� ���� ������(�ڱ� �ڽ��� ����))
select substr('ABCDE',1,1) from dual;
select substr('ABCDE',3,1) from dual;
select substr('ABCDE',3) from dual;--CDE / � ���� ������ ���������� ������ �� ������ �� ��µȴ�.
select substr('ABCDE',-2,1) from dual;--D / -�� ������ �������� ����
--���� substring�� ���ǰ� �� �ٸ���. ���� �����ϱ�

--������̺��� ename �÷������Ϳ� ���� ù���ڴ� �ҹ��ڷ� �������� �빮�ڷ� ����ϼ���
--��, �� ����� �ϳ��� �÷����� ����ϰ� �÷��� �̸��� fullname, ù���ڿ� ������ ���� ���̿� ���� �ϳ��� �־ ����Ͻÿ�.
--  select lower(substr(ename,1,1))|| ' ' || upper(substr(ename,2)) as "fullname" --������ �̸� �� �빮��
    select lower(substr(ename,1,1))|| ' ' || substr(ename,2) as "fullname"
    from emp;
--������ ���� ��쿡�� concat�� �ᵵ �ȴ�.

--lpad, rpad(ä���)
select lpad('ABC',10,'*') from dual; --*******ABC (ǥ���� ���ڿ�, ��ü����,�� ���� ä�� ����)
select rpad ('ABC',10,'^') from dual; --ABC^^^^^^^

--Quiz
--����ں�� : hong1006
--ȭ�� : ho****** ����ϰ� �;��

select rpad(substr('hong1006',1,2), length('hong1006'),'*') as "password" from dual;

--emp ���̺��� ename �÷��� �����͸� ����ϴµ� ù���ڸ� ����ϰ� �������� *�� ǥ���ϱ�
select rpad(substr(ename,1,1),length(ename),'*') as "ename" from emp;


create table member2(
    id number,
    jumin varchar2(14)
    );
    
insert into member2(id, jumin) values(100,'123456-1234657');
insert into member2(id, jumin) values(200,'234567-1234657');
commit;
select* from member2;

--�ϳ��� �÷����� ������� ���. 
--100 : 123456-*******
--200 : 234567-*******
--��°���� �÷� ���� "juminnumber"

select id || ' : ' || rpad (substr(jumin,1,7), length(jumin), '*') as "juminnumber"
from member2;

--rtrim�Լ� : ������ ���ڸ� ������.  ltrim�� ����
select rtrim('MILLER','ER') from dual; --MILL
select ltrim('MILLLLLLLLER','MIL') from dual; --ER �ߺ����� ���� �����ش�! �����ϱ�

select '>' || rtrim('MILLER                 ',' ') || '<' from dual;
select '>' || rtrim('               MILLER                 ',' ') || '<' from dual; --������ ������ �������� �ʴ´�.


--ġȯ�Լ� (replace)
select ename, replace(ename,'A','rainbow A') from emp;

------------------------------------���ڿ��Լ� END--------------------------------------------------

--[���� �Լ�]
--round(�ݿø�)
--truc(�����Լ�)
--mod(�������� ���ϴ� �Լ�)


-- .....-3  -2  -1  0  1  2  3  ....
select round(12.345,0) as "r" from dual; --parameter�� 0�� ��, �����θ� ���ܶ� : 12
select round(12.567,0) as "r" from dual; -- : 13(�ݿø���)
select round(12.345,1) as "r" from dual; --parameter�� 1 �� ��, �Ҽ��� ���� ù��° �ڸ������� ���ܶ� :12.3 
select round(12.567,1) as "r" from dual; --12.6

select round(12.345,-1) as "r" from dual; --.�� �������� 2��° �ڸ����� �ݿø�
select round(12.567,-1) as "r" from dual;


select trunc(12.345,0) as "r" from dual; --parameter�� 0�� ��, �����θ� ���ܶ�: 12
select trunc(12.567,0) as "r" from dual; -- : 13(�ݿø� �ȵ�)
select trunc(12.345,1) as "r" from dual; --parameter�� 1 �� ��, �Ҽ��� ���� ù��° �ڸ������� ���ܶ� �ݿø� �ȵ� :12.3
select trunc(12.567,1) as "r" from dual; -- �ݿø� �ȵ� 12.5

select trunc(12.345,-1) as "r" from dual;
select trunc(12.567,-1) as "r" from dual;

--������ ���ϱ�
select 12/10 from dual;
select mod(12,10) from dual; -- 2 (������.. �Լ��� ����)
select mod(0,0) from dual; --0

----------------------------------�����Լ� ��------------------------------------
--��¥�Լ�
select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--Date + Number >> ��¥�� ���. Date
--Date + Number >> Date
--Date - Date >> >> Number (�ϼ�) (�ټ��ϼ� ������...)
select hiredate from emp;
select months_between('2018-01-01','2010-01-01') from dual;

select MONTHS_BETWEEN(SYSDATE,'2010-01-15') from dual;
select round(MONTHS_BETWEEN(SYSDATE,'2010-01-15'),1)from dual; -- ���������� ���� 122.565016427718040621266427718040621266
--122.6 round������
--point
--��¥ ������ ���ڿ��� ��¥�� �ٲٴ� �Լ� (to_date())
select to_date('2020-04-01') + 100 from dual;
select sysdate+1000 from dual; --2022-12-27
select sysdate-to_date('2013-07-23') as "�ɺ��� ���� ��" from dual;

--Quiz
--1. ������̺��� �Ի��Ͽ��� ���糯¥������ �ټӿ���
-- �ټӿ����� ������ �ݿø� ����
--2. �Ѵ��� 31�̶�� ���ؿ��� �ټ� ����
-- �Լ� ������� ���� >> ��¥ - ��¥ >> 150��

select ename, trunc(MONTHS_BETWEEN(sysdate,hiredate),0) as "�ټӿ���"
from emp;
select ename, hiredate, trunc((sysdate- hiredate) / 31,0) as "�ټӿ���"
from emp;

--[��ȯ �Լ�]: Today Point
--����Ŭ : ����, ����, ��¥
--to_char() : ���� -> ���ڷ� �ٲܶ� (1000 -> $1000) , 
--            ��¥ -> ����(2020-01-01 -> 2020�� 01�� 01��) format
--���� ���� ����

--to_date() : ���� -> ��¥ >> select '2020-12-12' + 100
--                          select to_date('2020-12-12')+100

--to_number() : ���� -> ����(���� �ڵ� ����ȯ)
select '100' + 100 from dual;
select to_number('100' + 100) from dual;
select '1' + 100 from dual; --
select to_number('1') + 100 from dual;

--to_char() : format >> ���� , ��¥ (���Ĺ���)
select to_char(sysdate) || '��' from dual; --2020-04-01 12:56:11��
select sysdate,
to_char(sysdate, 'yyyy') || '��' as "YYYY",
to_char(sysdate, 'mm') || '��' as "MM",
to_char(sysdate, 'dd') || '��' as "DD",
to_char(sysdate, 'dy') || '����' as "DY"
from dual; --2020-04-01 12:59:31	2020��	04��	01��	������

--�Ի���� 12���� ������� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ����ϼ���
select *
from emp
where to_char(hiredate,'mm') = 12;
select to_char(hiredate, 'yyyy"��" mm"��" dd"��"') from emp; --""�ȿ� �־������

--to_char() ���� -> ���ڷ� (���Ĺ���)
--pdf ���� 71������ ǥ
--100000 >> ��� >> $1,000,000 (����)

select '>'||to_char(12345, '999999999999')||'<' from dual;
select '>'||to_char(12345, '099999999999')||'<' from dual; --> 000000012345<
select '>'||to_char(12345, '$9,999,999,999')||'<' from dual;
select sal, to_char(sal,'$999,999') from emp;
--800	     $800
--1600	   $1,600

--hr�������� ��ȯ
select* from employees;
/*
������̺��� ����� �̸��� last_name, first_name���ļ� fullname ��Ī �ο��ؼ� ����ϰ� �Ի����� yyyy-mm-dd �������� ����ϰ�
���� (�޿�*12)�� ���ϰ� ������ 10%(����*1.1)�λ��� ���� ����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ����
�� 2005�� ���� �Ի��ڵ鸸 ����ϰ�, ������ ���� ������ ����ϼ���
*/

SELECT employee_id,
last_name || first_name as "fullname",
to_char(hire_date,'yyyy-mm-dd') , 
salary*12 ,
to_char((salary*12)*1.1,'$9,999,999,999')
FROM employees
where to_char(hire_date,'yyyy') >= '2005';
--bit�������� ��ȯ
---------------------------------��ȯ�Լ� (to_char(), to_date(), to_number())---------------------------------
--[�Ϲ� �Լ�(���α׷����� ����)]
--nvl(), nvl2() >> nulló�� ���
--decode()�Լ� >> java if ��(switch) ���
--case()�Լ� >> java if�� (switch)
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

select decode(deptno, 10, '�λ��',
                    20, '������',
                    30, 'ȸ���',
                    '��Ÿ�μ�') as "�μ�"
from emp;

select id ,job, decode(id, 100, '�λ��',
                  200, '������',
                  300, 'ȸ���',
                  '��Ÿ�μ�') as "�μ�"
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
t_emp2 ���̺��� id, jumin �����͸� ����ϵ� jumin �÷��� ���ڸ��� 1�̸� ���� 2�̸� ���� 3�̸� �߼� �׿ܴ� ŰŸ
*/
select id, decode(substr(jumin,1,1),1,'����',
                                    2,'����',
                                    3,'�߼�',
                                    '��Ÿ')as "gender"
from t_emp2;

SELECT empno, ename, decode(deptno,20,
                            decode(ename,'SMITH','HELLO','WORLD')
                            ,'etc')
FROM emp;

--case��
--java switch
--case ���ǽ� when ���1 then ���1
--           when ���2 then ���2
--           when ���3 then ���3
--           else ���4
--end "�÷���"
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
        case zipcode when 2 then '����'
                     when 31 then '���'
                     when 32 then '����'
                     when 41 then '����'
                     else '��Ÿ ����'
        end "regionname"
from t_zip;

/*
������̺��� ����޿��� 1000�޷� ���ϸ� 4��
1001 ~ 2000 3��
2001 ~ 3000 2��
3001 ~ 4000 1��
4001 ~ Ư��

1. case �÷��� when ��� then ��� ( = ó���Ҷ� ����)
2. ������ 
    case when �÷��� ���� �񱳽� then ���
*/
SELECT ename, 
case when sal <= 1000 then '4��'
     when sal between 1001 and 2000 then '2��'
     when sal between 2001 and 3000 then '2��'
     when sal between 3001 and 4000 then '1��' 
     else 'Ư��'
end "�޼�"
FROM emp;

------------------------------------------
--�����Լ�
--�����Լ�
--��¥�Լ�
--��ȯ�Լ�(to_char, to_date, to_number)
--�Ϲ��Լ� (nvl(), decode(), case())
------------------------------------------

--[�����Լ�] page 75
/*
count(*) > row �ټ�, count(�÷���) >>������ �Ǽ�(null �� ���������� �ʴ´�)
sum()
avg()
max()
min()
���

1. �����Լ��� group by���� ���� ���
2. ��� �����Լ��� null���� ����
3. select ���� �����Լ� �̿� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by���� ��õǾ�� �Ѵ�.
*/

select count(*) from emp; --�ټ��� ���°�
select count(comm) from emp; --6���ۿ� �ȳ��� ��? null�� ���õ�
select count(empno) from emp;

select count(nvl(comm,0)) from emp; --14�� �� ��µ�

--�޿��� ��
select sum(sal) as "�޿� ��" from emp; --29025
select round(avg(sal),0) as "��� �޿�" from emp;

-- ������� ȸ�� �� ���� �󸶳� ���޵ǰ��ֳ� 
select trunc(avg(comm),0) from emp;
select trunc(sum(comm) / count(comm)) from emp; -- �����Ͱ� ����. null���� �ƴ� ����� 6�� ���.
--�������� ~~~~~~~~~~~~~~~����~~~~~~~~~~~~~~~~
select trunc(avg(nvl(comm,0)),0) from emp;
select trunc(sum(comm) / 14) from emp;
--ȸ�� ������ ��ü ������� ������ �Ѵٸ� 309�� ����
--ȸ�� ������ �޴� ������� ������ �Ѵٸ� 721�� ����

--���� : �ڵ�
select count(*) from emp where comm is null; --8
select count(*) from emp where empno is null; --null�� ����
select max(sal) from emp; --5000
select min(sal) from emp; --800
--
select empno, count(empno) from emp; --�ȵ�. empno�� 14���� ���;ߵǰ� count�� ������ 1������ ������� ǥ������ߵ�
select sum(sal), avg(sal), max(sal), min(sal), count(sal)
from emp;
--�μ��� ��� �޿��� ����ϼ���
select deptno, avg(sal)
from emp
group by deptno; --�׷��� �� ������ ��� �� ���
--������ ��� �޿�
select job, avg(sal)
from emp
group by job;
--������ ��� �޿�, �޿���, �ִ�޿�, �ּұ޿�, �Ǽ� ���
select job, avg(sal)as "��� �޿�", sum(sal)as "�޿� ��", max(sal)as "�ִ� �޿�", min(sal)as "�ּ� �޿�", count(job)as "�Ǽ�"
from emp
group by job;
/*
grouping ����
distinct �÷���1, �÷���2
order by �÷���1, �÷���2
group by �÷���1, �÷���2, �÷���3

*/
--�μ���, ������ �޿��� ���� ���ϼ���.

select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job
order by deptno;

select 
from
where
group by
order by