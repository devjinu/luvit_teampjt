package com.luvit.domain;

public class RlikeyVO {
	
	  private int like_num;
	  
	  private int l_r_bno;
	  
	  private int user_num;
	  
	  private String like_check;

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public int getL_r_bno() {
		return l_r_bno;
	}

	public void setL_r_bno(int l_r_bno) {
		this.l_r_bno = l_r_bno;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getLike_check() {
		return like_check;
	}

	public void setLike_check(String like_check) {
		this.like_check = like_check;
	}

	@Override
	public String toString() {
		return "RlikeyVO [like_num=" + like_num + ", l_r_bno=" + l_r_bno + ", user_num=" + user_num + ", like_check="
				+ like_check + "]";
	}

	
	
	  
}
