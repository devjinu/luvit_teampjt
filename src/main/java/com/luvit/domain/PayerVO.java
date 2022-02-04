package com.luvit.domain;

import java.sql.Date;

public class PayerVO {

	private String ono;
	private String id;
	private String receiver;
	private String payer;
	private String post_num;
	private String addr1;
	private String addr2;
	private String receiver_tel;
	private int sum;
	private Date date;
	
	private int pno;
	private int amount;
	private int price;
	private String thumbnail;
	private String product;
	private String memo;
	private String delivery;
	private String invoice;
	private String option;
	
	public PayerVO() {}
	
	public PayerVO(String ono, String id, String receiver, String payer, String post_num, String addr1, String addr2,
			String receiver_tel, int sum, Date date, int pno, int amount, int price, String thumbnail, String product,
			String memo, String delivery, String invoice,String option) {
		super();
		this.ono = ono;
		this.id = id;
		this.receiver = receiver;
		this.payer = payer;
		this.post_num = post_num;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.receiver_tel = receiver_tel;
		this.sum = sum;
		this.date = date;
		this.pno = pno;
		this.amount = amount;
		this.price = price;
		this.thumbnail = thumbnail;
		this.product = product;
		this.memo = memo;
		this.delivery = delivery;
		this.invoice = invoice;
		this.option = option;
	}

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getPayer() {
		return payer;
	}

	public void setPayer(String payer) {
		this.payer = payer;
	}

	public String getPost_num() {
		return post_num;
	}

	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getReceiver_tel() {
		return receiver_tel;
	}

	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	
	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	@Override
	public String toString() {
		return "PayerVO [ono=" + ono + ", id=" + id + ", receiver=" + receiver + ", payer=" + payer + ", post_num="
				+ post_num + ", addr1=" + addr1 + ", addr2=" + addr2 + ", receiver_tel=" + receiver_tel + ", sum=" + sum
				+ ", date=" + date + ", pno=" + pno + ", amount=" + amount + ", price=" + price + ", thumbnail="
				+ thumbnail + ", product=" + product + ", memo=" + memo + ", delivery=" + delivery + ", invoice="
				+ invoice + ", option"+ option +"]";
	}
	
	
	
	
	
}