create database java12;

create table schools(id serial primary key ,
                     name varchar(255),
                     address varchar(30),
                     count_of_students int);
alter table schools add column email varchar;
alter table schools rename name to school_name;
alter table schools add constraint school_name unique (school_name);
--
alter table schools drop constraint school_name;
-- delete column
alter table schools drop column school_name;
insert into schools ( address, count_of_students,email) values ('Bishkek',1000,'Seytek@gmail.com');
insert into schools ( address, count_of_students,email)  values ('tunguch',300,'itrun@gmail.com');
insert into schools ( address, count_of_students,email)  values ('Jal',400,'code@gmail.com');

create table students
(
    id         serial primary key,
    first_name varchar(50),
    last_name  varchar(50),
    age        int,
    school_id  int references schools (id)
);
insert into students(first_name, last_name, age, school_id) VALUES ('Nurkamil','Kamchiev',22,1),
                                                                   ('Ajybek','Sadykov',17,1);
insert into students(first_name, last_name, age, school_id) VALUES ('Mirlan','Arstanbekov',22,2),
                                                                   ('Nurtaazim','Mukanov',19,2);
insert into students(first_name, last_name, age, school_id) VALUES ('Nurislam','Toigonbaev',25,3),
                                                                   ('Adyl','Tolomushev',18,1);

create table author
(
    id            serial primary key,
    name          varchar(50),
    date_of_birth date,
    nationality   varchar(255)
);
-- add column
alter table author add column email varchar;
-- add constraint
alter table  author add constraint email unique  (email);
alter table  author ALTER COLUMN name SET NOT NULL;
-- ALTER TABLE table_name
-- ALTER COLUMN column_name TYPE new_data_type;
alter table author alter column name TYPE  text;
alter table author rename to  ListTable;
create  table book(
                      id serial primary key ,
                      name varchar,
                      published_year date,
                      author_id int references listtable (id)
);
alter table book rename name to book_name;
alter table book add constraint  book_name unique (book_name);
alter table book alter column  book_name set not null ;
insert into listtable(name, date_of_birth, nationality) VALUES ('Nurkamil','2002-05-19'::date,'kyrgyz'),
                                                               ('Ajybek','2007-11-09'::date,'kyrgyz');
insert into book(book_name, published_year, author_id) VALUES ('Clean code','2000-10-14'::date,1),
                                                              ('Java','1999-10-01'::date,2),
                                                              ('DevOps','2005-09-02'::date,1);
insert into book(book_name,published_year,author_id)VALUES ('','1998-06-15'::date,1);
insert into book(book_name,published_year,author_id)VALUES ('1998-06-15'::date,1);
-- Akyrka stroka ishtegen jok