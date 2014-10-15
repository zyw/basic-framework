package cn.v5cn.basicframework.entity;

import java.io.Serializable;

/**
 * Created by ZYW on 2014/10/14.
 */
public class SystemRes implements Serializable {
    private Long id;
    private Long pid;
    private String name;
    private String permission;
    private String url;
    private Integer sortNum;        /*排序*/
    private Integer type;       //1 菜单 2 按钮
    private Integer available;  //1 可用 0 不可用
    private String des;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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
        return "SystemRes{" +
                "id=" + id +
                ", pid=" + pid +
                ", name='" + name + '\'' +
                ", permission='" + permission + '\'' +
                ", url='" + url + '\'' +
                ", sortNum=" + sortNum +
                ", type=" + type +
                ", available=" + available +
                ", des='" + des + '\'' +
                '}';
    }
}