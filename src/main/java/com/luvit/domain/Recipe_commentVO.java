package com.luvit.domain;

import java.sql.Timestamp;

public class Recipe_commentVO {
	
	private int r_c_cno;
	private int r_c_bno;
	private String r_c_content;
	private String r_c_nickname;
	private Timestamp r_c_date;
	private double r_c_rating;
	
	public Recipe_commentVO() {}
	public Recipe_commentVO(int r_c_cno, int r_c_bno, String r_c_content, String r_c_nickname, Timestamp r_c_date,
			double r_c_rating) {
		super();
		this.r_c_cno = r_c_cno;
		this.r_c_bno = r_c_bno;
		this.r_c_content = r_c_content;
		this.r_c_nickname = r_c_nickname;
		this.r_c_date = r_c_date;
		this.r_c_rating = r_c_rating;
	}
	
	
	public int getR_c_cno() {
		return r_c_cno;
	}
	public void setR_c_cno(int r_c_cno) {
		this.r_c_cno = r_c_cno;
	}
	public int getR_c_bno() {
		return r_c_bno;
	}
	public void setR_c_bno(int r_c_bno) {
		this.r_c_bno = r_c_bno;
	}
	public String getR_c_content() {
		return r_c_content;
	}
	public void setR_c_content(String r_c_content) {
		this.r_c_content = r_c_content;
	}
	public String getR_c_nickname() {
		return r_c_nickname;
	}
	public void setR_c_nickname(String r_c_nickname) {
		this.r_c_nickname = r_c_nickname;
	}
	public Timestamp getR_c_date() {
		return r_c_date;
	}
	public void setR_c_date(Timestamp r_c_date) {
		this.r_c_date = r_c_date;
	}
	public double getR_c_rating() {
		return r_c_rating;
	}
	public void setR_c_rating(double r_c_rating) {
		this.r_c_rating = r_c_rating;
	}
	
	@Override
	public String toString() {
		return "Recipe_commentVO [r_c_cno=" + r_c_cno + ", r_c_bno=" + r_c_bno + ", r_c_content=" + r_c_content
				+ ", r_c_nickname=" + r_c_nickname + ", r_c_date=" + r_c_date + ", r_c_rating=" + r_c_rating + "]";
	}
	
	

}
