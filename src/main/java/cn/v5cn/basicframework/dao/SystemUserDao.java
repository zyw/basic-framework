package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZYW on 2014/10/11.
 */
@Repository
public interface SystemUserDao {
    SystemUser findByUserName(String userName);
    int addSystemUser(SystemUser user);
    List<SystemUser> listUserByName(
            @Param("user")SystemUser user,
            @Param("offset")Integer offset,
            @Param("rows")Integer rows);
    int listUserCountByName(SystemUser user);

    int updateLoginCountAndTime(SystemUser user);

    SystemUser findUserById(Long userId);
}
