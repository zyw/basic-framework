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
    List<SystemUser> findByUserIds(Long[] userIds);
    int addSystemUser(SystemUser user);
    List<SystemUser> listUserByName(
            @Param("user")SystemUser user,
            @Param("offset")Integer offset,
            @Param("rows")Integer rows);
    int listUserCountByName(SystemUser user);

    int updateLoginCountAndTime(SystemUser user);

    SystemUser findUserById(Long userId);
    int updateSystemUser(SystemUser user);
    int batchDeleteSystemUser(Long[] userIds);
    int updatePwd(
            @Param("userId")Long userId,
            @Param("pwd")String pwd,
            @Param("salt")String salt);
}
