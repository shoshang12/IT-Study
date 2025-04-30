use employees;
select * from employees;

show databases;

use mysql;
select user, host from user;

create user webuser@'%' identified by '54321';

grant all privileges on employees.* to 'webuser'@'%';

flush privileges;