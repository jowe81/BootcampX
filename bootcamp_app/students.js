const pool = require('./database/connection.js');

console.log("Querying...");
pool.query('SELECT * FROM students LIMIT 5;')
  .then(res => {
    console.log('Returned!');
    res.rows.forEach(student => {
      console.log(`${student.name} has an id of ${student.id} and their phone number is ${student.phone}.`);
    });
  }).catch(err => console.error('query error', err.stack));