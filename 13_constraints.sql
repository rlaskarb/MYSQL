-- constraints (제약 조건) -- 암기하는게 좋다
-- table 데이터가 입력되거나 변경될 때 규칙을 정의한다.
-- 데이터의 무결성!!

-- not null
-- null 값 즉 비어있는 값을 허용하지 않는다. 라는 제약조건

drop table if exists user_notnull ;
create table if not exists user_notnull(
	user_no int not null,
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50)
)engine = innodb;


insert into user_notnull
values
(1, 'user01','pass01','김남규','남','010-4270-2343','rlaskarb20@naver.com'),
(2, 'user02','pass02','김남식','남','010-4270-2343','rlaskarb20@gmail.com');


select * from user_notnull;

insert into user_notnull
values
(1, 'user01','pass01','김남규','남','010-4270-2343','rlaskarb20@naver.com'),
(2, 'user02','pass02','김남식','남','010-4270-2343','rlaskarb20@gmail.com');


-- unique 제약 조건
-- 중복 된 값을 허용하지 않는 제약조건
drop table if exists user_unique;
create table if not exists user_unique(
	user_no int not null unique,  -- null 허용 안하면서, 유일한 값
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50),
    unique(phone) -- 이런 식으로도 제약조건 설정할 수 있다.
)engine = innodb;

describe user_unique;

-- not null + unique => primary key 가 되었네???
-- email ,phone , user_no <-- unique 
insert into user_unique
values
(1, 'user01','pass01','김남규','남','010-4270-2343','rlaskarb20@naver.com'),
(2, 'user02','pass02','김남식','남','010-4270-2343','rlaskarb20@naver.com');

-- unique 제약조건 에러 발생(전화번호 중복됨.)

-- primary key **
--  ★★ 테이블에서 한 행의 정보를 찾기 위해 사용할 컴럼을 의미한다.
-- 테이블에 대한 식별자 역할 -> 한행을 식별할 수 있는 값을 의미한다.
-- unique + not null -> primary key
-- 한 테이블당 한 개만 설정할 수 있음
-- 한 개 컬럼에 설정 할 수 있고 , 여러 개의 컬럼을 묶어서 설정할 수 있다.
-- 복합키 ( 여러개의 pk(primary key))


drop table if exists user_pk;
create table if not exists user_pk(
	-- user_no int primary key
    user_no int ,  
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50),
    primary key (user_no)
)engine = innodb;

describe user_pk;


-- pk(primary key) 
-- foreign key (외래키)
-- 참조(연관) 된 다른 테이블 에서 제공하는 값만 사용할 수 있음
-- foreign key 제약 조건에 의해 테이블 간의 관계가 형성이 될 수 있다.

-- 부모테이블 , 자식테이블 
drop table if exists user_grade;
create table if not exists user_grade(
    grade_code int primary key ,  
    grade_name varchar(30) not null
)engine = innodb;

insert into user_grade
values
(10 , '일반회원'),
(20 , '우수회원'),
(30 , '특별회원');

select * from user_grade;

drop table if exists user_fk1;
create table if not exists user_fk1(
    user_no int primary key,  
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50),
    grade_no int, 
    foreign key(grade_no)
    references user_grade(grade_code)
)engine = innodb;

insert into user_fk1
values
(1, 'user01','pass01','김남규','남','010-4270-2343','rlaskarb20@naver.com',10),
(2, 'user02','pass02','김남식','남','010-4270-2343','rlaskarb20@naver.com',20);

describe user_fk1;

select * from user_fk1;

-- insert into user_fk1
-- values
-- error 1062: 참조하고 있는 테이블 (부모 테이블) 에는 존재하지 않는 값을 집어 넣을 때
-- 발생하는 에러 => ★ foreign key ★ 제약조건 위반
-- (3, 'user02','pass02','김남식','남','010-4270-2343','rlaskarb20@naver.com',25);


-- ★check 제약조건 
-- 조건을 위반할 시 허용하지 않는 제약조건

drop table if exists user_check;

-- 술을 파는 사이트, 미성년자 들어오면 안된다.
-- 성별은 2가지 값만 받을 것이다. 남 or 여
create table if not exists user_check(
    user_no int auto_increment primary key,  
    user_name varchar(30) not null,
    gender varchar(3) check(gender in('남','여')),
    age int check(age>=19)
)engine = innodb;

insert into user_check
values
(null , '홍길동' , '남' , 25),
(null , '하츄핑' , '여' , 7);

describe user_check;


-- default
-- nullable 한 컬럼에 비어있는 값 대신 우리가 설정한 기본값 적용
drop table if exists tbl_country;
create table if not exists tbl_country(
    country_no int auto_increment primary key,  
    country_name varchar(255) default '한국' ,
    population varchar(255) default '0명',
    add_time datetime default(current_time()),
    add_day date default(current_date())
)engine = innodb;

insert into tbl_country
values
(null,default,default,default,default);

select * from tbl_country;






