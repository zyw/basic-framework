package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemRes;

import java.util.List;

/**
 * Created by ZYW on 2014/10/15.
 */
public interface SystemResService {
    Long addSystemRes(SystemRes systemRes);
    List<SystemRes> findAll();
    SystemRes findById(Long resId);
}
