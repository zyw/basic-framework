package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemRoleRes;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
@Repository
public interface SystemRoleResDao {
    int addRoleResBatch(List<SystemRoleRes> rrs);
    List<Long> findByResIdRoleId(Long roleId);
    int deleteByRoleId(Long roleId);
    int deleteByResId(Long resId);
    int batchDeleteByRoleIds(Long[] roleIds);
    List<SystemRoleRes> findByRoleIds(List<Long> roleIds);
}
