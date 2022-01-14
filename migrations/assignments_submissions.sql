DROP TABLE IF EXISTS assignments;

CREATE TABLE assignments(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day DATE,
  chapter INTEGER,
  duration INTEGER
);

DROP TABLE IF EXISTS assignment_submissions;

CREATE TABLE assignment_submissions(
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);