package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
@Repository
public interface SystemRoleDao {
    int addSystemRole(SystemRole systemRole);
    List<SystemRole> listRoleByName(
                                    @Param("role")SystemRole role,
                                    @Param("offset")Integer offset,
                                    @Param("rows")Integer rows);
    int listRoleCountByName(SystemRole role);
    SystemRole findByRoleId(Long roleId);
    int updateSystemRole(SystemRole systemRole);
    int batchDeleteSystemRole(Long[] roleIds);
    List<SystemRole> findAll();
    List<SystemRole> findByRoleIds(List<Long> roleIds);
}
