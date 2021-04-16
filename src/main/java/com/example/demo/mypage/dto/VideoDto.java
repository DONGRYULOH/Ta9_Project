package com.example.demo.mypage.dto;

import lombok.Data;
import lombok.Getter;

/*
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
    video_rank_limit varchar(10) not null default 'no_rank', -- 전체공개가 'Y' 인 경우에는 랭크 제한이 없으므로 default 값을 넣어줌 
    PRIMARY KEY(video_number),
    FOREIGN KEY(user_id) REFERENCES user(user_id),
    FOREIGN KEY(category_code) REFERENCES video_category(category_code)
);
 */
@Data
public class VideoDto {
	
	private int video_number;
	private String user_id;
	private String category_code;
	private String video_title;
	private char public_check;
	private int video_hits;
	private int video_reports;
	private String video_date;
	private String video_rank_limit;
	
	
}






















