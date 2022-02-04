package com.luvit.domain;

import java.sql.Date;

public class CartListVO {
	
	private int c_ono;
	private int c_pno;
	private String c_id;
	private Date date;
	private int c_amount;
	
	private int c_no;
	private String c_product;
	private int c_price;
	private String c_thumbnail;
	
	
	public CartListVO() {}
	public CartListVO(int c_ono, int c_pno, String c_id, Date date, int c_amount, int c_no, String c_product, int c_price,
			String c_thumbnail) {
		super();
		this.c_ono = c_ono;
		this.c_pno = c_pno;
		this.c_id = c_id;
		this.date = date;
		this.c_amount = c_amount;
		this.c_no = c_no;
		this.c_product = c_product;
		this.c_price = c_price;
		this.c_thumbnail = c_thumbnail;
	}



	public int getC_ono() {
		return c_ono;
	}



	public void setC_ono(int c_ono) {
		this.c_ono = c_ono;
	}



	public int getC_pno() {
		return c_pno;
	}



	public void setC_pno(int c_pno) {
		this.c_pno = c_pno;
	}



	public String getC_id() {
		return c_id;
	}



	public void setC_id(String c_id) {
		this.c_id = c_id;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public int getC_amount() {
		return c_amount;
	}



	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}



	public int getC_no() {
		return c_no;
	}



	public void setC_no(int c_no) {
		this.c_no = c_no;
	}



	public String getC_product() {
		return c_product;
	}



	public void setC_product(String c_product) {
		this.c_product = c_product;
	}



	public int getC_price() {
		return c_price;
	}



	public void setC_price(int c_price) {
		this.c_price = c_price;
	}



	public String getC_thumbnail() {
		return c_thumbnail;
	}



	public void setC_thumbnail(String c_thumbnail) {
		this.c_thumbnail = c_thumbnail;
	}



	@Override
	public String toString() {
		return "CartVO [c_ono=" + c_ono + ", c_pno=" + c_pno + ", c_id=" + c_id + ", date=" + date + ", c_amount="
				+ c_amount + ", c_no=" + c_no + ", c_product=" + c_product + ", c_price=" + c_price + ", c_thumbnail="
				+ c_thumbnail + "]";
	}

	
	
}
