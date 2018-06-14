package com.youyu.pojo;

import java.util.List;

public class AnswernaireforT {
    private  Question file;
    private List<AnswerforT> bibli;

    public List<AnswerforT> getBibli() {
        return bibli;
    }

    public Question getFile() {
        return file;
    }

    public void setBibli(List<AnswerforT> bibli) {
        this.bibli = bibli;
    }

    public void setFile(Question file) {
        this.file = file;
    }
}
