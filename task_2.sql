CREATE TABLE IF NOT EXISTS Employee_list (
	emp_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT null,
	department VARCHAR(80) NOT null, 
	boss_id INTEGER REFERENCES Employee_list (emp_id)
	);
