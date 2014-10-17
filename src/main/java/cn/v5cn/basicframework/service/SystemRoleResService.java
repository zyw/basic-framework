package cn.v5cn.basicframework.service;

import cn.v5cn.basicframework.entity.SystemRoleRes;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
public interface SystemRoleResService {
    Long addRoleResBatch(List<SystemRoleRes> rrs);
}
