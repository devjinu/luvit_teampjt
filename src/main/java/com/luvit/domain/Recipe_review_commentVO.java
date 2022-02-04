package com.luvit.domain;

import java.sql.Timestamp;

public class Recipe_review_commentVO {

	private int r_r_c_cno;
	private int r_r_c_bno;
	private String r_r_c_content;
	private String r_r_c_nickname;
	private Timestamp r_r_c_date;
	
	public Recipe_review_commentVO(int r_r_c_cno, int r_r_c_bno, String r_r_c_content, String r_r_c_nickname,
			Timestamp r_r_c_date) {
		super();
		this.r_r_c_cno = r_r_c_cno;
		this.r_r_c_bno = r_r_c_bno;
		this.r_r_c_content = r_r_c_content;
		this.r_r_c_nickname = r_r_c_nickname;
		this.r_r_c_date = r_r_c_date;
	}
	public Recipe_review_commentVO() {}
	
	public int getR_r_c_cno() {
		return r_r_c_cno;
	}
	public void setR_r_c_cno(int r_r_c_cno) {
		this.r_r_c_cno = r_r_c_cno;
	}
	public int getR_r_c_bno() {
		return r_r_c_bno;
	}
	public void setR_r_c_bno(int r_r_c_bno) {
		this.r_r_c_bno = r_r_c_bno;
	}
	public String getR_r_c_content() {
		return r_r_c_content;
	}
	public void setR_r_c_content(String r_r_c_content) {
		this.r_r_c_content = r_r_c_content;
	}
	public String getR_r_c_nickname() {
		return r_r_c_nickname;
	}
	public void setR_r_c_nickname(String r_r_c_nickname) {
		this.r_r_c_nickname = r_r_c_nickname;
	}
	public Timestamp getR_r_c_date() {
		return r_r_c_date;
	}
	public void setR_r_c_date(Timestamp r_r_c_date) {
		this.r_r_c_date = r_r_c_date;
	}
	
	@Override
	public String toString() {
		return "Recipe_review_commentVO [r_r_c_cno=" + r_r_c_cno + ", r_r_c_bno=" + r_r_c_bno + ", r_r_c_content="
				+ r_r_c_content + ", r_r_c_nickname=" + r_r_c_nickname + ", r_r_c_date=" + r_r_c_date
				+ "]";
	}
	
}
