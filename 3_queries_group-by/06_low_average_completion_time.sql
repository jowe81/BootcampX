/*
  Get the students who's average time it takes to complete an assignment is less than 
  the average estimated time it takes to complete an assignment.

  * Select the name of the student, their average completion time, and the average suggested completion time.
  * Order by average completion time from smallest to largest.
  * Only get currently enrolled students.
  * This will require data from students, assignment_submissions, and assignments.

  ---

  - need average reported duration for all assignments the student submitted
  - need average estimated duration for all assignments the student submitted
  - currently enrolled students have no end_date
  
*/

SELECT
    students.name AS student, 
    AVG(assignment_submissions.duration) AS average_assignment_duration,
    AVG(assignments.duration) AS average_estimated_duration
  FROM assignment_submissions
  JOIN students ON assignment_submissions.student_id = students.id
  JOIN assignments ON assignment_submissions.assignment_id = assignments.id
  WHERE students.end_date IS NULL
  GROUP BY students.name
  HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
  ORDER BY average_assignment_duration;
