package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemUser;
import org.springframework.stereotype.Repository;

/**
 * Created by ZYW on 2014/10/11.
 */
@Repository
public interface SystemUserDao {
    SystemUser findByUserName(String userName);
    int addSystemUser(SystemUser user);
}
