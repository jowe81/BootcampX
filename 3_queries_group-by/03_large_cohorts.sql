SELECT cohorts.name, COUNT(students.cohort_id) AS student_count
  FROM students
  JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.name
  HAVING COUNT(students.cohort_id) >= 18
  ORDER BY student_count;