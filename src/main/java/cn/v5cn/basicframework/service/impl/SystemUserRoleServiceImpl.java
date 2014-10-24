package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemUserRoleDao;
import cn.v5cn.basicframework.entity.SystemUserRole;
import cn.v5cn.basicframework.service.SystemUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZYW on 2014/10/24.
 */
@Service("systemUserRoleService")
public class SystemUserRoleServiceImpl implements SystemUserRoleService {

    @Autowired
    private SystemUserRoleDao systemUserRoleDao;

    @Override
    public int addUserRoleBatch(List<SystemUserRole> urs) {
        return systemUserRoleDao.addUserRoleBatch(urs);
    }
}
