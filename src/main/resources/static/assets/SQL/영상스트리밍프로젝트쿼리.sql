
-- 회원 테이블 
create table user(
	user_id varchar(20) not null,
    user_pwd varchar(100) not null,
    user_nickname varchar(20) not null,
    user_exp int not null default 0,
    user_rank varchar(20) default 'Bronze' not null,
    user_insertdate datetime DEFAULT CURRENT_TIMESTAMP not null, 
    user_leavedate datetime null,
    PRIMARY KEY(user_id)
    );
drop table user;
    
select * from user;

-- 회원 상태 테이블 
CREATE TABLE `user_st` (
	`user_id`	VARCHAR(20)	NOT NULL,
	`user_status`	INT	default '1' NOT NULL,
	`user_status_name`	VARCHAR(20) default '일반' NOT NULL    
);

ALTER TABLE `user_st` ADD CONSTRAINT `PK_USER_ST` PRIMARY KEY (
	`user_id`
);
drop table user_st;
select * from user_st;
-- 비디오카테고리 테이블 
create table video_category(
	category_code varchar(10) not null,
    category_name varchar(50) not null,
    PRIMARY KEY(category_code)
);

insert into video_category(category_code,category_name) 
		values("101","스포츠");
insert into video_category(category_code,category_name) 
		values("102","개발");
insert into video_category(category_code,category_name) 
		values("103","경제");        
insert into video_category(category_code,category_name) 
		values("104","외국어");
insert into video_category(category_code,category_name) 
		values("105","ETC");        

select * from video_category;

-- 비디오 테이블 
create table video(
	video_number int not null auto_increment,
    user_id varchar(20) not null,
    category_code varchar(10) not null,
    video_title varchar(30) not null,
    public_check char(1) not null, -- 공개여부 ( Y -> 전체 공개 , N -> 등급별 공개) 
    video_hits int not null default 0,
    video_reports int not null default 0,
    video_date datetime DEFAULT CURRENT_TIMESTAMP not null, 
    video_rank_limit varchar(10) DEFAULT 'no_rank' not null , -- 전체공개가 'Y' 인 경우에는 랭크 제한이 없으므로 default 값을 넣어줌 
    PRIMARY KEY(video_number),
    FOREIGN KEY(user_id) REFERENCES user(user_id),
    FOREIGN KEY(category_code) REFERENCES video_category(category_code)
);

drop table video;
desc video;

delete from video;
insert into video(user_id,category_code,video_title,public_check) 
values('dong1234','101','참조제약','Y');

select * from video;
-- 비디오_파일 테이블 
create table video_file(
	video_number int not null,
    orgin_video_name varchar(300) not null,
    stored_video_name varchar(300) not null,
	orgin_video_thumb varchar(300) not null,
    stored_video_thumb varchar(300) not null,
    FOREIGN KEY(video_number) REFERENCES video(video_number)
);
desc video_file;

drop table video_file;
insert into video_file(video_number,orgin_video_name,stored_video_name,orgin_video_thumb,stored_video_thumb)
values(1,'ad','dad','dasd','asdd');

select * from video_file;
delete from video_file;

-- 비디오 테이블의 해당 컬럼이 삭제되면 해당 컬럼을 참조하는 비디오_파일 행도 삭제가 되는 제약 조건 
alter table video_file add constraint videoFile_video foreign key(video_number)
references video(video_number) on delete cascade; 

-- 비디오 테이블 + 비디오_파일 테이블 조인 
select v.video_number,v.user_id,v.category_code,v.video_title,v.public_check,v.video_hits,v.video_reports,v.video_rank_limit,vf.orgin_video_name,vf.stored_video_name,vf.orgin_video_thumb,vf.stored_video_thumb
	from video v inner join video_file vf 
    on v.video_number = vf.video_number
    where user_id = 'ehdfbf123';
    



SELECT P.product_number,P.product_name,P.category_code,P.product_price,P.product_stock,P.product_desc,P.product_date,PI.stored_thumbNail
				FROM Product P INNER JOIN (SELECT product_number,stored_thumbNail FROM Product_imageFile WHERE delegate_thumbNail = 'Y' AND delete_check = 'N') PI
				ON P.product_number = PI.product_number
			ORDER BY P.product_number DESC






























