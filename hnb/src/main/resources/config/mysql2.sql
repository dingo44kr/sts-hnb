-- CREATE USER MOVIE IDENTIFIED BY MOVIE;
-- GRANT DBA TO MOVIE;
-- CONN MOVIE/MOVIE
-- CREATE SEQUENCE SEQ;

-- mysql.sql 수정 전 빽업파일.

CREATE TABLE THEATER(
	THEATER_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	THEATER_NAME VARCHAR(50)
);

CREATE TABLE MEMBER(
	ID VARCHAR(50),
	PASSWORD VARCHAR(50),
	NAME VARCHAR(50),
	BIRTH VARCHAR(50),
	GENDER VARCHAR(50),
	PHONE VARCHAR(50),
	ADDR VARCHAR(255),
	EMAIL VARCHAR(50),
	MY_THEATER INT,
	REGDATE DATE,
	CONSTRAINT MEMBER_FK FOREIGN KEY(MY_THEATER)
		REFERENCES THEATER(THEATER_SEQ),
	CONSTRAINT MEMBER_PK PRIMARY KEY(ID)
);

CREATE TABLE MOVIE(
	FILM_NUMBER VARCHAR(50),
	FILM_NAME VARCHAR(50),
	DIRECTOR VARCHAR(50),
	ACTOR VARCHAR(255),
	RATE VARCHAR(50),
	RUNTIME INT,
	PRICE INT,
	COUNTRY VARCHAR(50),
	GENRE VARCHAR(50),
	RELEASE_DATE DATE,
	END_DATE DATE,
	STORY VARCHAR(255),
	CUT VARCHAR(255),
	TRAILER VARCHAR(255),
	CONSTRAINT MOVIE_PK PRIMARY KEY(FILM_NUMBER)
);

CREATE TABLE ROOM(
	THEATER_SEQ INT,
	ROOM_NAME VARCHAR(50),
	A INT,
	B INT,
	C INT,
	D INT,
	E INT,
	F INT,
	G INT,
	H INT,
	I INT,
	J INT,
	CONSTRAINT ROOM_FK FOREIGN KEY(THEATER_SEQ)
		REFERENCES THEATER(THEATER_SEQ),
	CONSTRAINT ROOM_PK PRIMARY KEY(THEATER_SEQ,ROOM_NAME)
);


CREATE TABLE SCHEDULE(
	SEQ INT PRIMARY KEY AUTO_INCREMENT,
	FILM_NUMBER VARCHAR(50),
	THEATER_SEQ INT,
	ROOM_NAME VARCHAR(50),
	SHOW_DATE VARCHAR(50),
	SHOW_TIME VARCHAR(50),
	SEAT_STATUS INT,
	CONSTRAINT SCHEDULE_FK FOREIGN KEY(FILM_NUMBER)
		REFERENCES MOVIE(FILM_NUMBER),
	CONSTRAINT SCHEDULE_FK2 FOREIGN KEY(THEATER_SEQ,ROOM_NAME)
		REFERENCES ROOM(THEATER_SEQ,ROOM_NAME)
);

CREATE TABLE SEAT(
	SEQ INT,
	SEAT_NUMBER INT,
	CONSTRAINT SEAT_FK FOREIGN KEY(SEQ)
		REFERENCES SCHEDULE(SEQ),
	CONSTRAINT SEAT_PK PRIMARY KEY(SEQ,SEAT_NUMBER)
);

CREATE TABLE TICKET(
	TICKET_NUMBER VARCHAR(50),
	ID VARCHAR(50),
	FILM_NUMBER VARCHAR(50),
	THEATER_SEQ INT,
	ROOM_NAME VARCHAR(50),
	TODAY VARCHAR(50),
	TICKET_DATE VARCHAR(50),
	START_TIME VARCHAR(50),
	END_TIME VARCHAR(50),
	SEAT_NUMBER INT,
	ADULT INT,
	OLD_MAN INT,
	TEENAGER INT,
	PRICE INT,
	CONSTRAINT TICKET_FK FOREIGN KEY(THEATER_SEQ,ROOM_NAME)
		REFERENCES ROOM(THEATER_SEQ,ROOM_NAME),
	CONSTRAINT TICKET_FK2 FOREIGN KEY(FILM_NUMBER)
		REFERENCES MOVIE(FILM_NUMBER),
	CONSTRAINT TICKET_FK3 FOREIGN KEY(ID)
		REFERENCES MEMBER(ID),
	CONSTRAINT TICKET_PK PRIMARY KEY(TICKET_NUMBER)	
);


INSERT INTO THEATER(THEATER_NAME) VALUES('강남'); -- 1
INSERT INTO THEATER(THEATER_NAME) VALUES('영등포'); -- 2
INSERT INTO THEATER(THEATER_NAME) VALUES('구로'); -- 3 
INSERT INTO THEATER(THEATER_NAME) VALUES('마포'); -- 4
INSERT INTO THEATER(THEATER_NAME) VALUES('동서울'); -- 5
INSERT INTO THEATER(THEATER_NAME) VALUES('동수원'); -- 6
INSERT INTO THEATER(THEATER_NAME) VALUES('부천'); -- 7
INSERT INTO THEATER(THEATER_NAME) VALUES('수원'); -- 8
INSERT INTO THEATER(THEATER_NAME) VALUES('군자'); -- 9
INSERT INTO THEATER(THEATER_NAME) VALUES('신도림'); -- 10
INSERT INTO THEATER(THEATER_NAME) VALUES('용산'); -- 11
INSERT INTO THEATER(THEATER_NAME) VALUES('인천'); -- 12
INSERT INTO THEATER(THEATER_NAME) VALUES('대전'); -- 13
INSERT INTO THEATER(THEATER_NAME) VALUES('해운대'); -- 14
INSERT INTO THEATER(THEATER_NAME) VALUES('제주'); -- 15

INSERT INTO MEMBER VALUES('choa','1','초아','90','여','010-1111-1111','서울특별시 강남구','choa@naver.com',null,now());
INSERT INTO MEMBER VALUES('hong','1','홍길동','44','남','010-2222-2222','서울특별시 동작구','hong@naver.com',null,now()-5);
INSERT INTO MEMBER VALUES('yeon','1','태연','90','여','010-3333-3333','서울특별시 마포구','yeon@naver.com',null,now()-20);
INSERT INTO MEMBER VALUES('bang','1','이방원','37','남','010-4444-4444','수원시 권선구','bang@naver.com',null,now()-150);
INSERT INTO MEMBER VALUES('kim','1','김유신','55','남','010-5555-5555','서울특별시 구로구','kim@naver.com',null,now()-120);
INSERT INTO MEMBER VALUES('jiwoo','1','지우','88','남','010-6666-6666','수원시 팔달구','jiwoo@naver.com',null,now()-35);
INSERT INTO MEMBER VALUES('lux','1','럭스','78','여','010-7777-7777','수원시 호매실동','lux@naver.com',null,now()-27);
INSERT INTO MEMBER VALUES('talon','1','탈론','94','남','010-8888-8888','부산시 해운대','talon@naver.com',null,now()-15);
INSERT INTO MEMBER VALUES('zed','1','제드','90','남','010-9999-9999','부천시 원미구','zed@daum.net',null,now());
INSERT INTO MEMBER VALUES('shen','1','쉔','86','남','010-1010-1010','서울특별시 강서구','shen@daum.net',null,now());
INSERT INTO MEMBER VALUES('jonadan','1','조나단','80','남','010-1101-1101','서울특별시 강남구','jonadan@daum.net',null,now()-10);
INSERT INTO MEMBER VALUES('jane','1','제인','90','여','010-1212-1212','서울특별시 강남구','jane@nate.com',null,now()-10);
INSERT INTO MEMBER VALUES('iu','1','아이유','90','여','010-1313-1313','인천시 연수구','iu@nate.com',null,now());
INSERT INTO MEMBER VALUES('rise','1','라이즈','98','남','010-1414-1414','인천시 남동구','rise@lycos.com',null,now());
INSERT INTO MEMBER VALUES('fortune','1','미스포츈','93','여','010-1515-1515','인천시 남동구','fortune@lycos.com',null,now());

INSERT INTO MOVIE VALUES('A001','내부자들','우민호','이병헌, 조승우, 백윤식','청소년 관람불가',130,10000,'한국','범죄, 드라마','2015/11/18','2015/12/18',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A002','이터널 선샤인','미셸 공드리','짐 캐리, 케이트 윈슬렛, 커스틴 던스트, 마크 러팔로, 일라이저 우드','15세 이상',107,10000,'미국','로맨스, 멜로','2015/11/05','2015/12/05',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A003','검은 사제들','장재현','김윤석, 강동원, 박소담','15세 이상',108,10000,'한국','미스터리, 드라마','2015/11/05','2015/12/05',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A004','열정같은소리하고있네','정기훈','정재영, 박보영, 오달수, 진경, 배성우, 류현경, 류덕환, 윤균상','15세 이상',106,10000,'한국','드라마','2015/11/25','2015/12/25',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A005','괴물의 아이','호소다 마모루','야쿠쇼 코지, 미야자키 아오이, 소메타니 쇼타, 히로세 스즈, 오이즈미 요, 릴리 프랭키','12세 이상',119,10000,'일본','애니메이션, 어드벤처, 환타지','2015/11/25','2015/12/25',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A006','도리화가','이종필','류승룡, 배수지, 송새벽, 김남길, 이동휘, 안재홍','12세 이상',109,10000,'한국','드라마','2015/11/25','2015/12/25',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A007','헝거게임:더 파이널','프랜시스 로렌스','제니퍼 로렌스, 조쉬 허처슨, 리암 헴스워드, 니탈리 도머, 줄리안 무어, 필립 세이무어 호프만, 릴리 라베','15세 이상',137,10000,'미국','액션, 환타지','2015/11/18','2015/12/18',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A008','크림슨 피크','길예르모 델 토로','톰 히들스턴, 제시카 차스테인, 미아 와시코브스카','청소년 관람불가',119,10000,'미국','스릴러, 환타지','2015/11/25','2015/12/25',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A009','007 스펙터','샘 멘데스','다니엘 크레이그, 레아 세이두, 크리스토프 왈츠, 모니카 벨루치','15세 이상',148,10000,'미국, 영국','스릴러, 환타지','2015/11/11','2015/12/11',NULL,NULL,NULL);
INSERT INTO MOVIE VALUES('A010','프리덤','피터 코센스','쿠바 구딩 주니어, 베르나르드 포처, 윌리암 새들러','12세 이상',95,10000,'미국','드라마','2015/11/19','2015/12/19',NULL,NULL,NULL);

INSERT INTO ROOM VALUES(1,'1관',16,16,16,16,16,16,16,16,16,16);
INSERT INTO ROOM VALUES(1,'2관',16,16,16,16,16,16,16,16,16,0);
INSERT INTO ROOM VALUES(1,'3관',16,16,16,16,16,16,16,16,16,0);
INSERT INTO ROOM VALUES(1,'4관',12,16,16,16,16,16,16,16,16,0);
INSERT INTO ROOM VALUES(1,'5관',12,16,16,16,16,16,16,16,0,0);

	
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/18','09:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/18','12:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/18','15:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/18','18:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/18','21:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/18','09:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/18','12:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/18','15:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/18','18:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/18','21:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/18','09:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/18','12:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/18','15:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/18','18:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/18','21:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/18','08:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/18','11:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A005',1,'4관','2015/11/18','14:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A006',1,'4관','2015/11/18','17:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/18','20:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/18','10:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A008',1,'5관','2015/11/18','13:20',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/18','15:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A009',1,'5관','2015/11/18','19:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A010',1,'5관','2015/11/18','23:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/19','09:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/19','12:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/19','15:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/19','18:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/19','21:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/19','09:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/19','12:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/19','15:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/19','18:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/19','21:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/19','09:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/19','12:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/19','15:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/19','18:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/19','21:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/19','08:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/19','11:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A005',1,'4관','2015/11/19','14:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A006',1,'4관','2015/11/19','17:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/19','20:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/19','10:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A008',1,'5관','2015/11/19','13:20',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/19','15:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A009',1,'5관','2015/11/19','19:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A010',1,'5관','2015/11/19','23:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/20','09:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/20','12:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/20','15:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/20','18:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/20','21:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/20','09:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/20','12:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/20','15:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/20','18:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/20','21:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/20','09:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/20','12:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/20','15:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/20','18:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/20','21:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/20','08:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/20','11:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A005',1,'4관','2015/11/20','14:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A006',1,'4관','2015/11/20','17:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/20','20:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/20','10:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A008',1,'5관','2015/11/20','13:20',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/20','15:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A009',1,'5관','2015/11/20','19:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A010',1,'5관','2015/11/20','23:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/21','09:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/21','12:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/21','15:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/21','18:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/21','21:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/21','09:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/21','12:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/21','15:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/21','18:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/21','21:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/21','09:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/21','12:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/21','15:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/21','18:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/21','21:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/21','08:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/21','11:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A005',1,'4관','2015/11/21','14:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A006',1,'4관','2015/11/21','17:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/21','20:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/21','10:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A008',1,'5관','2015/11/21','13:20',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/21','15:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A009',1,'5관','2015/11/21','19:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A010',1,'5관','2015/11/21','23:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/22','09:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/22','12:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/22','15:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/22','18:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A001',1,'1관','2015/11/22','21:00',160);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/22','09:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/22','12:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/22','15:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/22','18:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A002',1,'2관','2015/11/22','21:20',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/22','09:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/22','12:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/22','15:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/22','18:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A003',1,'3관','2015/11/22','21:40',144);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/22','08:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/22','11:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A005',1,'4관','2015/11/22','14:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A006',1,'4관','2015/11/22','17:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A004',1,'4관','2015/11/22','20:40',140);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/22','10:00',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A008',1,'5관','2015/11/22','13:20',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A007',1,'5관','2015/11/22','15:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A009',1,'5관','2015/11/22','19:40',124);
INSERT INTO SCHEDULE(FILM_NUMBER,THEATER_SEQ,ROOM_NAME,SHOW_DATE,SHOW_TIME,SEAT_STATUS) VALUES('A010',1,'5관','2015/11/22','23:00',124);



UPDATE MOVIE SET STORY='A001S' WHERE FILM_NUMBER='A001';
UPDATE MOVIE SET STORY='A002S' WHERE FILM_NUMBER='A002';
UPDATE MOVIE SET STORY='A003S' WHERE FILM_NUMBER='A003';
UPDATE MOVIE SET STORY='A004S' WHERE FILM_NUMBER='A004';
UPDATE MOVIE SET STORY='A005S' WHERE FILM_NUMBER='A005';
UPDATE MOVIE SET STORY='A006S' WHERE FILM_NUMBER='A006';
UPDATE MOVIE SET STORY='A007S' WHERE FILM_NUMBER='A007';
UPDATE MOVIE SET STORY='A008S' WHERE FILM_NUMBER='A008';
UPDATE MOVIE SET STORY='A009S' WHERE FILM_NUMBER='A009';
UPDATE MOVIE SET STORY='A010S' WHERE FILM_NUMBER='A010';

UPDATE MOVIE SET CUT='A001/A0011/A0012/A0013/A0014/A0015/A0016/A0017' WHERE FILM_NUMBER='A001';
UPDATE MOVIE SET CUT='A002/A0021/A0022/A0023/A0024/A0025/A0026' WHERE FILM_NUMBER='A002';
UPDATE MOVIE SET CUT='A003/A0031/A0032/A0033/A0034/A0035/A0036/A0037/A0038/A0039' WHERE FILM_NUMBER='A003';
UPDATE MOVIE SET CUT='A004/A0041/A0042/A0043/A0044/A0045/A0046/A0047/A0048/A0049' WHERE FILM_NUMBER='A004';
UPDATE MOVIE SET CUT='A005/A0051/A0052/A0053/A0054/A0055/A0056' WHERE FILM_NUMBER='A005';
UPDATE MOVIE SET CUT='A006/A0061/A0062/A0063/A0064/A0065/A0066/A0067/A0068' WHERE FILM_NUMBER='A006';
UPDATE MOVIE SET CUT='A007/A0071/A0072/A0073/A0074/A0075' WHERE FILM_NUMBER='A007';
UPDATE MOVIE SET CUT='A008/A0081/A0082/A0083/A0084/A0085/A0086/A0087/A0088/A0089' WHERE FILM_NUMBER='A008';
UPDATE MOVIE SET CUT='A009/A0091/A0092/A0093/A0094/A0095/A0096/A0097/A0098/A0099/A00910/A00911' WHERE FILM_NUMBER='A009';
UPDATE MOVIE SET CUT='A010/A0101/A0102/A0103/A0104/A0105/A0106' WHERE FILM_NUMBER='A010';

UPDATE MOVIE SET TRAILER='PjAxHoauiTs/BKO8Zl5DR5Q/UZy8aopPmwE' WHERE FILM_NUMBER='A001';
UPDATE MOVIE SET TRAILER='Zyzop2nzR4k/EHhHewjBCb4/yE-f1alkq9I' WHERE FILM_NUMBER='A002';
UPDATE MOVIE SET TRAILER='_Mq89LG2gfw/TJeM0pD-vus/B0D9Gg8PI6s' WHERE FILM_NUMBER='A003';
UPDATE MOVIE SET TRAILER='gZZin4RKaXw/WThABv8Kq1w/BzctMGVtnQA' WHERE FILM_NUMBER='A004';
UPDATE MOVIE SET TRAILER='wo7X8NwnZAw/dOXRB9JiydQ/NF6wZOR2CCU' WHERE FILM_NUMBER='A005';
UPDATE MOVIE SET TRAILER='u7YshVJx23A/MM_RRIhRpPg/gxAwcS_ErAY' WHERE FILM_NUMBER='A006';
UPDATE MOVIE SET TRAILER='_hCceaMeHOE/x-8VXx5I0gg/uRnetgm_jUA' WHERE FILM_NUMBER='A007';
UPDATE MOVIE SET TRAILER='i_WNdO0EsdE/mU20xVCPi2o/hPAxmoUXu_k' WHERE FILM_NUMBER='A008';
UPDATE MOVIE SET TRAILER='FKWCV61We7I/5GrThQMuPK0/-wT76eIL5mo' WHERE FILM_NUMBER='A009';
UPDATE MOVIE SET TRAILER='fvIzZ9qezV8/foMNxnyfLFU/vQFU-UKfEvE' WHERE FILM_NUMBER='A010';

COMMIT;