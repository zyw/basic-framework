package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemRes;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZYW on 2014/10/15.
 */
@Repository
public interface SystemResDao {
    int addSystemRes(SystemRes systemRes);
    int updateSystemRes(SystemRes systemRes);
    int deleteSystemRes(Long resId);
    List<SystemRes> findAll();
    SystemRes findById(Long resId);
    int findByPidCount(Long pid);
    List<SystemRes> findByPid(Long pid);
    List<SystemRes> findByResIds(List<Long> resIds);
}
