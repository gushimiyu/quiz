package com.youyu.pojo;

import java.util.Date;

public class Questionnaire {
    private Integer id;

    private String title;

    private Integer ownner;

    private String status;

    private Date cretime;

    private Date lasttime;

    private String description;

    private int browsevolume;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getOwnner() {
        return ownner;
    }

    public void setOwnner(Integer ownner) {
        this.ownner = ownner;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getCretime() {
        return cretime;
    }

    public void setCretime(Date cretime) {
        this.cretime = cretime;
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public void setBrowsevolume(int browsevolume) {
        this.browsevolume = browsevolume;
    }

    public int getBrowsevolume() {
        return browsevolume;
    }
}