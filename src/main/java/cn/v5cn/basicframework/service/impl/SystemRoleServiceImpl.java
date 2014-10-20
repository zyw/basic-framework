package cn.v5cn.basicframework.service.impl;

import cn.v5cn.basicframework.dao.SystemRoleDao;
import cn.v5cn.basicframework.entity.SystemRole;
import cn.v5cn.basicframework.entity.SystemRoleRes;
import cn.v5cn.basicframework.service.SystemRoleResService;
import cn.v5cn.basicframework.service.SystemRoleService;
import cn.v5cn.basicframework.util.Pagination;
import cn.v5cn.basicframework.util.PropertyUtils;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZYW on 2014/10/17.
 */
@Service("systemRoleService")
public class SystemRoleServiceImpl implements SystemRoleService {

    @Autowired
    private SystemRoleDao systemRoleDao;

    @Autowired
    private SystemRoleResService systemRoleResService;

    @Override
    @Transactional
    public int addSystemRoleAndRRS(SystemRole systemRole, String resIds) {
        Long affectedCount = systemRoleDao.addSystemRole(systemRole);
        System.out.println("id::::"+affectedCount);
        if(affectedCount == null || affectedCount < 0
                || systemRole.getId() == null || systemRole.getId() < 0) return 0;

        if(resIds != null && resIds.length() > 0){
            List<SystemRoleRes> rrs = Lists.newArrayList();
            List<String> resIdList = Splitter.on(",").splitToList(resIds);
            SystemRoleRes rr = null;
            for(String resId : resIdList){
                rr = new SystemRoleRes();
                rr.setRole_id(systemRole.getId());
                rr.setRes_id(Long.valueOf(resId));
                rrs.add(rr);
            }
            Long result = systemRoleResService.addRoleResBatch(rrs);
            if(result == null || result < 1)
                return 0;
        }
        return 1;
    }

    @Override
    public Pagination<SystemRole> listRoleByName(SystemRole role, Integer currPage) {
        int roleCount = systemRoleDao.listRoleCountByName(role);
        Pagination<SystemRole> pagination = new Pagination<SystemRole>(
                currPage,roleCount,Integer.valueOf(PropertyUtils.getValue("page.rows").or("15"))
        );
        List<SystemRole> result = systemRoleDao.listRoleByName(role,pagination.getOffset(),pagination.getRows());
        pagination.setData(result);
        return pagination;
    }
}
