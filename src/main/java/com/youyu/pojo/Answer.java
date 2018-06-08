package com.youyu.pojo;

public class Answer {
    private Integer belongsto;

    private Integer answerto;

    private Integer optionto;

    private String content;

    public Integer getBelongsto() {
        return belongsto;
    }

    public void setBelongsto(Integer belongsto) {
        this.belongsto = belongsto;
    }

    public Integer getAnswerto() {
        return answerto;
    }

    public void setAnswerto(Integer answerto) {
        this.answerto = answerto;
    }

    public Integer getOptionto() {
        return optionto;
    }

    public void setOptionto(Integer optionto) {
        this.optionto = optionto;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}