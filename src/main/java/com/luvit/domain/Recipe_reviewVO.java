package com.luvit.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class Recipe_reviewVO {
	
/* 
<recipe_review 테이블 정보>
r_r_bno			int(11)			pk,ai
r_r_id			varchar(45)		nn
r_r_nickname	varchar(100)	nn
r_r_subject		varchar(200)	nn
r_r_content		varchar(2000)	nn
r_r_file		varchar(2000)
r_r_thumbnail	varchar(2000)
r_r_date		timestamp		now()
r_r_hit			int(11)			'0'
*/
	
	private int r_r_bno;
	private String r_r_id;
	private String r_r_nickname;
	private String r_r_subject;
	private String r_r_content;
	private String r_r_file;
	private String r_r_thumbnail;
	private Timestamp r_r_date;
	private int r_r_hit;
	
	public Recipe_reviewVO(int r_r_bno, String r_r_id, String r_r_nickname, String r_r_subject, String r_r_content,
			String r_r_file, String r_r_thumbnail, Timestamp r_r_date, int r_r_hit) {
		super();
		this.r_r_bno = r_r_bno;
		this.r_r_id = r_r_id;
		this.r_r_nickname = r_r_nickname;
		this.r_r_subject = r_r_subject;
		this.r_r_content = r_r_content;
		this.r_r_file = r_r_file;
		this.r_r_thumbnail = r_r_thumbnail;
		this.r_r_date = r_r_date;
		this.r_r_hit = r_r_hit;
	}

	public Recipe_reviewVO() {}
	
	public int getR_r_bno() {
		return r_r_bno;
	}

	public void setR_r_bno(int r_r_bno) {
		this.r_r_bno = r_r_bno;
	}

	public String getR_r_id() {
		return r_r_id;
	}

	public void setR_r_id(String r_r_id) {
		this.r_r_id = r_r_id;
	}

	public String getR_r_nickname() {
		return r_r_nickname;
	}

	public void setR_r_nickname(String r_r_nickname) {
		this.r_r_nickname = r_r_nickname;
	}

	public String getR_r_subject() {
		return r_r_subject;
	}

	public void setR_r_subject(String r_r_subject) {
		this.r_r_subject = r_r_subject;
	}

	public String getR_r_content() {
		return r_r_content;
	}

	public void setR_r_content(String r_r_content) {
		this.r_r_content = r_r_content;
	}

	public String getR_r_file() {
		return r_r_file;
	}

	public String setR_r_file(String r_r_file) {
		return this.r_r_file = r_r_file;
	}

	public String getR_r_thumbnail() {
		return r_r_thumbnail;
	}

	public String setR_r_thumbnail(String r_r_thumbnail) {
		return this.r_r_thumbnail = r_r_thumbnail;
	}

	public Timestamp getR_r_date() {
		return r_r_date;
	}

	public void setR_r_date(Timestamp r_r_date) {
		this.r_r_date = r_r_date;
	}

	public int getR_r_hit() {
		return r_r_hit;
	}

	public void setR_r_hit(int r_r_hit) {
		this.r_r_hit = r_r_hit;
	}
	
	@Override
	public String toString() {
		return "Recipe_reviewVO [r_r_bno=" + r_r_bno + ", r_r_id=" + r_r_id + ", r_r_nickname=" + r_r_nickname
				+ ", r_r_subject=" + r_r_subject + ", r_r_content=" + r_r_content + ", r_r_file=" + r_r_file
				+ ", r_r_thumbnail=" + r_r_thumbnail + ", r_r_hit=" + r_r_hit + "]";
	}
}
