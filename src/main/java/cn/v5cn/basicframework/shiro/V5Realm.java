package cn.v5cn.basicframework.shiro;

import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.service.SystemUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by ZYW on 2014/10/11.
 */
public class V5Realm extends AuthorizingRealm {

    @Autowired
    private SystemUserService systemUserService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String userName = authenticationToken.getPrincipal().toString();
        SystemUser user = systemUserService.findByUserName(userName);
        if(user == null){
            throw new UnknownAccountException();
        }
        if(user.getAvailable() == 2){
            throw new LockedAccountException();
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getLoginname(),
                user.getPassword(),
                getName()
        );
        return authenticationInfo;
    }
}
