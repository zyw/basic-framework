package cn.v5cn.basicframework.entity;

import java.io.Serializable;

/**
 * Created by ZYW on 2014/10/17.
 */
public class SystemRoleRes implements Serializable {
    private Long id;
    private Long res_id;
    private Long role_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRes_id() {
        return res_id;
    }

    public void setRes_id(Long res_id) {
        this.res_id = res_id;
    }

    public Long getRole_id() {
        return role_id;
    }

    public void setRole_id(Long role_id) {
        this.role_id = role_id;
    }

    @Override
    public String toString() {
        return "SystemRoleRes{" +
                "id=" + id +
                ", res_id=" + res_id +
                ", role_id=" + role_id +
                '}';
    }
}
