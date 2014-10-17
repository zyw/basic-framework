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
    public Long addRoleResBatch(List<SystemRoleRes> rrs) {
        return systemRoleResDao.addRoleResBatch(rrs);
    }
}
