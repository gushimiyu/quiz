package com.youyu.pojo;

public class Question {
    private Integer id;

    private Integer belongsto;

    private String type;

    private Integer numbering;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getNumbering() {
        return numbering;
    }

    public void setNumbering(Integer numbering) {
        this.numbering = numbering;
    }
}