-- jsp08
create table mymvcboard(
	SEQ INT auto_increment primary key,
	WRITER VARCHAR(200) not null,
	TITLE VARCHAR(2000) not null,
	CONTENT VARCHAR(4000) not null,
	REGDATE DATE not null
);	
insert into MYMVCBOARD VALUES(null,'관리자','테스트 중','테스트 1234 ABCD',NOW());

select *from mymvcboard;