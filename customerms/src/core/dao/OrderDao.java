package core.dao;

import java.util.List;

import core.pojo.Order;

public interface OrderDao {

	public List<Order> selectOrderList(Order order);

	public Integer selectOrderListCount(Order order);

	public int createOrder(Order order);

	public Order selectUserAndPayerId(Order order);

	public int deleteOrder(Integer id);

	public int addYear(Integer id);

	public int addMonth(Integer id);

	public Order getOrderById(Integer id);

	public int updateOrder(Order order);

	public Order countOrder(Order order);
	
}
