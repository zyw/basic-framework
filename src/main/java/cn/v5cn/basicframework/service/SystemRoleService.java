package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemRole;
import cn.v5cn.basicframework.util.Pagination;

/**
 * Created by ZYW on 2014/10/17.
 */
public interface SystemRoleService {
    int addSystemRoleAndRRS(SystemRole systemRole,String resIds);
    Pagination<SystemRole> listRoleByName(SystemRole role,Integer currPage);
}
