package com.youyu.pojo;

import java.util.List;

public class templateX {
    String type;
    List<Template> templates;

    public void setTemplates(List<Template> templates) {
        this.templates = templates;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Template> getTemplates() {
        return templates;
    }

    public String getType() {
        return type;
    }
}
