package com.luvit.domain;



import java.sql.Date;
import java.sql.Timestamp;


public class Order_listVO {

	private String o_ono;
	private String o_id;
	private String o_receiver;
	private String o_addr1;
	private String o_addr2;
	private String o_post_num;
	private String o_tel;
	private String o_memo;
	private int o_sum;
	private String o_pay;
	private String o_delivery;
	private String o_invoice;
	private String o_payer;
	private String o_account_num;
	private String o_receiver_tel;
	private Date o_date;
	
	public Order_listVO() {}

	public Order_listVO(String o_ono, String o_id, String o_receiver, String o_addr1, String o_addr2, String o_post_num,
			String o_tel, String o_memo, int o_sum, String o_pay, String o_delivery, String o_invoice, String o_payer,
			String o_account_num, String o_receiver_tel, Date o_date) {
		super();
		this.o_ono = o_ono;
		this.o_id = o_id;
		this.o_receiver = o_receiver;
		this.o_addr1 = o_addr1;
		this.o_addr2 = o_addr2;
		this.o_post_num = o_post_num;
		this.o_tel = o_tel;
		this.o_memo = o_memo;
		this.o_sum = o_sum;
		this.o_pay = o_pay;
		this.o_delivery = o_delivery;
		this.o_invoice = o_invoice;
		this.o_payer = o_payer;
		this.o_account_num = o_account_num;
		this.o_receiver_tel = o_receiver_tel;
		this.o_date = o_date;
	}

	public String getO_ono() {
		return o_ono;
	}

	public void setO_ono(String o_ono) {
		this.o_ono = o_ono;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getO_receiver() {
		return o_receiver;
	}

	public void setO_receiver(String o_receiver) {
		this.o_receiver = o_receiver;
	}

	public String getO_addr1() {
		return o_addr1;
	}

	public void setO_addr1(String o_addr1) {
		this.o_addr1 = o_addr1;
	}

	public String getO_addr2() {
		return o_addr2;
	}

	public void setO_addr2(String o_addr2) {
		this.o_addr2 = o_addr2;
	}

	public String getO_post_num() {
		return o_post_num;
	}

	public void setO_post_num(String o_post_num) {
		this.o_post_num = o_post_num;
	}

	public String getO_tel() {
		return o_tel;
	}

	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}

	public String getO_memo() {
		return o_memo;
	}

	public void setO_memo(String o_memo) {
		this.o_memo = o_memo;
	}

	public int getO_sum() {
		return o_sum;
	}

	public void setO_sum(int o_sum) {
		this.o_sum = o_sum;
	}

	public String getO_pay() {
		return o_pay;
	}

	public void setO_pay(String o_pay) {
		this.o_pay = o_pay;
	}

	public String getO_delivery() {
		return o_delivery;
	}

	public void setO_delivery(String o_delivery) {
		this.o_delivery = o_delivery;
	}

	public String getO_invoice() {
		return o_invoice;
	}

	public void setO_invoice(String o_invoice) {
		this.o_invoice = o_invoice;
	}

	public String getO_payer() {
		return o_payer;
	}

	public void setO_payer(String o_payer) {
		this.o_payer = o_payer;
	}

	public String getO_account_num() {
		return o_account_num;
	}

	public void setO_account_num(String o_account_num) {
		this.o_account_num = o_account_num;
	}

	public String getO_receiver_tel() {
		return o_receiver_tel;
	}

	public void setO_receiver_tel(String o_receiver_tel) {
		this.o_receiver_tel = o_receiver_tel;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	@Override
	public String toString() {
		return "Order_listVO [o_ono=" + o_ono + ", o_id=" + o_id + ", o_receiver=" + o_receiver + ", o_addr1=" + o_addr1
				+ ", o_addr2=" + o_addr2 + ", o_post_num=" + o_post_num + ", o_tel=" + o_tel + ", o_memo=" + o_memo
				+ ", o_sum=" + o_sum + ", o_pay=" + o_pay + ", o_delivery=" + o_delivery + ", o_invoice=" + o_invoice
				+ ", o_payer=" + o_payer + ", o_account_num=" + o_account_num + ", o_receiver_tel=" + o_receiver_tel
				+ ", o_date=" + o_date + "]";
	}
	
	

}
