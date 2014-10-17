package cn.v5cn.basicframework.entity;

import java.io.Serializable;

/**
 * Created by ZYW on 2014/10/17.
 */
public class SystemRole implements Serializable {
    private Long id;
    private String name;
    private Integer sortNum;
    private Long pid;
    private Integer available;  //1 可用 0 不可用
    private String des;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return "SystemRole{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sortNum=" + sortNum +
                ", pid=" + pid +
                ", available=" + available +
                ", des='" + des + '\'' +
                '}';
    }
}
