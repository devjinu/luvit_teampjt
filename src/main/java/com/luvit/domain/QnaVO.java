package com.luvit.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {

	private int    q_bno;
	private String q_nickname;
	private String q_subject;
	private String q_contents;
	private String q_file;
	private Date   q_date;
	private int    q_hit;
	private String q_secret;
	private String q_pw;
	private int    q_re_ref;
	private int    q_re_lev;
	private int    q_re_seq;
	private MultipartFile uploadFile;
	
	public int getQ_bno() {
		return q_bno;
	}
	public void setQ_bno(int q_bno) {
		this.q_bno = q_bno;
	}
	public String getQ_nickname() {
		return q_nickname;
	}
	public void setQ_nickname(String q_nickname) {
		this.q_nickname = q_nickname;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_contents() {
		return q_contents;
	}
	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}
	public String getQ_file() {
		return q_file;
	}
	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}
	public String getQ_secret() {
		return q_secret;
	}
	public void setQ_secret(String q_secret) {
		this.q_secret = q_secret;
	}
	public String getQ_pw() {
		return q_pw;
	}
	public void setQ_pw(String q_pw) {
		this.q_pw = q_pw;
	}
	public int getQ_re_ref() {
		return q_re_ref;
	}
	public void setQ_re_ref(int q_re_ref) {
		this.q_re_ref = q_re_ref;
	}
	public int getQ_re_lev() {
		return q_re_lev;
	}
	public void setQ_re_lev(int q_re_lev) {
		this.q_re_lev = q_re_lev;
	}
	public int getQ_re_seq() {
		return q_re_seq;
	}
	public void setQ_re_seq(int q_re_seq) {
		this.q_re_seq = q_re_seq;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	@Override
	public String toString() {
		return "QnaVO [q_bno=" + q_bno + ", q_nickname=" + q_nickname + ", q_subject=" + q_subject + ", q_contents="
				+ q_contents + ", q_file=" + q_file + ", q_date=" + q_date + ", q_hit=" + q_hit + ", q_secret="
				+ q_secret + ", q_pw=" + q_pw + ", q_re_ref=" + q_re_ref + ", q_re_lev=" + q_re_lev + ", q_re_seq="
				+ q_re_seq + ", uploadFile=" + uploadFile + "]";
	}
	
	

	
	

	
}
