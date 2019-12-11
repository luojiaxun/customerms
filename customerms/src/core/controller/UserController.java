package core.controller;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import core.pojo.User;
import core.service.UserService;

/**
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode,String password, Model model, 
                                                          HttpSession session) {
		// 通过账号和密码查询用户
		User user = userService.findUser(usercode, password);
		if(user != null){		
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
		if(user.getUser_state().equals("0")){
			model.addAttribute("msg", "该用户没有权限！");
			return "login";
		}
		if(user.getUser_code().equals("manager")&&user.getUser_password().equals("123"))
				return "customer";
			else
				// 跳转到主页面
				return "customer2";
		}
		else
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	//创建新用户
	@RequestMapping("/user/createUser.action")
	@ResponseBody
	public String createUser(User user){
		int i=userService.createUser(user);
		if(i>0){
			return "OK";
		}
		return "fail";
	}

	//获取所有用户
	@RequestMapping("/user/list.action")
	public String list(Model model){
		List<User> user=userService.findAllUser();
		model.addAttribute("user",user);
		return "user";
	}
	//修改权限
	@RequestMapping("/user/editState.action")
	@ResponseBody
	public String editState(Integer id,String state){
		/*if(state.equals("1"))
			state="0";
		else
			state="1";*/
		int i=userService.editState(id,state);
		if(i>0){
			return "ok";
		}
		return "fail";
	}
	
	/**
	 * 模拟其他类中跳转到客户管理页面的方法
	 */
	@RequestMapping(value = "/toCustomer.action")
	public String toCustomer() {
	    return "customer";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}


}
