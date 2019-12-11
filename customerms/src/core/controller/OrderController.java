package core.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.utils.Page;
import core.pojo.BaseDict;
import core.pojo.Order;
import core.pojo.User;
import core.service.BaseDictService;
import core.service.OrderService;

@Controller
public class OrderController {
	// 依赖注入
	@Autowired
	private OrderService orderService;
	@Autowired
	private BaseDictService baseDictService;
	//缴费类型
	@Value("${order.pay.type}")	
	private String LEVEL_TYPE;
	/**
	 *  订单列表
	 */
	@RequestMapping(value = "/order/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, 
			String payername, String orderusername, String feetype,Model model,HttpSession session) {
		// 条件查询所有客户
		Page<Order> order = orderService
				.findOrderList(page,rows,payername,orderusername,feetype);
		for(int i=0;i<order.rows.size();i++){
			Order remind=order.rows.get(i);
			String ct=remind.getCreate_time_str();
			String et=remind.getEnd_time_str();
			String year=ct.substring(0,4);
			String month=ct.substring(5,7);
			String day=ct.substring(8, 10);
			String year1=et.substring(0,4);
			String month1=et.substring(5,7);
			String day1=et.substring(8, 10);
			if(year.equals(year1))
				if(month.equals(month1))
					if((Integer.parseInt(day1)-Integer.parseInt(day))<=7)	
						order.rows.get(i).setRemindmessage("即将到期，请缴费");
					else
						order.rows.get(i).setRemindmessage("");
		}
		model.addAttribute("page", order);
		// 客户级别
		List<BaseDict> levelType = baseDictService
				.findBaseDictByTypeCode(LEVEL_TYPE);
		// 添加参数
		model.addAttribute("orderusername", orderusername);
		model.addAttribute("payername", payername);
		model.addAttribute("levelType", levelType);
		model.addAttribute("feetype", feetype);
		User user=(User) session.getAttribute("USER_SESSION");
		if(user.getUser_code().equals("manager"))
		return "order";	
		else
		return "order2";
}
	
	/**
	 * 更新订单
	 * @throws ParseException 
	 */
	@RequestMapping("/order/updateOrder().action")
	@ResponseBody
	public String updateOrder(Order order) throws ParseException {
		System.out.println(order.getCreate_time_str());
	/*	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date=sdf.parse(order.getCreate_time_str());
		order.setCreate_time(date);
		date=sdf.parse(order.getEnd_time_str());
		order.setEnd_time(date);*/
	    int rows = orderService.updateOrder(order);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * 统计客户
	 */
	@RequestMapping("/order/countOrder.action")
	@ResponseBody
	public Order countOrder(Order order)  {
	   Order fee =orderService.countOrder(order);
	   System.out.println(fee);
	   return fee;
	}
	/**
	 * 创建订单
	 * @throws Exception 
	 */
	@RequestMapping(value ="/order/createOrder.action")
	@ResponseBody
	public String orderCreate(Order order) throws Exception {	
		 /*通过客户名字查询客户id、通过经办人名字查询用户id */
		System.out.println(order);
		System.out.println(order.getFee());
		if(order.getFee()!=null){
		Order id=orderService.selectUserAndPayerId(order);
		if(id==null)
			return "FAIL";
		else
	    {
		order.setPayer_id(id.getPayer_id());
		order.setOrder_userid(id.getOrder_userid());
		int rows = orderService.createorder(order);
	    if(rows > 0){
	        return "OK";
	    }
	    else{
	        return "FAIL";
	    }
	    }
	 }
		else
			 return "FAIL";
	}
	
	/**
	 * 删除客户
	 */
	@RequestMapping("/order/delete.action")
	@ResponseBody
	public String orderDelete(Integer id) {
	    int rows = orderService.deleteOrder(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
	/**
	 * 按年续费
	 */
	@RequestMapping("/order/addYear.action")
	@ResponseBody
	public String addYear(Integer id) {
	    int rows = orderService.addYear(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
	/**
	 * 按月续费
	 */
	@RequestMapping("/order/addMonth.action")
	@ResponseBody
	public String addMonth(Integer id) {
	    int rows = orderService.addMonth(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
	/**
	 * 通过id获取订单信息
	 */
	@RequestMapping("/order/getOrderById.action")
	@ResponseBody
	public Order getCustomerById(Integer id) {
		Order order = orderService.getOrderById(id);
	    return order;
	}
}
