package com.luvit.domain;

import java.sql.Date;

public class BoardStoreReviewVO {

	int    s_r_bno;
	String s_r_nickname;
	String s_r_subject;
	String s_r_contents;
	String s_r_file;
	String s_r_thumbnail;
	Date   s_r_date;
	int    s_r_hit;
	int    s_r_like_count;
	
	public int getS_r_bno() {
		return s_r_bno;
	}
	public void setS_r_bno(int s_r_bno) {
		this.s_r_bno = s_r_bno;
	}
	public String getS_r_nickname() {
		return s_r_nickname;
	}
	public void setS_r_nickname(String s_r_nickname) {
		this.s_r_nickname = s_r_nickname;
	}
	public String getS_r_subject() {
		return s_r_subject;
	}
	public void setS_r_subject(String s_r_subject) {
		this.s_r_subject = s_r_subject;
	}
	public String getS_r_contents() {
		return s_r_contents;
	}
	public void setS_r_contents(String s_r_contents) {
		this.s_r_contents = s_r_contents;
	}
	public String getS_r_file() {
		return s_r_file;
	}
	public void setS_r_file(String s_r_file) {
		this.s_r_file = s_r_file;
	}
	public String getS_r_thumbnail() {
		return s_r_thumbnail;
	}
	public void setS_r_thumbnail(String s_r_thumbnail) {
		this.s_r_thumbnail = s_r_thumbnail;
	}
	public Date getS_r_date() {
		return s_r_date;
	}
	public void setS_r_date(Date s_r_date) {
		this.s_r_date = s_r_date;
	}
	public int getS_r_hit() {
		return s_r_hit;
	}
	public void setS_r_hit(int s_r_hit) {
		this.s_r_hit = s_r_hit;
	}
	public int getS_r_like_count() {
		return s_r_like_count;
	}
	public void setS_r_like_count(int s_r_like_count) {
		this.s_r_like_count = s_r_like_count;
	}
	
	@Override
	public String toString() {
		return "BoardStoreReviewVO [s_r_bno=" + s_r_bno + ", s_r_nickname=" + s_r_nickname + ", s_r_subject="
				+ s_r_subject + ", s_r_contents=" + s_r_contents + ", s_r_file=" + s_r_file + ", s_r_thumbnail="
				+ s_r_thumbnail + ", s_r_date=" + s_r_date + ", s_r_hit=" + s_r_hit + ", s_r_like_count="
				+ s_r_like_count + "]";
	}

	  
	  
}
