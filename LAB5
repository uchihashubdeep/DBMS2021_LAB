2. alter table customers 
add constraint cust_info UNIQUE (customerNumber);

3. select user();

4. show grants for 'root'@'localhost';

5. create user 'mane'@'localhost' identified by 'liverpool';
   grant all privileges on *.* to 'mane'@'localhost';

6. delete from mysql.user where user='mane' and host='localhost';

7.create user 'jake'@'localhost' identified by '1brooklyn99';
  create user 'amy'@'localhost' identified by '2brooklyn99';
  create user 'charles'@'localhost' identified by '3brooklyn99';
  create user 'holt'@'localhost' identified by '4brooklyn99';
  create role students;
  grant students to 'jake'@'localhost';
  show grants for  'jake'@'localhost';
  set default role students to  'jake'@'localhost';
  grant students to 'amy'@'localhost';
  set default role students to  'amy'@'localhost';
  grant students to 'charles'@'localhost';
  set default role students to  'charles'@'localhost';
  create role boss;
  grant boss to 'holt'@'localhost';
 8. grant all privileges on *.* to boss;
    grant select on *.* to students;
    show grants for boss;

 9. create table employee_audit (
    id INT AUTO_INCREMENT primary key,
    employeeNumber INT NOT NULL,
    lastname varchar(50) not null,
    firstName varchar(50) not null,
    jobTitle varchar(20) not null,
    delDate DATETIME default null,
    action varchar(20) default null);

    delimiter $$
    create trigger after_employee_delete
    	after delete on employees
    	for each row
    begin
        insert into employee_audit
        set action ='delete',
        employeeNumber=old.employeeNumber,
        firstName=old.firstName,
        lastName=old.lastName,
        jobTitle=old.jobTitle,
        delDate=CURRENT_TIME();
     end$$
     delimiter;

10. alter table employees drop foreign key employees_ibfk_1;
    alter table employees drop foreign key employees_ibfk_2;

11. delete from employees where jobTitle like 'VP%';
    select * from employee_audit;

12. show triggers;

13. alter table products drop foreign key products_ibfk_1;
    create table productline_update_audit (
    id INT AUTO_INCREMENT primary key,
    productLine varchar(50) not null
      );
    create table productline_delete_audit (
    id INT AUTO_INCREMENT primary key,
    productLine varchar(50) not null
      );
    create table productline_reintroduced (
    id INT AUTO_INCREMENT primary key,
    productLine varchar(50) not null
      );

    delimiter $$
    create trigger after_productline_update
      after update on productlines
      for each row
    begin
        insert into productline_update_audit
        set productLine=new.productLine;
     end$$
     delimiter;
    
    delimiter $$
    create trigger before_productline_delete
      before delete on productlines
      for each row
    begin
        insert into productline_delete_audit
        set productLine=old.productLine;
     end$$
     delimiter;

     delimiter $$
    create trigger after_productline_insert
      after insert on productline_update_audit
      for each row
    begin
        insert into productline_reintroduced
        set productLine=(select productLine from productline_delete_audit as P where P.productLine=new.productLine);
     end$$
     delimiter;

14. update productlines set productLine = 'Trams' where productLine =
        'Ships';
        delete from productlines where productLine='Trains';
        delete from productlines where productLine='Planes';
        delete from productlines where productLine='Trams';
        update productlines set productLine = 'Trains' where productLine
        = 'Motorcycles';
        update productlines set productLine = 'Planes'where productLine =
        'Classic Cars';
        select * from productline_reintroduced;

15. create view officeDetails as 
        select officeCode,phone,postalCode
        from offices
        where country='USA';

16. create view orderView as
       select o2.orderNumber,productCode,orderDate,quantityOrdered,customerNumber,status
       from orders as o1,orderdetails as o2
       where o1.orderNumber=o2.orderNumber and
             o1.status='Resolved';
17. drop view officeDetails;
18. alter table orderdetails
add constraint ppo check(priceEach>100);
19. alter table orderdetails drop foreign key employees_ibfk_1;
20. create table Managers (
       ID int not null,
       LastName varchar(255) not null,
       FirstName varchar(255),
       Age int,
       City varchar(255),
       check(Age>18 and City='Sancoale')
      );
     insert into Managers(ID,LastName,FirstName,Age,City) values (1,"mane","sadio",29,"liverpool");
     insert into Managers(ID,LastName,FirstName,Age,City) values (1,"mane","sadio",9,"Sancoale");
     insert into Managers(ID,LastName,FirstName,Age,City) values (1,"mane","sadio",29,"Sancoale");
