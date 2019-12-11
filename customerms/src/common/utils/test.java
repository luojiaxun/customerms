package common.utils;

import core.pojo.Order;

public class test {
	public static void main(String[] args) {
		String ct="2019-12-08";
		String et="2019-12-13";
		String year=ct.substring(0,4);
		String month=ct.substring(5,7);
		String day=ct.substring(8, 10);
		String year1=et.substring(0,4);
		String month1=et.substring(5,7);
		String day1=et.substring(8, 10);
		if(year.equals(year1))
			if(month.equals(month1))
				if((Integer.parseInt(day1)-Integer.parseInt(day))<=7)	
					System.out.println("111");
				else
				System.out.println("000");
	}
}
