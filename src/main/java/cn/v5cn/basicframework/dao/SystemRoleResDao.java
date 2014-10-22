package cn.v5cn.basicframework.dao;

import cn.v5cn.basicframework.entity.SystemRoleRes;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
@Repository
public interface SystemRoleResDao {
    Long addRoleResBatch(List<SystemRoleRes> rrs);
    List<Long> findByResIdRoleId(Long roleId);
    Long deleteByRoleId(Long roleId);
}
