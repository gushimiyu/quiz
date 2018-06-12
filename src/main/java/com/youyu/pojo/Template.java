package com.youyu.pojo;

public class Template {
    private Integer id;

    private String typee;

    private String content;

    private String qtype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypee() {
        return typee;
    }

    public void setTypee(String typee) {
        this.typee = typee == null ? null : typee.trim();
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype == null ? null : qtype.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}