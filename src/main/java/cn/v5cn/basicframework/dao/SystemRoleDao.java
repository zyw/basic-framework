package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemRole;
import org.springframework.stereotype.Repository;

/**
 * Created by ZYW on 2014/10/17.
 */
@Repository
public interface SystemRoleDao {
    Long addSystemRole(SystemRole systemRole);
}
