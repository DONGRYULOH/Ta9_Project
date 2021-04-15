package com.example.demo.mypage.dto;
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
	
	public int getVideo_number() {
		return video_number;
	}
	public void setVideo_number(int video_number) {
		this.video_number = video_number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getVideo_title() {
		return video_title;
	}
	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}
	public char getPublic_check() {
		return public_check;
	}
	public void setPublic_check(char public_check) {
		this.public_check = public_check;
	}
	public int getVideo_hits() {
		return video_hits;
	}
	public void setVideo_hits(int video_hits) {
		this.video_hits = video_hits;
	}
	public int getVideo_reports() {
		return video_reports;
	}
	public void setVideo_reports(int video_reports) {
		this.video_reports = video_reports;
	}
	public String getVideo_date() {
		return video_date;
	}
	public void setVideo_date(String video_date) {
		this.video_date = video_date;
	}
	public String getVideo_rank_limit() {
		return video_rank_limit;
	}
	public void setVideo_rank_limit(String video_rank_limit) {
		this.video_rank_limit = video_rank_limit;
	}
	
	
	
	
}