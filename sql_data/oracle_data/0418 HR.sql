create table sample_product(
    product_id number,
    product_name varchar2(30),
    manu_date date);


select * from sample_product;

insert into sample_product VALUES(1, 'television', TO_DATE('140101', 'YYMMDD'));

insert into sample_product VALUES(2, 'washer', TO_DATE('150101', 'YYMMDD'));
insert into sample_product VALUES(3, 'cleaner', TO_DATE('160101', 'YYMMDD'));

#1
alter table sample_product add (factory varchar2(10));

#2
alter table sample_product modify (factory varchar2(20));

#3
alter table sample_product rename column factory to factory_name;

#4
truncate table sample_product;

#5
drop table sample_product;

CREATE TABLE 성적 (
    hakbun VARCHAR2(10),
    kuk NUMBER,
    eng NUMBER,
    math NUMBER,
    CONSTRAINT 성적_pk PRIMARY KEY (hakbun)
);

INSERT INTO 성적 (hakbun, kuk, eng, math) VALUES ('1111', 80, 89, 90);
INSERT INTO 성적 (hakbun, kuk, eng, math) VALUES ('2222', 90, 70, 70);
INSERT INTO 성적 (hakbun, kuk, eng, math) VALUES ('3333', 70, 80, 80);

select * from 성적;

