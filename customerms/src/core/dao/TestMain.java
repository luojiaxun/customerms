package core.dao;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {
	@Test
	public void testdao(){
		
		ApplicationContext ac= new ClassPathXmlApplicationContext("applicationContext.xml");
		OrderDao od = ac.getBean(OrderDao.class);
		od.countOrder(null);
	}
}
