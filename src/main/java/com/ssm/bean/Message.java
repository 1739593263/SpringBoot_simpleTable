package com.ssm.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Message {
//  100 -> success  200 -> fail
    private Integer code;

    private String message;

    private Map<String, Object> map = new HashMap<String, Object>();

    public static Message success(){
        Message m1 = new Message();
        m1.setCode(100);
        m1.setMessage("success");
        return m1;
    }

    public static Message fail(){
        Message m1 = new Message();
        m1.setCode(200);
        m1.setMessage("fail");
        return m1;
    }

    public Message add(String key, Object value){
        this.getMap().put(key,value);
        return this;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
