package com.luvit.domain;

import java.sql.Timestamp;

public class Tip_commentVO {
	
	private int t_c_cno;
	private int t_c_bno;
	private String t_c_content;
	private String t_c_nickname;
	private Timestamp t_c_date;
	private double t_c_rating;
	
	public Tip_commentVO(int t_c_cno, int t_c_bno, String t_c_content, String t_c_nickname, Timestamp t_c_date,
			double t_c_rating) {
		super();
		this.t_c_cno = t_c_cno;
		this.t_c_bno = t_c_bno;
		this.t_c_content = t_c_content;
		this.t_c_nickname = t_c_nickname;
		this.t_c_date = t_c_date;
		this.t_c_rating = t_c_rating;
	}
	
	public Tip_commentVO() {}

	public int getT_c_cno() {
		return t_c_cno;
	}

	public void setT_c_cno(int t_c_cno) {
		this.t_c_cno = t_c_cno;
	}

	public int getT_c_bno() {
		return t_c_bno;
	}

	public void setT_c_bno(int t_c_bno) {
		this.t_c_bno = t_c_bno;
	}

	public String getT_c_content() {
		return t_c_content;
	}

	public void setT_c_content(String t_c_content) {
		this.t_c_content = t_c_content;
	}

	public String getT_c_nickname() {
		return t_c_nickname;
	}

	public void setT_c_nickname(String t_c_nickname) {
		this.t_c_nickname = t_c_nickname;
	}

	public Timestamp getT_c_date() {
		return t_c_date;
	}

	public void setT_c_date(Timestamp t_c_date) {
		this.t_c_date = t_c_date;
	}

	public double getT_c_rating() {
		return t_c_rating;
	}

	public void setT_c_rating(double t_c_rating) {
		this.t_c_rating = t_c_rating;
	}

	@Override
	public String toString() {
		return "Tip_commentVO [t_c_cno=" + t_c_cno + ", t_c_bno=" + t_c_bno + ", t_c_content=" + t_c_content
				+ ", t_c_nickname=" + t_c_nickname + ", t_c_date=" + t_c_date + ", t_c_rating=" + t_c_rating + "]";
	}
	
	
	
	
	
	
	
	
	
	
	

}
