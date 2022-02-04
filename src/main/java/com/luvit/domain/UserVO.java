package com.luvit.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserVO implements Serializable {

    // now()
    private Timestamp reg_date;
    private int point;
    private int grade;
    // AI
    private int user_num;

    private String id;
    private String pw;
    private String email;
    private String email_hash;
    private String email_check;
    private String nickname;


    public UserVO() {
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "reg_date=" + reg_date +
                ", point=" + point +
                ", grade=" + grade +
                ", user_num=" + user_num +
                ", id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", email='" + email + '\'' +
                ", email_hash='" + email_hash + '\'' +
                ", email_check='" + email_check + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }

    public UserVO(Timestamp reg_date, int point, int grade, int user_num, String id, String pw, String email, String email_hash, String email_check, String nickname) {
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
}
