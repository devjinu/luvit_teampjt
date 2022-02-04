package com.luvit.domain;

public class Store_review_likeVO {
	private int s_r_l_bno;
	private String s_r_l_id;
	private int likeno;
	
	
	public Store_review_likeVO(int s_r_l_bno, String s_r_l_id, int likeno) {
		super();
		this.s_r_l_bno = s_r_l_bno;
		this.s_r_l_id = s_r_l_id;
		this.likeno = likeno;
	}

	public Store_review_likeVO() {}

	public int getS_r_l_bno() {
		return s_r_l_bno;
	}

	public void setS_r_l_bno(int s_r_l_bno) {
		this.s_r_l_bno = s_r_l_bno;
	}

	public String getS_r_l_id() {
		return s_r_l_id;
	}

	public void setS_r_l_id(String s_r_l_id) {
		this.s_r_l_id = s_r_l_id;
	}

	public int getLikeno() {
		return likeno;
	}

	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}

	@Override
	public String toString() {
		return "Store_review_likeVO [s_r_l_bno=" + s_r_l_bno + ", s_r_l_id=" + s_r_l_id + ", likeno=" + likeno + "]";
	}

}