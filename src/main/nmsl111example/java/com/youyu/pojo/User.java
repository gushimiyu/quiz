package com.youyu.pojo;

public class User {
    private String acc;

    private String passwd;

    public User(String acc,String passwd){
        this.acc=acc;
        this.passwd=passwd;
    }

    public String getAcc() {
        return acc;
    }

    public void setAcc(String acc) {
        this.acc = acc == null ? null : acc.trim();
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd == null ? null : passwd.trim();
    }
}