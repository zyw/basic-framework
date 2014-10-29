package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemResDao;
import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemResService;
import cn.v5cn.basicframework.service.SystemRoleResService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * Created by ZYW on 2014/10/15.
 */
@Service("systemResService")
public class SystemResServiceImpl implements SystemResService {

    @Autowired
    private SystemResDao systemResDao;

    @Autowired
    private SystemRoleResService systemRoleResService;

    @Override
    @Transactional
    public int addSystemRes(SystemRes systemRes) {
        return systemResDao.addSystemRes(systemRes);
    }

    @Override
    @Transactional
    public int updateSystemRes(SystemRes systemRes) {
        return systemResDao.updateSystemRes(systemRes);
    }

    @Override
    @Transactional
    public int deleteSystemRes(Long resId) {
        systemRoleResService.deleteByResId(resId);
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
    /**
     * 递归查询所以父资源和子资源
     * */
    @Override
    public List<SystemRes> findAll(List<SystemRes> reses){
        if(reses == null){
            reses = systemResDao.findByPid(0L);
        }
        for(SystemRes res : reses){
            if(this.findByPidCount(res.getId())<1) continue;
            List<SystemRes> temp = systemResDao.findByPid(res.getId());
            res.setChildren(temp);
            this.findAll(temp);
        }
        return reses;
    }

    @Override
    public List<SystemRes> findByResIds(List<Long> resIds) {
        return systemResDao.findByResIds(resIds);
    }

    @Override
    public List<SystemRes> findByPermissionsAndType(Set<String> permissions, Integer type) {
        List<SystemRes> parent = systemResDao.findByPermissionsAndTypeAndPid(permissions, type,0L);
        List<SystemRes> subNodes = null;
        List<SystemRes> subNextNodes = null;
        for(SystemRes res : parent){
            subNodes = systemResDao.findByPermissionsAndTypeAndPid(permissions, type,res.getId());
            if(subNodes != null && subNodes.size() > 0){
                res.setChildren(subNodes);
                for(SystemRes sub : subNodes){
                    subNextNodes = systemResDao.findByPermissionsAndTypeAndPid(permissions, type,sub.getId());
                    if(subNextNodes != null && subNextNodes.size() > 0)
                        sub.setChildren(subNextNodes);
                }
            }
        }

        return parent;
    }
}
