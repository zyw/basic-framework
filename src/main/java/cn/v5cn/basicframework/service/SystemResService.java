package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemRes;

import java.util.List;
import java.util.Set;

/**
 * Created by ZYW on 2014/10/15.
 */
public interface SystemResService {
    int addSystemRes(SystemRes systemRes);
    int updateSystemRes(SystemRes systemRes);
    int deleteSystemRes(Long resId);
    List<SystemRes> findAll();
    SystemRes findById(Long resId);
    int findByPidCount(Long pid);
    List<SystemRes> findByPid(Long pid);
    List<SystemRes> findAll(List<SystemRes> reses);
    List<SystemRes> findByResIds(List<Long> resIds);
    List<SystemRes> findByPermissionsAndType(Set<String> permissions,Integer type);
}
