package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemUserRole;

import java.util.List;

/**
 * Created by ZYW on 2014/10/24.
 */
public interface SystemUserRoleService {
    int addUserRoleBatch(List<SystemUserRole> urs);
    List<SystemUserRole> findByUserId(Long userId);
    int deleteByUserId(Long userId);
    int batchDeleteByUserIds(Long[] userIds);
    int batchDeleteByRoleIds(Long[] roleIds);
}
