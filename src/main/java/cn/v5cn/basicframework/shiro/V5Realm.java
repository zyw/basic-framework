package cn.v5cn.basicframework.shiro;

import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.service.SystemUserService;
import cn.v5cn.basicframework.util.PasswordHelper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.joda.time.DateTime;
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
        //更新用户的登录信息，如：登录时间和登录次数
        this.updateLoginUserInfo(user);
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getLoginname(),
                user.getPassword(),
                ByteSource.Util.bytes(PasswordHelper.getCredentialsSalt(user.getLoginname(),user.getSalt())),
                getName()
        );
        return authenticationInfo;
    }

    protected void updateLoginUserInfo(SystemUser user){
        user.setLoginCount(user.getLoginCount() + 1);
        user.setLastLoginTime(DateTime.now().toDate());
        systemUserService.updateLoginCountAndTime(user);
    }
}
