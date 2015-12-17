package com.ruanko.service;

import com.ruanko.dao.HouseDao;
import com.ruanko.model.House;

public class HouseService
{
	public void createHouse(House house)
	{
		HouseDao houseDao = new HouseDao();
		houseDao.save(house);
		
	}

}
