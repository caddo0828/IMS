package com.ssm.pojo;

import java.io.Serializable;
import java.util.Date;

public class TProducts implements Serializable{
    private Integer id;

    private String name;

    private Integer bid;

    private Integer sid;

    private String units;

    private Integer count;

    private Integer wvalue;

    private Integer state;

    private Date createtime;

    private String annt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units == null ? null : units.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getWvalue() {
        return wvalue;
    }

    public void setWvalue(Integer wvalue) {
        this.wvalue = wvalue;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getAnnt() {
        return annt;
    }

    public void setAnnt(String annt) {
        this.annt = annt == null ? null : annt.trim();
    }
}