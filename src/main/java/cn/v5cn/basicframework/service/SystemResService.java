package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemRes;

import java.util.List;

/**
 * Created by ZYW on 2014/10/15.
 */
public interface SystemResService {
    Long addSystemRes(SystemRes systemRes);
    Long updateSystemRes(SystemRes systemRes);
    Long deleteSystemRes(Long resId);
    List<SystemRes> findAll();
    SystemRes findById(Long resId);
    int findByPidCount(Long pid);
    List<SystemRes> findByPid(Long pid);
}
