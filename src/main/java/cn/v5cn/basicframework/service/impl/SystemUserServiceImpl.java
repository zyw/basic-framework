package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemUserDao;
import cn.v5cn.basicframework.entity.SystemRole;
import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.service.SystemRoleService;
import cn.v5cn.basicframework.service.SystemUserService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
