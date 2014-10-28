package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemRoleRes;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
public interface SystemRoleResService {
    int addRoleResBatch(List<SystemRoleRes> rrs);
    List<Long> findByResIdRoleId(Long roleId);
    int deleteByRoleId(Long roleId);
    int deleteByResId(Long resId);
    int batchDeleteByRoleIds(Long[] roleIds);
    List<SystemRoleRes> findByRoleIds(List<Long> roleIds);
}
