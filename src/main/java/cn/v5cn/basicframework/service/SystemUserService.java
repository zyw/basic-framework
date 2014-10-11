package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemUser;

/**
 * Created by ZYW on 2014/10/11.
 */
public interface SystemUserService {
    SystemUser findByUserName(String userName);
}
