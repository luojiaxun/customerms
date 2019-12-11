package core.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import core.pojo.User;

/**
 * 用户DAO层接口
 */
public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("usercode") String usercode,
			                @Param("password") String password);
	
	//查询所有用户
	public List<User> findAllUser();
	
	//修改用户状态
	public int editState(@Param("user_id")Integer id, @Param("user_state")String state);

	public int createUser(User user);
}
