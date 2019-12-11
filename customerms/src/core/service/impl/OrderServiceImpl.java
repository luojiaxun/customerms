package core.service.impl;
import org.apache.commons.lang3.StringUtils;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.utils.Page;
import core.dao.OrderDao;
import core.pojo.Order;
import core.service.OrderService;
@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	// 声明DAO属性并注入
		@Autowired
		private OrderDao orderDao;
		// 客户列表
		public Page<Order> findOrderList(Integer page, Integer rows, String payername, String orderusername,
				String feetype){
			// 创建客户对象
	         Order order = new Order();
			// 判断客户名称
			if(StringUtils.isNotBlank(payername)){
				order.setPayer_name(payername);
			}
			// 判断客户所属行业
			if(StringUtils.isNotBlank(orderusername)){
				order.setOrder_username(orderusername);
			}
			// 判断客户级别
			if(StringUtils.isNotBlank(feetype)){
				order.setFee_type(feetype);
			}
			// 当前页
			order.setStart((page-1) * rows) ;
			// 每页数
			order.setRows(rows);
			// 查询客户列表
			List<Order> Orders = orderDao.selectOrderList(order);
			// 查询客户列表总记录数
			Integer count = orderDao.selectOrderListCount(order);
			// 创建Page返回对象
			Page<Order> result = new Page<>();
			result.setPage(page);
			result.setRows(Orders);
			result.setSize(rows);
			result.setTotal(count);
			return result;
		}
		@Override
		public int createorder(Order order) {
			
			return orderDao.createOrder(order);
		}
		@Override
		public int deleteOrder(Integer id) {
	
			return orderDao.deleteOrder(id);
		}
		@Override
		public Order selectUserAndPayerId(Order order) {
			// TODO Auto-generated method stub
			return orderDao.selectUserAndPayerId(order);
		}
		@Override
		public int addYear(Integer id) {
			// TODO Auto-generated method stub
			return orderDao.addYear(id);
		}
		@Override
		public int addMonth(Integer id) {
			// TODO Auto-generated method stub
			return orderDao.addMonth(id);
		}
		@Override
		public Order getOrderById(Integer id) {
			// TODO Auto-generated method stub
			return orderDao.getOrderById(id);
		}
		@Override
		public int updateOrder(Order order) {
			// TODO Auto-generated method stub
			return orderDao.updateOrder(order);
		}
		@Override
		public Order countOrder(Order order) {
			// TODO Auto-generated method stub
			return orderDao.countOrder(order);
		}
		
		
}

