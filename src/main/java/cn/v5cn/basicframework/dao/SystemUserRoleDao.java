package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemUserRole;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZYW on 2014/10/24.
 */
@Repository
public interface SystemUserRoleDao {
    int addUserRoleBatch(List<SystemUserRole> urs);
    List<SystemUserRole> findByUserId(Long userId);
    int deleteByUserId(Long userId);
    int batchDeleteByUserIds(Long[] userIds);
    int batchDeleteByRoleIds(Long[] roleIds);
}
