package com.luvit.domain;

import java.sql.Date;

public class StoreVO {

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

    public StoreVO() {
    }

    public StoreVO(int s_pno, String s_product, String s_id, String s_pw, String s_subject, String s_price,
                   String s_content, String s_thumbnail, String s_file, String s_option, String s_cate, int s_hit,
                   int s_amount, Date s_date) {
        super();
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

    @Override
    public String toString() {
        return "StoreVO [s_pno=" + s_pno + ", s_product=" + s_product + ", s_id=" + s_id + ", s_pw=" + s_pw
                + ", s_subject=" + s_subject + ", s_price=" + s_price + ", s_content=" + s_content + ", s_thumbnail="
                + s_thumbnail + ", s_file=" + s_file + ", s_option=" + s_option + ", s_cate=" + s_cate + ", s_hit="
                + s_hit + ", s_amount=" + s_amount + ", s_date=" + s_date + "]";
    }


}

