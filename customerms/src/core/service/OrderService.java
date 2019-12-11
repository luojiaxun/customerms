package core.service;

import common.utils.Page;
import core.pojo.Order;

public interface OrderService {

	public Page<Order> findOrderList(Integer page, Integer rows, String payername, String orderusername,String feetype);

	public int createorder(Order order) ;

	public int deleteOrder(Integer id);
	
	public Order selectUserAndPayerId(Order order);

	public int addYear(Integer id);

	public int addMonth(Integer id);

	public Order getOrderById(Integer id);

	public int updateOrder(Order order);

	public Order countOrder(Order order);



}
