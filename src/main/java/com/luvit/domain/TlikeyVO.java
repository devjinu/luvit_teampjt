package com.luvit.domain;

public class TlikeyVO {
	
	  private int like_num;
	  
	  private int l_t_bno;
	  
	  private int user_num;

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public int getL_t_bno() {
		return l_t_bno;
	}

	public void setL_t_bno(int l_t_bno) {
		this.l_t_bno = l_t_bno;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	@Override
	public String toString() {
		return "TlikeyVO [like_num=" + like_num + ", l_t_bno=" + l_t_bno + ", user_num=" + user_num + "]";
	}
	  
}
