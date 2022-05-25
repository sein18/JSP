create table MYBOARD(
	MYNO INT auto_increment primary key,
	MYNAME VARCHAR(100) not null,
	MYTITLE VARCHAR(2000) not null,
	MYCONTENT VARCHAR(4000) not null,
	MYDATE DATE not null
);
select *from MYBOARD;

insert into MYBOARD VALUES(null,'관리자','게시판 테스트',
'테스트중입니다.12345678ABCD',NOW());





