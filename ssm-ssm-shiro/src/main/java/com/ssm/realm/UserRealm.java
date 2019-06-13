package com.ssm.realm;

import java.util.List;
import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;

import com.ssm.pojo.TAdmin;
import com.ssm.pojo.TAdminRoleKey;
import com.ssm.pojo.TMenu;
import com.ssm.pojo.TMenuRoleKey;
import com.ssm.service.AdminService;
import com.ssm.service.MenuService;
import com.ssm.service.RoleService;

public class UserRealm extends AuthorizingRealm{
	@Resource
	private AdminService adminServiceImpl;
	@Resource
	private RoleService roleServiceImpl;
	@Resource
	private MenuService menuServiceImpl;

	//返回当前自定义Realm的名称
	@Override
	public String getName() {
		return "userRealm";
	}	
	
	//用户身份验证，如果验证失败，则返回null
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
		System.out.println("====用户认证=====");
		//获取用户的身份凭证信息
		String username = (String) token.getPrincipal();
		TAdmin admin = adminServiceImpl.selByName(username);
		if(admin==null) {
			//用户不存在
			return null;
		}else if(admin.getState()!=1) {
			//代表此时管理员为禁用状态
			return null;
		}
		//此处代表使用了盐值进行加密
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(admin, admin.getPassword(),ByteSource.Util.bytes(admin.getSalt()), getName());
		//此处代表使用了盐值进行加密
		if(info!=null) {
			//将成功的用户信息存储在session中
			SecurityUtils.getSubject().getSession().setAttribute("loginAdmin", admin);
		}
		return info;
	}
	
	
	//用户授权信息
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("======用户授权===============");
		//得到权限字符串对象
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		//如果用户认证的时候放的是对象，取的就是对象,也就是获取身份信息，该身份信息是由认证的时候进行设置的
		//获取用户的凭证信息
		TAdmin admin = (TAdmin)principals.fromRealm(getName()).iterator().next();
		List<TAdminRoleKey> roIdList = roleServiceImpl.selByAid(admin.getId());
		if(roIdList!=null&&roIdList.size()>0) {
			//存在用户角色
			for (TAdminRoleKey tAdminRoleKey : roIdList) {
				List<TMenuRoleKey> menuIdList = menuServiceImpl.selByRid(tAdminRoleKey.getRoleId());
				if(menuIdList!=null&&menuIdList.size()>0) {
					//获取menu的id,获取每个menu对象，取出权限
					for (TMenuRoleKey tMenuRoleKey : menuIdList) {
						TMenu tMenu = menuServiceImpl.selByMId(tMenuRoleKey.getMenuId());
						info.addStringPermission(tMenu.getPermission());
					}
				}
			}
			
		}
		//将成功的用户信息存储在session中
		//SecurityUtils.getSubject().getSession().setAttribute("loginAdmin", admin);
		return info;
	}
	
	/**
	 * 清除缓存数据
	 */
	@Override
	protected void clearCache(PrincipalCollection principals) {
		//从运行环境中获取主体信息
		Subject subject = SecurityUtils.getSubject();
		super.clearCache(subject.getPrincipals());
	}

}
