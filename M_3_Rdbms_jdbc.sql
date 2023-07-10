---  ----------------------->   create DATABASE    <---------------------------

CREATE DATABASE java_Assignment_RDBMS_JDBC;

---  --------------------------------------------------------------------------

---  --------------------------->   use DATABASE    <---------------------------

USE java_Assignment_RDBMS_JDBC ;

---  --------------------------------------------------------------------------

---  ---------------> 1)  create table :[department data]   <------------------

CREATE TABLE
    Dept_table_data(
        Deptno int NOT NULL,
        dname VARCHAR(30),
        loc VARCHAR(30),
        PRIMARY KEY(Deptno)
    );

---  --------------->   insert data :[department data]   <------------------

INSERT INTO Dept_table_data
VALUES (10, "ACCOUNTING", "NEW YORK"), (20, "RESEARCH", "DALLAS"), (30, "SALES", "CHICAGO"), (40, "OPERATIONS", "BOSTON");

---  --------------------------------------------------------------------------

---  ----------------> 2)  create table :[employee data]   <--------------------

CREATE Table
    emp_Table_Data(
        Empno INT(4) AUTO_INCREMENT,
        Ename VARCHAR(10),
        Job VARCHAR(9),
        Mgr int(4),
        Hiredate DATE,
        Sal DECIMAL(7, 2),
        Comm DECIMAL(7, 2),
        Deptno int(2),
        PRIMARY KEY (Empno),
        Foreign Key (Deptno) REFERENCES Dept_table_data(Deptno)
    );

---  ----------------> 2)  INSERT DATA :[employee data]   <--------------------

INSERT INTO
    emp_Table_Data(
        Empno,
        Ename,
        Job,
        Mgr,
        Hiredate,
        Sal,
        Deptno
    )
VALUES (
        7369,
        "SMITH",
        "CLERK",
        7902,
        "1980-12-17",
        800.00,
        20
    );

INSERT into emp_Table_Data
VALUES (
        7499,
        "ALLEN",
        "SALESMAN",
        7698,
        "1981-02-20",
        1600.00,
        300.00,
        30
    ), (
        7521,
        "WARD",
        "SALESMAN",
        7698,
        "1981-02-22",
        1250.00,
        500.00,
        30
    );

INSERT INTO
    emp_Table_Data(
        Empno,
        Ename,
        Job,
        Mgr,
        Hiredate,
        Sal,
        Deptno
    )
VALUES (
        7566,
        "JONES",
        "MANAGER",
        7839,
        "1981-04-02",
        2975.00,
        20
    );

INSERT INTO emp_Table_Data
VALUES (
        7654,
        "MARTIN",
        "SALESMAN",
        7698,
        "1981-09-28",
        1250.00,
        1400.00,
        30
    );

INSERT INTO
    emp_Table_Data (
        Empno,
        Ename,
        Job,
        Mgr,
        Hiredate,
        Sal,
        Deptno
    )
VALUES (
        7698,
        "BLAKE",
        "MANAGER",
        7839,
        "1981-05-01",
        2850.00,
        30
    ), (
        7782,
        "CLARK",
        "MANAGER",
        7839,
        "1981-06-09",
        2450.00,
        10
    ), (
        7788,
        "SCOTT",
        "ANALYST",
        7566,
        "1987-06-11",
        3000.00,
        20
    );

INSERT INTO
    emp_Table_Data (
        Empno,
        Ename,
        Job,
        Hiredate,
        Sal,
        Deptno
    )
VALUES (
        7839,
        "KING",
        "PRESIDENT",
        "1981-11-17",
        5000.00,
        10
    );

INSERT INTO emp_Table_Data
VALUES (
        7844,
        "TURNER",
        "SALESMAN",
        7698,
        "1981-08-09",
        1500.00,
        0.00,
        30
    );

INSERT INTO
    emp_Table_Data (
        Empno,
        Ename,
        Job,
        mgr,
        Hiredate,
        Sal,
        Deptno
    )
VALUES (
        7876,
        "ADAMS",
        "CLERK",
        7788,
        "1987-07-13",
        1100.00,
        20
    );

INSERT INTO
    emp_Table_Data (
        Empno,
        Ename,
        Job,
        mgr,
        Hiredate,
        Sal,
        Deptno
    )
VALUES (
        7900,
        "JAMES",
        "CLERK",
        7698,
        "1981-03-12",
        950.00,
        30
    ), (
        7902,
        "FORD",
        "ANALYST",
        7566,
        "1981-03-12",
        3000.00,
        20
    ), (
        7934,
        "MILLER",
        "CLERK",
        7782,
        "1982-01-23",
        1300.00,
        10
    );

---  --------------------------------------------------------------------------

---  ----------------> 3)  create table :[STUDENT TABLE]   <--------------------

CREATE Table
    STUDENT_TABLE(
        Rno int NOT NULL,
        Sname VARCHAR(14) DEFAULT "null",
        City VARCHAR(20) DEFAULT "null",
        State VARCHAR(20) DEFAULT "null",
        PRIMARY KEY(Rno)
    );

---  --------------------------------------------------------------------------

---  ----------------> 4)  create table :[EMP_LOG TABLE]   <--------------------

CREATE Table
    EMP_LOG_TABLE(
        Emp_id int(5) NOT NULL,
        Log_date DATE,
        New_salary INT,
        Action VARCHAR(20)
    );

---  --------------------------------------------------------------------------

---   --------------------> Assignment Question & Answer  <---------------------

---  Q  i. Select unique job from EMP table. ?;
SELECT DISTINCT Job FROM emp_Table_Data ;

---     Q   ii. List the details of the emps in asc order of the Dptnos and desc of Jobs ?;
SELECT * FROM emp_Table_Data ORDER BY Deptno ,Job DESC;

---     Q   iii. Display all the unique job groups in the descending order?;
SELECT DISTINCT Job FROM emp_Table_Data ORDER BY Job DESC;

---     Q   iv. List the emps who joined before 1981. ?;
SELECT *FROM emp_Table_Data WHERE hiredate <"1981-01-01";

---     Q    v.  List the Empno,Ename,Sal,Daily sal of all emps in the asc order of Annsal. ;
SELECT Empno ,Ename ,Sal,sal/30 AS Daily_sal, sal*12 As Annsal FROM emp_Table_Data ORDER BY Annsal;

---     Q    vi.List the Empno,Ename,Sal,Exp of all emps working for Mgr 7369.;
select Empno,Ename,Sal FROM emp_Table_Data WHERE mgr=7369;

---     Q    vii. Display all the details of the emps who’s Comm. Is more than their Sal?;
select * FROM emp_Table_Data WHERE comm >sal;

---     Q    viii. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order. ?;
SELECT *FROM emp_Table_Data WHERE job = "CLERK" OR job = "ANALYST" ORDER BY job DESC;

---     Q     ix. List the emps Who Annual sal ranging from 22000 and 45000. ?;
SELECT *,sal*12 As Annsal FROM emp_Table_Data WHERE sal*12 BETWEEN 22000 and 45000;

---     Q      x. List the Enames those are starting with ‘S’ and with five characters.;
SELECT * FROM emp_Table_Data WHERE Ename LIKE "S____";

---     Q      xi. List the emps whose Empno not starting with digit78.;
SELECT * FROM emp_Table_Data WHERE Empno NOT LIKE "78__";

---     Q      xii. List all the Clerks of Deptno 20.
SELECT * FROM emp_Table_Data WHERE deptno =20 and job ="CLERK";

---     Q       xiii. List the Emps who are senior to their own MGRS. 
SELECT MIN(Hiredate),Ename,job,sal,Mgr FROM emp_Table_Data GROUP BY Mgr;

---     Q       xiv. List the Emps of Deptno 20 who’s Jobs are same as Deptno10. ;
select * from emp_Table_Data where Deptno = 20 and Job in (select job from emp_Table_Data where deptno = 10);

---     Q        xv. List the Emps who’s Sal is same as FORD or SMITH in desc order of Sal. ;
Select * from emp_Table_Data where Sal in (select Sal from emp_Table_Data  where ( ename = 'SMITH' or ename = 'FORD' )) order by sal desc;

---     Q       xvi. List the emps whose jobs same as SMITH or ALLEN. ;
SELECT * FROM emp_Table_Data  WHERE Job IN (SELECT Job FROM emp_Table_Data WHERE (Ename="SMITH" OR Ename="ALLEN"));

---     Q       xvii. Any jobs of deptno 10 those that are not found in deptno 20. ;
Select * from emp_Table_Data where Deptno = 10 and Job not in (select Job from emp_Table_Data where Deptno = 20);

---     Q       xviii. Find the highest sal of EMP table. ;
select * FROM emp_table_data WHERE sal IN (SELECT MAX(Sal) FROM emp_table_data);

---     Q       xix. Find details of highest paid employee. ;
select * FROM emp_table_data WHERE sal IN (SELECT MAX(Sal) FROM emp_table_data);

---     Q       xxi. List the emps whose names contains ‘A’. ;
SELECT * FROM emp_table_data WHERE Ename LIKE '%A%';

---     Q       xxii.Find all the emps who earn the minimum Salary for each job wise in ascending order. ;
SELECT * FROM emp_table_data WHERE Sal ORDER BY Sal;

---     Q       xxiii. List the emps whose sal greater than Blake’s sal. ;
SELECT * FROM emp_table_data WHERE Sal > (SELECT Sal FROM emp_table_data WHERE Ename="Blake");

---     Q       xxiv. Create view v1 to select ename,job,dname,loc whose deptno are same.;
CREATE View v1 AS SELECT ename,job,dname,loc FROM emp_table_data e JOIN dept_table_data d ON e.Deptno =d.Deptno ;
SELECT * FROM v1;

---     Q       xxv.Create a procedure with dno as input parameter to fetch ename and dname.;
SELECT Ename,dname FROM emp_table_data JOIN dept_table_data ON emp_table_data.Deptno =dept_table_data.Deptno;
---     Q       xxvi. Add column Pin with bigint data type in table student. ;
ALTER TABLE student_table ADD pin BIGINT;

/*      Q       xxvii. Modify the student table to change the sname length from 14 to 40. Create 
               trigger to insert data in emp_log table whenever any update of sal in EMP table. 
               You can set action as ‘New Salary’;
*/