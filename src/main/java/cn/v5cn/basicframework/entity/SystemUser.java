package cn.v5cn.basicframework.entity;

import java.io.Serializable;

/**
 * Created by ZYW on 2014/10/11.
 */
public class SystemUser implements Serializable {
    private Long id;
    private String loginname;
    private String password;
    private String salt;            //加密盐
    private String name;
    private String email;
    private String mobilephone; //移动电话
    private int loginCount;         //登录次数
    private String lastLoginTime;    //最后登录时间',
    private String originalPic;      //头像',
    private int status;             //#1 不在线 2.封号状态 ',

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public int getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getOriginalPic() {
        return originalPic;
    }

    public void setOriginalPic(String originalPic) {
        this.originalPic = originalPic;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SystemUser{" +
                "id=" + id +
                ", loginname='" + loginname + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", mobilephone='" + mobilephone + '\'' +
                ", loginCount=" + loginCount +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                ", originalPic='" + originalPic + '\'' +
                ", status=" + status +
                '}';
    }
}
