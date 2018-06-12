package com.youyu.pojo;

import java.util.List;

public class Questionexm {
    private Question q;
    private List<Options> o;

    public void setQ(Question q) {
        this.q = q;
    }

    public Question getQ() {
        return q;
    }

    public void setO(List<Options> o) {
        this.o = o;
    }

    public List<Options> getO() {
        return o;
    }
}

