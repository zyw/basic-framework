package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemRoleResDao;
import cn.v5cn.basicframework.entity.SystemRoleRes;
import cn.v5cn.basicframework.service.SystemRoleResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
@Service("systemRoleResService")
public class SystemRoleResServiceImpl implements SystemRoleResService {

    @Autowired
    private SystemRoleResDao systemRoleResDao;

    @Override
    public int addRoleResBatch(List<SystemRoleRes> rrs) {
        return systemRoleResDao.addRoleResBatch(rrs);
    }

    @Override
    public List<Long> findByResIdRoleId(Long roleId) {
        return systemRoleResDao.findByResIdRoleId(roleId);
    }

    @Override
    public int deleteByRoleId(Long roleId) {
        return systemRoleResDao.deleteByRoleId(roleId);
    }

    @Override
    public int deleteByResId(Long resId) {
        return systemRoleResDao.deleteByResId(resId);
    }

    @Override
    public int batchDeleteByRoleIds(Long[] roleIds) {
        return systemRoleResDao.batchDeleteByRoleIds(roleIds);
    }
}
