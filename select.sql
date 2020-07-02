# 1.Query the existence of 1 course
SELECT * FROM student_course sc JOIN student s ON sc.`studentId`=s.`id` AND sc.`courseId`=1;
# 2.Query the presence of both 1 and 2 courses

SELECT * FROM student_course sc JOIN student s ON sc.`studentId`=s.`id` AND sc.`courseId` IN (1,2);

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.

SELECT s.`id`,s.`name`,AVG(sc.score) FROM student_course sc JOIN student s ON sc.`studentId`=s.`id` GROUP BY studentId HAVING AVG(score) > 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student WHERE id IN (
SELECT studentId FROM student_course GROUP BY studentId HAVING COUNT(courseId) < 3
)
# 5.Query all SQL with grades
SELECT a.* FROM student AS a  JOIN student_course AS b ON a.id = b.studentId  JOIN course AS c ON
c.id = b.courseId WHERE score != '';
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT a.* FROM student AS a  JOIN student_course AS b ON a.id = b.studentId  JOIN course AS c ON
c.id = b.courseId WHERE c.name IN ('Language','Math' ) 
# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT a.*,b.`score` FROM student AS a LEFT JOIN student_course AS b ON a.id = b.studentId
WHERE b.`score`< 60 ORDER BY b.`score` DESC
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT AVG(b.`score`),c.`name` FROM student AS a  JOIN student_course AS b ON a.id = b.studentId
 JOIN course AS c ON c.id = b.`courseId`
GROUP BY c.`id`
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT a.name,b.`score`,c.`name` FROM student AS a  JOIN student_course AS b ON a.id = b.studentId  JOIN course AS c ON
c.id = b.courseId WHERE c.name = 'Math' AND b.`score` < 60 

