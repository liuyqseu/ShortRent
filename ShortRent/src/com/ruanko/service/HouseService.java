package com.ruanko.service;

import java.util.List;


import com.ruanko.dao.HouseDao;
import com.ruanko.model.House;

public class HouseService
{
	//创建房屋
	public void createHouse(House house)
	{
		HouseDao houseDao = new HouseDao();
		houseDao.save(house);
	}
	
	//查询房屋信息
	public List<House> getMyHouse(int user_id,int pageNow, int pageSize)
	{
		
		System.out.println("pageNow: "+pageNow+ "   pageSize: "+pageSize);
		
		HouseDao houseDao = new HouseDao();
		return houseDao.findByUserId(user_id,pageNow,pageSize);		
	}
	
	//获取我的房屋的总记录数
	public int getTotalRecord()
	{
		HouseDao houseDao = new HouseDao();
		return houseDao.getTotalRecord();
	}
	
	//通过房屋id查找房屋详细信息
	public House getHouseById(int id)
	{
		HouseDao houseDao = new HouseDao();
		return houseDao.findHousedById(id);		
	}
	
	//修改房屋信息
	public int updateHouse(House house)
	{		
		HouseDao houseDao = new HouseDao();
		return houseDao.update(house);		
	}

}
