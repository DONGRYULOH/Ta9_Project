package com.example.demo.category.dto;

import java.util.Date;

import lombok.Data;

/*
 	CREATE TABLE `blame` (
	`blame_number`	INT	NOT NULL AUTO_INCREMENT,
	`video_number`	INT	NOT NULL,
	`user_id`	VARCHAR(20)	NOT NULL,
	`blame_date`	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`blame_name`	VARCHAR(300) NOT NULL,
    PRIMARY KEY(blame_number)
);
 */

@Data
public class BlameDto {
	private int blame_number;
	private int video_number;
	private String user_id;
	private Date blame_date;
	private String blame_name;
}
