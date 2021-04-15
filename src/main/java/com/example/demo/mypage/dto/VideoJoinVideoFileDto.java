package com.example.demo.mypage.dto;

// 비디오 테이블과 비디오_파일 테이블 조인해서 데이터 가져오기 
public class VideoJoinVideoFileDto {

	// 비디오 테이블 컬럼 
	private int video_number;
	private String user_id;
	private String category_code;
	private String video_title;
	private char public_check;
	private int video_hits;
	private int video_reports;
	private String video_date;
	private String video_rank_limit;
	
	// 비디오_파일 테이블 
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
