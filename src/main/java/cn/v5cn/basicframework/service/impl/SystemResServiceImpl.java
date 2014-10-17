package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemResDao;
import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemResService;
import com.google.common.collect.Lists;
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
    public Long updateSystemRes(SystemRes systemRes) {
        return systemResDao.updateSystemRes(systemRes);
    }

    @Override
    public Long deleteSystemRes(Long resId) {
        return systemResDao.deleteSystemRes(resId);
    }

    @Override
    public List<SystemRes> findAll() {
        return systemResDao.findAll();
    }

    @Override
    public SystemRes findById(Long resId) {
        return systemResDao.findById(resId);
    }

    @Override
    public int findByPidCount(Long pid) {
        return systemResDao.findByPidCount(pid);
    }

    @Override
    public List<SystemRes> findByPid(Long pid) {
        List<SystemRes> result = Lists.newArrayList();
        List<SystemRes> reses = systemResDao.findByPid(pid);
        for(SystemRes res : reses){
            int count = this.findByPidCount(res.getId());
            if(count > 0){
                res.setIsParent(true);
            }
            result.add(res);
        }
        return result;
    }
}
