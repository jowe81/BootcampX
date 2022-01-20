const pool = require('./database/connection.js');

//Read command line arguments
const cohort = process.argv[2];
const limit = process.argv[3] || 5; //supply default to prevent syntax error on empty argument

const query = {
  text: `SELECT students.id, students.name, cohorts.name as cohort_name
  FROM students
  JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2`,
  values: [`%${cohort}%`, limit]
};

pool.query(query)
  .then(res => {
    res.rows.forEach(student => {
      console.log(`${student.name} has an id of ${student.id} and they were in cohort ${student.cohort_name}.`);
    });
  }).catch(err => console.error('query error', err.stack));