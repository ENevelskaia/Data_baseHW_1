CREATE TABLE IF NOT EXISTS Employee_list (
	emp_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT null,
	department VARCHAR(50) NOT null, 
	boss_id INTEGER,
	FOREIGN KEY (boss_id) REFERENCES Employee_list (emp_id)
	);