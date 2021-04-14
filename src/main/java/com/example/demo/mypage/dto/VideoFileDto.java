package com.example.demo.mypage.dto;
/*
 	-- 비디오_파일 테이블 
	create table video_file(
		video_number int not null,
	    orgin_video_name varchar(260) not null,
	    stored_video_name varchar(36) not null,
		orgin_video_thumb varchar(260) not null,
	    stored_video_thumb varchar(36) not null,
	    FOREIGN KEY(video_number) REFERENCES video(video_number)
	);
 */
public class VideoFileDto {
	
	private int video_number;
	private String orgin_video_name;
	private String stored_video_name;
	private String orgin_video_thumb;
	private String stored_video_thumb;
	
	public int getVideo_number() {
		return video_number;
	}
	public void setVideo_number(int video_number) {
		this.video_number = video_number;
	}
	public String getOrgin_video_name() {
		return orgin_video_name;
	}
	public void setOrgin_video_name(String orgin_video_name) {
		this.orgin_video_name = orgin_video_name;
	}
	public String getStored_video_name() {
		return stored_video_name;
	}
	public void setStored_video_name(String stored_video_name) {
		this.stored_video_name = stored_video_name;
	}
	public String getOrgin_video_thumb() {
		return orgin_video_thumb;
	}
	public void setOrgin_video_thumb(String orgin_video_thumb) {
		this.orgin_video_thumb = orgin_video_thumb;
	}
	public String getStored_video_thumb() {
		return stored_video_thumb;
	}
	public void setStored_video_thumb(String stored_video_thumb) {
		this.stored_video_thumb = stored_video_thumb;
	}
	
	
}
