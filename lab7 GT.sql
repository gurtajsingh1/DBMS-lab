
    CREATE TABLE Student7(
    sid VARCHAR(20),
    Marks INT,
    Branch VARCHAR(20)
    );
    INSERT INTO student7 VALUES
    ('S1',40,'EC'),
    ('S2',80,'CS'),
    ('S3',40,'IT'),
    ('S4',60,'CS'),
    ('S5',80,'IT'),
    ('S6',NULL,'EC');
    
	CREATE TABLE employee7(
    name VARCHAR(20),
    Gender VARCHAR(20),
    Salary INT,
    dname VARCHAR(20)
    );
    INSERT INTO employee7 VALUES
    ('Aman','Male',45000,'IT'),
    ('Abhay','Male',40000,'SALES'),
    ('Sita','Female',55000,'MARKETING'),
    ('Gita','Female',48000,'IT'),
    ('Pankaj','Male',45000,'IT'),
    ('Mandeep','Male',48000,'IT');
    
    CREATE TABLE Employee8(
    E_id VARCHAR(20) PRIMARY KEY,
    Ename VARCHAR(20),
    Salary INT,
    Department VARCHAR(20)
    );
    
    INSERT INTO Employee8 VALUES
    ('E1','Ram',35000,'Sales'),
    ('E2','ravi',38000,'Marketing'),
    ('E3','gansham',45000,'IT'),
    ('E4','Sham',42000,'IT'),
    ('E5','priya',48000,'Sales'),
    ('E6','Supriya',42000,'IT');
    
    SELECT sid FROM student7
    WHERE Marks=(SELECT MAX(Marks) FROM student7);
     SELECT sid FROM student7
     WHERE Marks=(SELECT MAX(Marks) FROM student7 WHERE Marks<>(SELECT MAX(Marks) FROM student7));
    SELECT dname FROM employee7 
    group by dname HAVING avg(Salary)>(SELECT avg(Salary) FROM employee7);
    SELECT dname FROM employee7 
    WHERE salary=(SELECT avg(Salary) FROM employee7 
    WHERE Gender='Male' >
    (SELECT 	avg(Salary) FROM employee7 Where Gender='Male'));
    
    
    
    -Question 1-
    create table Catalog(
      sid int,
      sid pid
      );
      
      create table Parts(
      pid int ,
      color varchar(30),
      pname varchar(40)
      
      );
      
INSERT INTO Parts VALUES
(1, 'red', 'Bolt'),
(2, 'green', 'Nut'),
(3, 'red', 'Screw'),
(4, 'blue', 'Washer');

INSERT INTO Catalog VALUES
(101, 1),
(101, 2),
(101, 3),
(101, 4),   

(102, 1),
(102, 3),  

(103, 2),
(103, 4);   
      
    -question 1 sid's of the supplier supplied red parts-
    SELECT DISTINCT sid
FROM Catalog
WHERE pid IN (
    SELECT pid
    FROM Parts
    WHERE color = 'red'
);
-question 2 parts which are not supplied by any supplier(NOt exists)-

SELECT p.pid, p.pname
FROM Parts p
WHERE NOT EXISTS (
    SELECT *
    FROM Catalog c
    WHERE c.pid = p.pid
); 
              
              -question 3 sid's of supplier supplied proper subset of parts (exists with except)-
          SELECT  c.sid
FROM Catalog c
WHERE EXISTS (
    SELECT pid FROM Parts
    EXCEPT
    SELECT pid FROM Catalog c2
    WHERE c2.sid = c.sid
);
                               
                               
                               -question 4 sid's of supplier supplied all parts (Both via nested NOT EXISTS & NOT EXISTS with Except)-
                              select c.sid
from catalog c
where NOT EXISTS (
    select p.pid
    from Parts p
    where 
    NOT EXISTS (
        select p.pid
        from catalog c2
        where c2.sid = c.sid
        and c2.pid = p.pid
    ));
                               
      -question 5. Retrive the sid's of the supplier whose rating> 10 and supplied every red part-
      -question 6 query comparison with the NUll (IS| IS NOT clause)-
      -Question 7 Query region operation (LIKE\NOT LIKE)-
                               
                               
     see the question and give me the perfect solution till question 4 