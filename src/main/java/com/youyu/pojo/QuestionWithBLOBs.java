package com.youyu.pojo;

public class QuestionWithBLOBs extends Question {
    private String content;

    private byte[] piture;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public byte[] getPiture() {
        return piture;
    }

    public void setPiture(byte[] piture) {
        this.piture = piture;
    }
}