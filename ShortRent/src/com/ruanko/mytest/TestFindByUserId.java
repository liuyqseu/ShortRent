package com.ruanko.mytest;

import java.util.List;

import org.junit.Test;

import com.ruanko.dao.HouseDao;
import com.ruanko.model.House;
import com.sun.org.apache.xerces.internal.util.EntityResolver2Wrapper;

public class TestFindByUserId
{
	@Test
	public void testFindByUserId()
	{
		int user_id = 1;	
		int pageNow = 1;
		int pageSize = 4;
		
		HouseDao houseDao = new HouseDao();
		List<House> list = houseDao.findByUserId(user_id,pageNow,pageSize);
		
		System.out.println("数据长度： "+list.size());
		System.out.println("第一条中的房屋名字为: "+list.get(0).getName());	
		
		System.out.println("最后一条中的房屋名字为: "+list.get(list.size()-1).getName());	
		
		System.out.println("最后一条中的时间为: "+list.get(list.size()-1).getCreatetime());	
	}
	
	
	@Test
	public void testGetTotalRecord()
	{
		HouseDao houseDao = new HouseDao();
		int get = houseDao.getTotalRecord();
		
		
		System.out.println("this is get: "+get);
	}
	
	@Test
	public void findHouseById()
	{
		int id = 2;
		
		
		
		
		
		
		
	}
	
	
	
	
	
	

}
