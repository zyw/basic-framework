package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemUserDao;
import cn.v5cn.basicframework.entity.SystemRole;
import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.entity.SystemUserRole;
import cn.v5cn.basicframework.service.SystemRoleService;
import cn.v5cn.basicframework.service.SystemUserRoleService;
import cn.v5cn.basicframework.service.SystemUserService;
import cn.v5cn.basicframework.util.Pagination;
import cn.v5cn.basicframework.util.PasswordHelper;
import cn.v5cn.basicframework.util.PropertyUtils;
import cn.v5cn.basicframework.util.TupleTwo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by ZYW on 2014/10/11.
 */
@Service("systemUserService")
public class SystemUserServiceImpl implements SystemUserService {

    @Autowired
    private SystemUserDao systemUserDao;

    @Autowired
    private SystemRoleService systemRoleService;

    @Autowired
    private SystemUserRoleService systemUserRoleService;

    @Autowired
    private PasswordHelper passwordHelper;

    @Override
    public SystemUser findByUserName(String userName) {
        return systemUserDao.findByUserName(userName);
    }

    @Override
    public List<Map<String, String>> findAllRolesAndIsSelected(Long userId) {
        List<Map<String,String>> result = Lists.newArrayList();
        if(userId == null){
            List<SystemRole> roles = systemRoleService.findAll();
            Map<String,String> obj = null;
            for(SystemRole role : roles){
                obj = Maps.newHashMap();
                obj.put("id",role.getId()+"");
                obj.put("name",role.getName());
                obj.put("isSelected","0");
                result.add(obj);
            }
        }
        return result;
    }

    @Override
    @Transactional
    public int addSystemUserAndURS(SystemUser user, Long[] roleIds) {
        //加密密码设置盐
        TupleTwo<String, String> encrypt = passwordHelper.encrypt(user.getPassword(), user.getLoginname());
        user.setSalt(encrypt.a);
        user.setPassword(encrypt.b);

        int affectedCount = systemUserDao.addSystemUser(user);
        if(affectedCount < 0 || user.getId() == null || user.getId() < 0) return 0;
        if(roleIds != null && roleIds.length > 0){
            List<SystemUserRole> urs = Lists.newArrayList();
            List<Long> resIdList = Arrays.asList(roleIds);
            SystemUserRole ur = null;
            for(Long roleId : resIdList){
                ur = new SystemUserRole();
                ur.setUser_id(user.getId());
                ur.setRole_id(roleId);
                urs.add(ur);
            }
            int result = systemUserRoleService.addUserRoleBatch(urs);
            if(result < 1)
                return 0;
        }
        return 1;
    }

    @Override
    public Pagination<SystemUser> listUserByName(SystemUser user, Integer currPage) {
        int roleCount = systemUserDao.listUserCountByName(user);
        Pagination<SystemUser> pagination = new Pagination<SystemUser>(
                currPage,roleCount,Integer.valueOf(PropertyUtils.getValue("page.rows").or("15"))
        );
        List<SystemUser> result = systemUserDao.listUserByName(user, pagination.getOffset(), pagination.getRows());
        pagination.setData(result);
        return pagination;
    }

    @Override
    public int updateLoginCountAndTime(SystemUser user) {
        return systemUserDao.updateLoginCountAndTime(user);
    }

    @Override
    public SystemUser findUserById(Long userId) {
        return systemUserDao.findUserById(userId);
    }
}
