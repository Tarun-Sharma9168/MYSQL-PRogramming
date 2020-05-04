
1)
/*
DELIMITER //
CREATE FUNCTION name_of_week(date1 date)returns int  DETERMINISTIC
BEGIN
DECLARE week_day int;
SELECT WEEKDAY(date1) INTO week_day;
return week_day;
END
//
DELIMITER ;
SELECT name_of_week(curdate());

*/
2)
/*
DELIMITER //
CREATE FUNCTION is_valid(phone_number BIGINT) returns int DETERMINISTIC
BEGIN
DECLARE bool_var INT;
if(phone_number  REGEXP "^[7-9][0-9]{9}$")
then
set bool_var=1;
else
set bool_var=0;
end if;
return bool_var;
END
//
DELIMITER ;
select is_valid(9213280868);
*/

3)
/*
DELIMITER //
create FUNCTION change_case(text varchar(50),inp varchar(10)) returns varchar(50) DETERMINISTIC
BEGIN
DECLARE ans varchar(50);
if inp = 'upper'
then set ans=UPPER(text);
else
set ans=LOWER(text);
END IF;
return ans;
END
//
DELIMITER ;
select change_case('tarun sharma','upper');
select change_case('RAJU KAPOOR','lower');

*/
4)
/*
DELIMITER //
create FUNCTION search(roll_number varchar(50)) returns varchar(50) DETERMINISTIC
BEGIN
DECLARE ans varchar(50);
select concat(student_name,' ',course_id) from student where roll_no=roll_number into ans;
if ans=''
then set ans='Roll Number Does not Exist';
END IF;
return ans;
END//
DELIMITER ;
select search('31119001')

*/
6)
/*
create TRIGGER increase_student_count
BEFORE INSERT ON student
FOR EACH ROW Set @sum=@sum+1;

SET @sum=0;
INSERT into student(roll_number,student_name) values('1234','ballu bhai'),('4567','kaju bhai');
select @sum as 'total student';
*/
7)
/*
create TRIGGER increase_student_count_on_update
BEFORE UPDATE on group_master
FOR EACH ROW SET @sum=@sum+1;

SET @sum=0;
update group_master set group_name='Austin 3:16' where group_id=9;
select @sum as 'no_of_edits';

*/
5)
/*
create TRIGGER deletion_after
After DELETE  on gender_master
FOR EACH ROW 
     DELETE from student where gender_id=OLD.gender_id;
Delete from gender_master where gender_id=4;
select * from student;
*/