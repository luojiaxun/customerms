package core.service;

import java.util.List;

import core.pojo.User;

/**
 * 用户Service层接口
 */
public interface UserService {
	// 通过账号和密码查询用户
	public User findUser(String usercode,String password);
	public List<User> findAllUser();
	public int editState(Integer id, String state);
	public int createUser(User user);
}
