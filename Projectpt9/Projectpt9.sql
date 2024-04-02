Connect sys/sys as sysdba;
DROP USER C##S_neil CASCADE;
CREATE USER c##S_neil IDENTIFIED BY 125;
GRANT connect, resource, create view TO c##S_neil;
ALTER USER c##S_neil QUOTA 100M on USERS;
connect c##S_neil/125;
SPOOL C:\Users\Shaquille\Projectpt9\PT9.txt
START "C:\Users\Shaquille\Desktop\School work\Oracle\scott_emp_dept.sql"
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') 
FROM DUAL;

---Using the database of scott, create a SQL command to find the largest and smallest salary of all employees. 

SELECT MIN(sal)"Minimum Salary", MAX(sal) "Maximum Salary"
FROM emp;

----Find the Sum, Max, Min salary of every department which have the minimum salary GREATER than 1000 FOR ALL EMPLOYEE except PRESIDENT. 
SELECT deptno, MAX(sal), MIN(sal), SUM(sal)
FROM   emp
WHERE job <>'PRESIDENT'
GROUP BY deptno
HAVING MIN(sal)> 1000;

START "C:\Users\Shaquille\Desktop\School work\Oracle\7clearwater.sql"

--------Display quantity on hand, min price, max price with each item with sum of quantity on hand > 200 of all inventories size L,M
SELECT item_id, SUM(inv_qoh) "Sum quantity on hand", MIN(inv_price), MAX(inv_price)
FROM inventory
WHERE inv_size = 'L' OR inv_size = 'M'
Group BY item_id
HAVING SUM(inv_qoh) > 200;

------Display quantity on hand, min price, max price with each item with sum of quantity on hand > 200 of all inventories size s,or null
SELECT item_id, SUM(inv_qoh) "Sum quantity on hand", MIN(inv_price), MAX(inv_price)
FROM inventory
WHERE inv_size = 'S' OR inv_size IS NULL
Group BY item_id
HAVING SUM(inv_qoh) > 100;

----Modify question 4 to display also the ITEM DESCRIPTION between the MAX , and MIN price.
SELECT inventory.item_id, SUM(inv_qoh) "Sum quantity on hand", MIN(inv_price), item_desc, MAX(inv_price)
FROM inventory, item
WHERE inv_size = 'S' OR inv_size IS NULL AND inventory.item_id = item.item_id
Group BY inventory.item_id, item.item_desc
HAVING SUM(inv_qoh) > 100;

-------Using database NORTHWOODS, create SQL command to find the birthdate of the youngest and oldest student. 
----------Named the column “Youngest” and “Oldest” respectively. 

START "C:\Users\Shaquille\Desktop\School work\Oracle\7Northwoods.sql"

SELECT MIN(s_dob) "Youngest", MAX(s_dob) "Oldest"
FROM student;

------------Using database NORTHWOODS, For each CLASS, create SQL command to find and display the birthdate of the youngest and oldest student. 

SELECT s_class "Class", MIN(s_dob) "Youngest", MAX(s_dob) "Oldest"
FROM student
GROUP BY s_class;

SPOOL OFF;