package com.youyu.pojo;

public class Options {
    private Integer id;

    private Integer belongsto;

    private Integer nextquestion;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBelongsto() {
        return belongsto;
    }

    public void setBelongsto(Integer belongsto) {
        this.belongsto = belongsto;
    }

    public Integer getNextquestion() {
        return nextquestion;
    }

    public void setNextquestion(Integer nextquestion) {
        this.nextquestion = nextquestion;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}