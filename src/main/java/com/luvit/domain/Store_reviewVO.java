package com.luvit.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Store_reviewVO {
	private int s_r_bno;
	private String s_r_id;
	private String s_r_nickname;
	private String s_r_subject;
	private String s_r_contents;
	private String s_r_file;
	private String s_r_thumbnail;
	private Date s_r_date;
	private int s_r_hit;
	private int s_r_like_count;
	private int s_r_pno;
	private String s_r_cate;
	private int s_r_rating;
	
	public Store_reviewVO() {}
	
	
	public int getS_r_bno() {
		return s_r_bno;
	}
	public void setS_r_bno(int s_r_bno) {
		this.s_r_bno = s_r_bno;
	}
	public String getS_r_id() {
		return s_r_id;
	}
	public void setS_r_id(String s_r_id) {
		this.s_r_id = s_r_id;
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
	public int getS_r_pno() {
		return s_r_pno;
	}
	public void setS_r_pno(int s_r_pno) {
		this.s_r_pno = s_r_pno;
	}
	public String getS_r_cate() {
		return s_r_cate;
	}
	public void setS_r_cate(String s_r_cate) {
		this.s_r_cate = s_r_cate;
	}
	public int getS_r_rating() {
		return s_r_rating;
	}
	public void setS_r_rating(int s_r_rating) {
		this.s_r_rating = s_r_rating;
	}
	
	@Override
	public String toString() {
		return "Store_reviewVO [s_r_bno=" + s_r_bno + ", s_r_id=" + s_r_id + ", s_r_nickname=" + s_r_nickname
				+ ", s_r_subject=" + s_r_subject + ", s_r_contents=" + s_r_contents + ", s_r_file=" + s_r_file
				+ ", s_r_thumbnail=" + s_r_thumbnail + ", s_r_date=" + s_r_date + ", s_r_hit=" + s_r_hit
				+ ", s_r_like_count=" + s_r_like_count + ", s_r_pno=" + s_r_pno + ", s_r_cate=" + s_r_cate
				+ ", s_r_rating=" + s_r_rating + "]";
	}
	
	public Store_reviewVO(int s_r_bno, String s_r_id, String s_r_nickname, String s_r_subject, String s_r_contents,
			String s_r_file, String s_r_thumbnail, Date s_r_date, int s_r_hit, int s_r_like_count, int s_r_pno,
			String s_r_cate, int s_r_rating) {
		super();
		this.s_r_bno = s_r_bno;
		this.s_r_id = s_r_id;
		this.s_r_nickname = s_r_nickname;
		this.s_r_subject = s_r_subject;
		this.s_r_contents = s_r_contents;
		this.s_r_file = s_r_file;
		this.s_r_thumbnail = s_r_thumbnail;
		this.s_r_date = s_r_date;
		this.s_r_hit = s_r_hit;
		this.s_r_like_count = s_r_like_count;
		this.s_r_pno = s_r_pno;
		this.s_r_cate = s_r_cate;
		this.s_r_rating = s_r_rating;
	}
	

}
	
	