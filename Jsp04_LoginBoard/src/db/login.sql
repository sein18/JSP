drop table mymember;

create table mymember(
	myno int auto_increment not null primary key,
	myid varchar(500) not null unique,
	mypw varchar(500) not null,
	myname varchar(1000) not null,
	myaddr varchar(4000) not null,
	myphone varchar(100) not null unique,
	myemail varchar(100) not null unique,
	myenabled varchar(2) not null check(myenabled in('Y','N')),
	myrole varchar(50) not null
);

insert into mymember values(null,'admin','admin1234','관리자','관리시 관리구 관리동','010-1234-5678','admin@mymember.com','Y','admin');

