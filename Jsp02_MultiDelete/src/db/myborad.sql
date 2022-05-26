create table mdboard(
	SEQ INT auto_increment primary key,
	WRITER VARCHAR(500) not null,
	TITLE VARCHAR(1000) not null,
	CONTENT VARCHAR(2000) not null,
	REGDATE DATE not NULL
);

insert into mdboard VALUES(null,'관리자','테스트 중','TEST1234테이스',NOW());

select *from mdboard;
