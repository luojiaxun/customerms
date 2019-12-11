package core.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import core.dao.UserDao;
import core.pojo.User;
import core.service.UserService;

/**
 * 用户Service接口实现类
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;
	// 通过账号和密码查询用户
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return userDao.findAllUser();
	}
	@Override
	public int editState(Integer id, String state) {
		// TODO Auto-generated method stub
		return userDao.editState(id,state);
	}
	@Override
	public int createUser(User user) {
		// TODO Auto-generated method stub
		return userDao.createUser(user);
	}
}
