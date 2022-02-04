package com.luvit.domain;

public class LikeyVO {
	
	private int likey_num;
	private String l_id;
	private int l_t_bno;
	private int likey_check;
	
	public LikeyVO () {}

	public LikeyVO(int likey_num, String l_id, int l_t_bno, int likey_check) {
		super();
		this.likey_num = likey_num;
		this.l_id = l_id;
		this.l_t_bno = l_t_bno;
		this.likey_check = likey_check;
	}

	public int getLikey_num() {
		return likey_num;
	}

	public void setLikey_num(int likey_num) {
		this.likey_num = likey_num;
	}

	public String getL_id() {
		return l_id;
	}

	public void setL_id(String l_id) {
		this.l_id = l_id;
	}

	public int getL_t_bno() {
		return l_t_bno;
	}

	public void setL_t_bno(int l_t_bno) {
		this.l_t_bno = l_t_bno;
	}

	public int getLikey_check() {
		return likey_check;
	}

	public void setLikey_check(int likey_check) {
		this.likey_check = likey_check;
	}

	@Override
	public String toString() {
		return "LikeyVO [likey_num=" + likey_num + ", l_id=" + l_id + ", l_t_bno=" + l_t_bno + ", likey_check="
				+ likey_check + "]";
	}

	
	
	

}
