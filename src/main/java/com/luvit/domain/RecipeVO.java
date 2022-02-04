package com.luvit.domain;

import java.sql.Timestamp;

public class RecipeVO {
	
	private int r_bno;
	private String r_subject;
	private String r_introduce;
	private String r_ing;
	private String r_content;
	private String r_tag1;
	private String r_tag2;
	private String r_tag3;
	private String r_tag4;
	private String r_cate;
	private String r_cooking_time;
	private String r_nickname;
	private String r_kcal;
	private int r_like_count;
	private int r_hit;
	private Timestamp r_date;
	private String r_thumbnail;
	private String r_file;
	private String r_id;
	private double r_avg;
	
	public RecipeVO() {}

	public RecipeVO(int r_bno, String r_subject, String r_introduce, String r_ing, String r_content, String r_tag1,
			String r_tag2, String r_tag3, String r_tag4, String r_cate, String r_cooking_time, String r_nickname,
			String r_kcal, int r_like_count, int r_hit, Timestamp r_date, String r_thumbnail, String r_file,
			String r_id, double r_avg) {
		super();
		this.r_bno = r_bno;
		this.r_subject = r_subject;
		this.r_introduce = r_introduce;
		this.r_ing = r_ing;
		this.r_content = r_content;
		this.r_tag1 = r_tag1;
		this.r_tag2 = r_tag2;
		this.r_tag3 = r_tag3;
		this.r_tag4 = r_tag4;
		this.r_cate = r_cate;
		this.r_cooking_time = r_cooking_time;
		this.r_nickname = r_nickname;
		this.r_kcal = r_kcal;
		this.r_like_count = r_like_count;
		this.r_hit = r_hit;
		this.r_date = r_date;
		this.r_thumbnail = r_thumbnail;
		this.r_file = r_file;
		this.r_id = r_id;
		this.r_avg = r_avg;
	}




	public int getR_bno() {
		return r_bno;
	}


	public void setR_bno(int r_bno) {
		this.r_bno = r_bno;
	}


	public String getR_subject() {
		return r_subject;
	}


	public void setR_subject(String r_subject) {
		this.r_subject = r_subject;
	}


	public String getR_introduce() {
		return r_introduce;
	}


	public void setR_introduce(String r_introduce) {
		this.r_introduce = r_introduce;
	}


	public String getR_ing() {
		return r_ing;
	}


	public void setR_ing(String r_ing) {
		this.r_ing = r_ing;
	}


	public String getR_content() {
		return r_content;
	}


	public void setR_content(String r_content) {
		this.r_content = r_content;
	}


	public String getR_tag1() {
		return r_tag1;
	}


	public void setR_tag1(String r_tag1) {
		this.r_tag1 = r_tag1;
	}


	public String getR_tag2() {
		return r_tag2;
	}


	public void setR_tag2(String r_tag2) {
		this.r_tag2 = r_tag2;
	}


	public String getR_tag3() {
		return r_tag3;
	}


	public void setR_tag3(String r_tag3) {
		this.r_tag3 = r_tag3;
	}


	public String getR_tag4() {
		return r_tag4;
	}


	public void setR_tag4(String r_tag4) {
		this.r_tag4 = r_tag4;
	}


	public String getR_cate() {
		return r_cate;
	}


	public void setR_cate(String r_cate) {
		this.r_cate = r_cate;
	}


	public String getR_cooking_time() {
		return r_cooking_time;
	}


	public void setR_cooking_time(String r_cooking_time) {
		this.r_cooking_time = r_cooking_time;
	}


	public String getR_nickname() {
		return r_nickname;
	}


	public void setR_nickname(String r_nickname) {
		this.r_nickname = r_nickname;
	}


	public String getR_kcal() {
		return r_kcal;
	}


	public void setR_kcal(String r_kcal) {
		this.r_kcal = r_kcal;
	}


	public int getR_like_count() {
		return r_like_count;
	}


	public void setR_like_count(int r_like_count) {
		this.r_like_count = r_like_count;
	}


	public int getR_hit() {
		return r_hit;
	}


	public void setR_hit(int r_hit) {
		this.r_hit = r_hit;
	}


	public Timestamp getR_date() {
		return r_date;
	}


	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}


	public String getR_thumbnail() {
		return r_thumbnail;
	}


	public void setR_thumbnail(String r_thumbnail) {
		this.r_thumbnail = r_thumbnail;
	}


	public String getR_file() {
		return r_file;
	}


	public void setR_file(String r_file) {
		this.r_file = r_file;
	}


	public String getR_id() {
		return r_id;
	}


	public void setR_id(String r_id) {
		this.r_id = r_id;
	}




	public double getR_avg() {
		return r_avg;
	}




	public void setR_avg(double r_avg) {
		this.r_avg = r_avg;
	}




	@Override
	public String toString() {
		return "RecipeVO [r_bno=" + r_bno + ", r_subject=" + r_subject + ", r_introduce=" + r_introduce + ", r_ing="
				+ r_ing + ", r_content=" + r_content + ", r_tag1=" + r_tag1 + ", r_tag2=" + r_tag2 + ", r_tag3="
				+ r_tag3 + ", r_tag4=" + r_tag4 + ", r_cate=" + r_cate + ", r_cooking_time=" + r_cooking_time
				+ ", r_nickname=" + r_nickname + ", r_kcal=" + r_kcal + ", r_like_count=" + r_like_count + ", r_hit="
				+ r_hit + ", r_date=" + r_date + ", r_thumbnail=" + r_thumbnail + ", r_file=" + r_file + ", r_id="
				+ r_id + ", r_avg=" + r_avg + "]";
	}


	
	
	
	
	
	
}
