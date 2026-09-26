use student_db;
create table student1(
student_id int not null auto_increment,
admission_number varchar(20) not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
email varchar(40) not null,
phone varchar(20) ,
date_of_birth varchar(20) not null,
programme varchar(60) not null,
admission_date varchar(40) not null,
cgpa decimal(4,2) not null,
status varchar(20) not null default 'active',
create_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp,
constraint pk_student_id primary key(student_id),
constraint un_email unique(email),
constraint ch_cgpa check(cgpa >=0.00 and cgpa <=10.00)
);


INSERT INTO student1 (
    admission_number, 
    first_name, 
    last_name, 
    email, 
    phone, 
    date_of_birth, 
    programme, 
    admission_date, 
    cgpa,
    status
) VALUES (
    'STU26C001', 
    'Ananya', 
    'Rao', 
    'ananya.rao@example.test', 
    '9876501001', 
    '2007-04-18', 
    'BSc Computer Science', 
    '2026-07-01', 
    8.40,
    'ACTIVE'
);

INSERT INTO student1 (
    admission_number, 
    first_name, 
    last_name, 
    email, 
    phone, 
    date_of_birth, 
    programme, 
    admission_date, 
    cgpa,
    status
) VALUES (
    'STU26C002', 
    'Vivaan', 
    'Sharma', 
    'vivaan.sharma@example.test', 
    NULL, 
    '2006-12-09', 
    'BCom', 
    '2026-07-01', 
    7.75,
    'ACTIVE'
);


INSERT INTO student1 (
    admission_number, 
    first_name, 
    last_name, 
    email, 
    phone, 
    date_of_birth, 
    programme, 
    admission_date, 
    cgpa,
    status
) VALUES 
('STU26C003', 'Diya', 'Nair', 'diya.nair@example.test', '9876501003', '2007-02-25', 'BA Economics', '2026-07-02', 9.10, 'ACTIVE'),
('STU26C004', 'Kabir', 'Singh', 'kabir.singh@example.test', '9876501004', '2006-08-14', 'BSc Mathematics', '2025-07-01', 6.85, 'SUSPENDED'),
('STU26C005', 'Tara', 'Bose', 'tara.bose@example.test', '9876501005', '2005-09-30', 'BA History', '2024-07-01', 5.90, 'DROPPED');

INSERT INTO student1 (
    admission_number, 
    first_name, 
    last_name, 
    email, 
    phone, 
    date_of_birth, 
    programme, 
    admission_date, 
    cgpa,
    status
) VALUES (
    'STU26C006', 
    'Aarav', 
    'Mehta', 
    'ananya.rao@example.test', 
    '9876501006', 
    '2006-01-01', 
    'BSc Computer Science', 
    '2026-07-01', 
    8.00,
    'ACTIVE'
);


INSERT INTO student1 (
    admission_number, 
    first_name, 
    last_name, 
    email, 
    phone, 
    date_of_birth, 
    programme, 
    admission_date, 
    cgpa,
    status
) VALUES (
    'STU26C007', 
    'Rohan', 
    'Verma', 
    'rohan.verma@example.test', 
    '9876501007', 
    '2006-05-10', 
    'BCom', 
    '2026-07-01', 
    10.50,
    'ACTIVE'
);

select * from student1;
SET SQL_SAFE_UPDATES = 0;
update student1 set cgpa=8.65 where admission_number = 'STU26C001';

update student1 set cgpa= cgpa+0.20 where programme='BSc Computer Science' and status = 'active';

select * from student1;

update student1 set status = 'ACTIVE' where admission_number ='STU26C004';

update student1 set programme = 'BCom Finance' where programme = 'BCom';

update student1 set email = 'vivaan.sharma@example.test' where admission_number = 'STU26C003';

select * from student1 where status = 'dropped';
delete from student1 where status = 'dropped';

INSERT INTO student1 (
    admission_number, 
    first_name, 
    last_name, 
    email, 
    phone, 
    date_of_birth, 
    programme, 
    admission_date, 
    cgpa,
    status
) VALUES (
    'STU-TEMP-001', 
    'Temp', 
    'User', 
    'temp.user@example.test', 
    '9999999999', 
    '2000-01-01', 
    'Temporary Course', 
    '2026-07-01', 
    5.00,
    'ACTIVE'
);


select * from student1 where admission_number = 'STU-TEMP-001';

delete from student1 where admission_number = 'STU-TEMP-001';

select * from student1;
