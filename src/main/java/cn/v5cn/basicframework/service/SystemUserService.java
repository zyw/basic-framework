package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.util.Pagination;

import java.util.List;
import java.util.Map;

/**
 * Created by ZYW on 2014/10/11.
 */
public interface SystemUserService {
    SystemUser findByUserName(String userName);
    List<SystemUser> findByUserIds(Long[] userIds);
    /**
     * Map中包含三个键值对
     * 1、id:角色的ID
     * 2、name:角色名称
     * 3、isSelected:用户是否包含改角色，1:选中，0:未选中。
     * */
    List<Map<String,String>> findAllRolesAndIsSelected(Long userId);
    int addSystemUserAndURS(SystemUser user,Long[] roleIds);
    Pagination<SystemUser> listUserByName(SystemUser role,Integer currPage);
    int updateLoginCountAndTime(SystemUser user);
    SystemUser findUserById(Long userId);

    int updateSystemUserAndURS(SystemUser user,Long[] roleIds);
    int batchDeleteSystemUser(Long[] userIds);
    int updatePwd(Long userId,String pwd);
}
