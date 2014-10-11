package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemUserDao;
import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.service.SystemUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ZYW on 2014/10/11.
 */
@Service("systemUserService")
public class SystemUserServiceImpl implements SystemUserService {

    @Autowired
    private SystemUserDao systemUserDao;

    @Override
    public SystemUser findByUserName(String userName) {
        return systemUserDao.findByUserName(userName);
    }
}
