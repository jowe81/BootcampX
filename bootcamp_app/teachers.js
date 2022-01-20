const pool = require('./database/connection.js');

const cohort = process.argv[2];

pool.query(`
SELECT DISTINCT teachers.name, cohorts.name AS cohort
  FROM teachers
  JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name = '${cohort}';
`).then(res => {
  res.rows.forEach(teacher => {
    console.log(`${cohort}: ${teacher.name}`);
  });
});