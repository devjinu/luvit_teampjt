package com.luvit.domain;

import java.sql.Timestamp;

/*
   도메인(domain) : 개발(프로젝트)에서 가장 중요한 용어(단어) '명사'
   -> 회원, 상품, 글, 주문, 배송,.... (1차 도메인)
   -> 회원 - 가입, 탈퇴, 수정,.....  (2차 도메인)
   => '물리적인 환경으로 분리가 가능한 단위'
    ->  DB 테이블을 구분할수 있다.
*/

public class TipVO {
	
	private String t_bno;
	private String t_nickname;
	private String t_subject;
	private String t_content;
	private String t_file;
	private String t_thumbnail;
	private Timestamp t_date;
	private int t_hit;
	private int t_like_count;
	private String t_id;
	private double t_avg;
	
	public TipVO(){}
	
	public TipVO(String t_bno, String t_nickname, String t_subject, String t_content, String t_file, String t_thumbnail,
			Timestamp t_date, int t_hit, int t_like_count, String t_id, double t_avg) {
		super();
		this.t_bno = t_bno;
		this.t_nickname = t_nickname;
		this.t_subject = t_subject;
		this.t_content = t_content;
		this.t_file = t_file;
		this.t_thumbnail = t_thumbnail;
		this.t_date = t_date;
		this.t_hit = t_hit;
		this.t_like_count = t_like_count;
		this.t_id = t_id;
		this.t_avg = t_avg;
	}



	public String getT_bno() {
		return t_bno;
	}

	public void setT_bno(String t_bno) {
		this.t_bno = t_bno;
	}

	public String getT_nickname() {
		return t_nickname;
	}

	public void setT_nickname(String t_nickname) {
		this.t_nickname = t_nickname;
	}

	public String getT_subject() {
		return t_subject;
	}

	public void setT_subject(String t_subject) {
		this.t_subject = t_subject;
	}

	public String getT_content() {
		return t_content;
	}

	public void setT_content(String t_content) {
		this.t_content = t_content;
	}

	public String getT_file() {
		return t_file;
	}

	public void setT_file(String t_file) {
		this.t_file = t_file;
	}

	public String getT_thumbnail() {
		return t_thumbnail;
	}

	public void setT_thumbnail(String t_thumbnail) {
		this.t_thumbnail = t_thumbnail;
	}

	public Timestamp getT_date() {
		return t_date;
	}

	public void setT_date(Timestamp t_date) {
		this.t_date = t_date;
	}

	public int getT_hit() {
		return t_hit;
	}

	public void setT_hit(int t_hit) {
		this.t_hit = t_hit;
	}

	public int getT_like_count() {
		return t_like_count;
	}

	public void setT_like_count(int t_like_count) {
		this.t_like_count = t_like_count;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public double getT_avg() {
		return t_avg;
	}

	public void setT_avg(double t_avg) {
		this.t_avg = t_avg;
	}

	@Override
	public String toString() {
		return "TipVO [t_bno=" + t_bno + ", t_nickname=" + t_nickname + ", t_subject=" + t_subject + ", t_content="
				+ t_content + ", t_file=" + t_file + ", t_thumbnail=" + t_thumbnail + ", t_date=" + t_date + ", t_hit="
				+ t_hit + ", t_like_count=" + t_like_count + ", t_id=" + t_id + ", t_avg=" + t_avg + "]";
	}
	
	
	

}
