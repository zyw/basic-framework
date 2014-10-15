package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemResDao;
import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZYW on 2014/10/15.
 */
@Service("systemResService")
public class SystemResServiceImpl implements SystemResService {

    @Autowired
    private SystemResDao systemResDao;

    @Override
    public Long addSystemRes(SystemRes systemRes) {
        return systemResDao.addSystemRes(systemRes);
    }

    @Override
    public List<SystemRes> findAll() {
        return systemResDao.findAll();
    }

    @Override
    public SystemRes findById(Long resId) {
        return systemResDao.findById(resId);
    }
}
