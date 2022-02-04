package com.luvit.domain;

import java.sql.Date;
import java.sql.Timestamp;


public class OrderVO {

    ////////////////////////
    private String o_orderer;
    ////////////////////////
//    ORDER
    private String o_ono;
    private String o_oid;
    private String o_pno;
    private String o_option;
    private int o_amount;
    private String o_receiver;
    private String o_addr1;
    private String o_addr2;
    private String o_post_num;
    private String o_tel;
    private String o_memo;
    private int o_sum;
    private String o_pay;
    private String o_payer;
    private Timestamp o_paydate;
    private String o_orderdate;
    private String o_delivery;
    /////////////////////////
//  ORDER DETAIL
    private String o_d_ono;
    private String o_d_id;
    private int o_d_amount;
    private int o_d_pno;
    /////////////////////////
//  ORDER LIST
//    private String o_ono;
    private String o_id;
    //    private String o_receiver;
//    private String o_addr1;
//    private String o_addr2;
//    private String o_post_num;
//    private String o_tel;
//    private String o_memo;
//    private int o_sum;
//    private String o_pay;
//    private String o_delivery;
    private String o_invoice;
    //    private String o_payer;
    private String o_account_num;
    private String o_receiver_tel;
    private Date o_date;
    /////////////////////////


    /////////////////////////
//    STORE
    private int s_pno;
    private String s_product;
    private String s_id;
    private String s_pw;
    private String s_subject;
    private String s_price;
    private String s_content;
    private String s_thumbnail;
    private String s_file;
    private String s_option;
    private String s_cate;
    private int s_hit;
    private int s_amount;
    private Date s_date;


    ////////////////////////
//    CART
    private int c_ono;
    private int c_pno;
    private String c_id;
    private Date date;
    private int c_amount;

    private int c_no;
    private String c_product;
    private int c_price;
    private String c_thumbnail;
    private String c_option;
    ///////////////////////
//    USER

    private Timestamp reg_date;
    private int point;
    private int grade;

    private int user_num;

    private String id;
    private String pw;
    private String email;
    private String email_hash;
    private String email_check;
    private String nickname;
    // PAY
    private String ono;
    //    private String id;
    private String receiver;
    private String payer;
    private String post_num;
    private String addr1;
    private String addr2;
    private String receiver_tel;
    private int sum;
//    private Date date;

    private int pno;
    private int amount;
    private int price;
    private String thumbnail;
    private String product;
    private String memo;
    private String delivery;
    private String invoice;

//    private String o_invoice;
//    reciever nn,addr1 nn,tel nn,payment nn,payer nn


    @Override
    public String toString() {
        return "OrderVO{" +
                "o_orderer='" + o_orderer + '\'' +
                ", o_ono='" + o_ono + '\'' +
                ", o_oid='" + o_oid + '\'' +
                ", o_pno='" + o_pno + '\'' +
                ", o_option='" + o_option + '\'' +
                ", o_amount=" + o_amount +
                ", o_receiver='" + o_receiver + '\'' +
                ", o_addr1='" + o_addr1 + '\'' +
                ", o_addr2='" + o_addr2 + '\'' +
                ", o_post_num='" + o_post_num + '\'' +
                ", o_tel='" + o_tel + '\'' +
                ", o_memo='" + o_memo + '\'' +
                ", o_sum=" + o_sum +
                ", o_pay='" + o_pay + '\'' +
                ", o_payer='" + o_payer + '\'' +
                ", o_paydate=" + o_paydate +
                ", o_orderdate='" + o_orderdate + '\'' +
                ", o_delivery='" + o_delivery + '\'' +
                ", o_d_ono='" + o_d_ono + '\'' +
                ", o_d_id='" + o_d_id + '\'' +
                ", o_d_amount=" + o_d_amount +
                ", o_d_pno=" + o_d_pno +
                ", o_id='" + o_id + '\'' +
                ", o_invoice='" + o_invoice + '\'' +
                ", o_account_num='" + o_account_num + '\'' +
                ", o_receiver_tel='" + o_receiver_tel + '\'' +
                ", o_date=" + o_date +
                ", s_pno=" + s_pno +
                ", s_product='" + s_product + '\'' +
                ", s_id='" + s_id + '\'' +
                ", s_pw='" + s_pw + '\'' +
                ", s_subject='" + s_subject + '\'' +
                ", s_price='" + s_price + '\'' +
                ", s_content='" + s_content + '\'' +
                ", s_thumbnail='" + s_thumbnail + '\'' +
                ", s_file='" + s_file + '\'' +
                ", s_option='" + s_option + '\'' +
                ", s_cate='" + s_cate + '\'' +
                ", s_hit=" + s_hit +
                ", s_amount=" + s_amount +
                ", s_date=" + s_date +
                ", c_ono=" + c_ono +
                ", c_pno=" + c_pno +
                ", c_id='" + c_id + '\'' +
                ", date=" + date +
                ", c_amount=" + c_amount +
                ", c_no=" + c_no +
                ", c_product='" + c_product + '\'' +
                ", c_price=" + c_price +
                ", c_thumbnail='" + c_thumbnail + '\'' +
                ", c_option='" + c_option + '\'' +
                ", reg_date=" + reg_date +
                ", point=" + point +
                ", grade=" + grade +
                ", user_num=" + user_num +
                ", id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", email='" + email + '\'' +
                ", email_hash='" + email_hash + '\'' +
                ", email_check='" + email_check + '\'' +
                ", nickname='" + nickname + '\'' +
                ", ono='" + ono + '\'' +
                ", receiver='" + receiver + '\'' +
                ", payer='" + payer + '\'' +
                ", post_num='" + post_num + '\'' +
                ", addr1='" + addr1 + '\'' +
                ", addr2='" + addr2 + '\'' +
                ", receiver_tel='" + receiver_tel + '\'' +
                ", sum=" + sum +
                ", pno=" + pno +
                ", amount=" + amount +
                ", price=" + price +
                ", thumbnail='" + thumbnail + '\'' +
                ", product='" + product + '\'' +
                ", memo='" + memo + '\'' +
                ", delivery='" + delivery + '\'' +
                ", invoice='" + invoice + '\'' +
                '}';
    }

    public String getO_orderer() {
        return o_orderer;
    }

    public void setO_orderer(String o_orderer) {
        this.o_orderer = o_orderer;
    }

    public String getO_ono() {
        return o_ono;
    }

    public void setO_ono(String o_ono) {
        this.o_ono = o_ono;
    }

    public String getO_oid() {
        return o_oid;
    }

    public void setO_oid(String o_oid) {
        this.o_oid = o_oid;
    }

    public String getO_pno() {
        return o_pno;
    }

    public void setO_pno(String o_pno) {
        this.o_pno = o_pno;
    }

    public String getO_option() {
        return o_option;
    }

    public void setO_option(String o_option) {
        this.o_option = o_option;
    }

    public int getO_amount() {
        return o_amount;
    }

    public void setO_amount(int o_amount) {
        this.o_amount = o_amount;
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

    public String getO_payer() {
        return o_payer;
    }

    public void setO_payer(String o_payer) {
        this.o_payer = o_payer;
    }

    public Timestamp getO_paydate() {
        return o_paydate;
    }

    public void setO_paydate(Timestamp o_paydate) {
        this.o_paydate = o_paydate;
    }

    public String getO_orderdate() {
        return o_orderdate;
    }

    public void setO_orderdate(String o_orderdate) {
        this.o_orderdate = o_orderdate;
    }

    public String getO_delivery() {
        return o_delivery;
    }

    public void setO_delivery(String o_delivery) {
        this.o_delivery = o_delivery;
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

    public String getO_id() {
        return o_id;
    }

    public void setO_id(String o_id) {
        this.o_id = o_id;
    }

    public String getO_invoice() {
        return o_invoice;
    }

    public void setO_invoice(String o_invoice) {
        this.o_invoice = o_invoice;
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

    public int getS_pno() {
        return s_pno;
    }

    public void setS_pno(int s_pno) {
        this.s_pno = s_pno;
    }

    public String getS_product() {
        return s_product;
    }

    public void setS_product(String s_product) {
        this.s_product = s_product;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public String getS_pw() {
        return s_pw;
    }

    public void setS_pw(String s_pw) {
        this.s_pw = s_pw;
    }

    public String getS_subject() {
        return s_subject;
    }

    public void setS_subject(String s_subject) {
        this.s_subject = s_subject;
    }

    public String getS_price() {
        return s_price;
    }

    public void setS_price(String s_price) {
        this.s_price = s_price;
    }

    public String getS_content() {
        return s_content;
    }

    public void setS_content(String s_content) {
        this.s_content = s_content;
    }

    public String getS_thumbnail() {
        return s_thumbnail;
    }

    public void setS_thumbnail(String s_thumbnail) {
        this.s_thumbnail = s_thumbnail;
    }

    public String getS_file() {
        return s_file;
    }

    public void setS_file(String s_file) {
        this.s_file = s_file;
    }

    public String getS_option() {
        return s_option;
    }

    public void setS_option(String s_option) {
        this.s_option = s_option;
    }

    public String getS_cate() {
        return s_cate;
    }

    public void setS_cate(String s_cate) {
        this.s_cate = s_cate;
    }

    public int getS_hit() {
        return s_hit;
    }

    public void setS_hit(int s_hit) {
        this.s_hit = s_hit;
    }

    public int getS_amount() {
        return s_amount;
    }

    public void setS_amount(int s_amount) {
        this.s_amount = s_amount;
    }

    public Date getS_date() {
        return s_date;
    }

    public void setS_date(Date s_date) {
        this.s_date = s_date;
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

    public String getC_option() {
        return c_option;
    }

    public void setC_option(String c_option) {
        this.c_option = c_option;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getUser_num() {
        return user_num;
    }

    public void setUser_num(int user_num) {
        this.user_num = user_num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail_hash() {
        return email_hash;
    }

    public void setEmail_hash(String email_hash) {
        this.email_hash = email_hash;
    }

    public String getEmail_check() {
        return email_check;
    }

    public void setEmail_check(String email_check) {
        this.email_check = email_check;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getOno() {
        return ono;
    }

    public void setOno(String ono) {
        this.ono = ono;
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

    public OrderVO() {
    }

    public OrderVO(String o_orderer, String o_ono, String o_oid, String o_pno, String o_option, int o_amount, String o_receiver, String o_addr1, String o_addr2, String o_post_num, String o_tel, String o_memo, int o_sum, String o_pay, String o_payer, Timestamp o_paydate, String o_orderdate, String o_delivery, String o_d_ono, String o_d_id, int o_d_amount, int o_d_pno, String o_id, String o_invoice, String o_account_num, String o_receiver_tel, Date o_date, int s_pno, String s_product, String s_id, String s_pw, String s_subject, String s_price, String s_content, String s_thumbnail, String s_file, String s_option, String s_cate, int s_hit, int s_amount, Date s_date, int c_ono, int c_pno, String c_id, Date date, int c_amount, int c_no, String c_product, int c_price, String c_thumbnail, String c_option, Timestamp reg_date, int point, int grade, int user_num, String id, String pw, String email, String email_hash, String email_check, String nickname, String ono, String receiver, String payer, String post_num, String addr1, String addr2, String receiver_tel, int sum, int pno, int amount, int price, String thumbnail, String product, String memo, String delivery, String invoice) {
        this.o_orderer = o_orderer;
        this.o_ono = o_ono;
        this.o_oid = o_oid;
        this.o_pno = o_pno;
        this.o_option = o_option;
        this.o_amount = o_amount;
        this.o_receiver = o_receiver;
        this.o_addr1 = o_addr1;
        this.o_addr2 = o_addr2;
        this.o_post_num = o_post_num;
        this.o_tel = o_tel;
        this.o_memo = o_memo;
        this.o_sum = o_sum;
        this.o_pay = o_pay;
        this.o_payer = o_payer;
        this.o_paydate = o_paydate;
        this.o_orderdate = o_orderdate;
        this.o_delivery = o_delivery;
        this.o_d_ono = o_d_ono;
        this.o_d_id = o_d_id;
        this.o_d_amount = o_d_amount;
        this.o_d_pno = o_d_pno;
        this.o_id = o_id;
        this.o_invoice = o_invoice;
        this.o_account_num = o_account_num;
        this.o_receiver_tel = o_receiver_tel;
        this.o_date = o_date;
        this.s_pno = s_pno;
        this.s_product = s_product;
        this.s_id = s_id;
        this.s_pw = s_pw;
        this.s_subject = s_subject;
        this.s_price = s_price;
        this.s_content = s_content;
        this.s_thumbnail = s_thumbnail;
        this.s_file = s_file;
        this.s_option = s_option;
        this.s_cate = s_cate;
        this.s_hit = s_hit;
        this.s_amount = s_amount;
        this.s_date = s_date;
        this.c_ono = c_ono;
        this.c_pno = c_pno;
        this.c_id = c_id;
        this.date = date;
        this.c_amount = c_amount;
        this.c_no = c_no;
        this.c_product = c_product;
        this.c_price = c_price;
        this.c_thumbnail = c_thumbnail;
        this.c_option = c_option;
        this.reg_date = reg_date;
        this.point = point;
        this.grade = grade;
        this.user_num = user_num;
        this.id = id;
        this.pw = pw;
        this.email = email;
        this.email_hash = email_hash;
        this.email_check = email_check;
        this.nickname = nickname;
        this.ono = ono;
        this.receiver = receiver;
        this.payer = payer;
        this.post_num = post_num;
        this.addr1 = addr1;
        this.addr2 = addr2;
        this.receiver_tel = receiver_tel;
        this.sum = sum;
        this.pno = pno;
        this.amount = amount;
        this.price = price;
        this.thumbnail = thumbnail;
        this.product = product;
        this.memo = memo;
        this.delivery = delivery;
        this.invoice = invoice;
    }
}
