/* Here is an example query using the GROUP BY keyword: */

SELECT Staff.STAFF_FName, Staff.STAFF_LName, COUNT(Sessionss.SHESH_ID) AS 'Number of Sessions'
FROM Staff
LEFT JOIN Sessionss ON Staff.STAFF_ID = Sessionss.STAFF_ID
GROUP BY Staff.STAFF_ID

/* This query selects the first and last name of staff members, along with a count of the number of sessions they have conducted. 
The GROUP BY clause groups the results by STAFF_ID, and the COUNT function counts the number of sessions for each staff member. */


/* Here is a subquery that could be added to this query: */

SELECT SHESH_Name, COUNT(MEM_ID) as 'Number of Participants',
       (SELECT COUNT(*) FROM Sessionss WHERE SHESH_Name = 'Cardio') AS 'Total Cardio Sessions'
FROM Sessionss
INNER JOIN Enrolment ON Sessionss.SHESH_ID = Enrolment.SHESH_ID
GROUP BY SHESH_Name;

/* This query counts the number of participants in each session by grouping the 
rows by the SHESH_Name column and using the COUNT function to count the number of MEM_ID values.

This subquery counts the total number of cardio sessions by counting the number of rows in the Sessionss
table where SHESH_Name is 'Cardio'. */

/* Here is an example query using the JOIN keyword: */


SELECT Staff.STAFF_FName, Staff.STAFF_LName, Sessionss.SHESH_Name, Member.MEM_FName, Member.MEM_LName
FROM Staff
INNER JOIN Sessionss ON Staff.STAFF_ID = Sessionss.STAFF_ID
INNER JOIN Enrolment ON Sessionss.SHESH_ID = Enrolment.SHESH_ID
INNER JOIN Member ON Enrolment.MEM_ID = Member.MEM_ID

/* This query selects the first and last name of staff members and members, along with 
the name of the session they are associated with. The inner joins combine rows from 
the Staff, Sessionss, Enrolment, and Member tables that have matching values in the 
STAFF_ID, SHESH_ID, and MEM_ID columns, respectively. The resulting table will include 
all rows from the Staff and Sessionss tables, and only those rows from the Enrolment and 
Member tables that have a match in the other tables. */