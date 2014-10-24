package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemRole;
import cn.v5cn.basicframework.util.Pagination;
import cn.v5cn.basicframework.util.TupleTwo;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
public interface SystemRoleService {
    int addSystemRoleAndRRS(SystemRole systemRole,String resIds);
    Pagination<SystemRole> listRoleByName(SystemRole role,Integer currPage);
    SystemRole findByRoleId(Long roleId);
    int updateSystemRoleAndRRS(SystemRole systemRole,String resIds);
    TupleTwo<SystemRole,String> findSystemRoleAndResIdsByRoleId(Long roleId);
    int batchDeleteSystemRole(Long[] roleIds);
    List<SystemRole> findAll();
}
