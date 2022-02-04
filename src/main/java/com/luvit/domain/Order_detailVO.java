package com.luvit.domain;

import java.sql.Date;

public class Order_detailVO {

	private String o_d_ono;
	private String o_d_id;
	private int o_d_amount;
	private int o_d_pno;
	
	public Order_detailVO() {}
	
	public Order_detailVO(String o_d_ono, String o_d_id, int o_d_amount, int o_d_pno) {
		super();
		this.o_d_ono = o_d_ono;
		this.o_d_id = o_d_id;
		this.o_d_amount = o_d_amount;
		this.o_d_pno = o_d_pno;
	}
	public String getO_d_ono() {
		return o_d_ono;
	}
	public void setO_d_ono(String o_d_ono) {
		this.o_d_ono = o_d_ono;
	}
	public String getO_d_id() {
		return o_d_id;
	}
	public void setO_d_id(String o_d_id) {
		this.o_d_id = o_d_id;
	}
	public int getO_d_amount() {
		return o_d_amount;
	}
	public void setO_d_amount(int o_d_amount) {
		this.o_d_amount = o_d_amount;
	}
	public int getO_d_pno() {
		return o_d_pno;
	}
	public void setO_d_pno(int o_d_pno) {
		this.o_d_pno = o_d_pno;
	}
	@Override
	public String toString() {
		return "Order_detailVO [o_d_ono=" + o_d_ono + ", o_d_id=" + o_d_id + ", o_d_amount=" + o_d_amount + ", o_d_pno="
				+ o_d_pno + "]";
	}
	
	
	
	
}
