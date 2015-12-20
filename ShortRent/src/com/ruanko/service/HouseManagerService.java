package com.ruanko.service;

import java.util.List;

import com.ruanko.dao.HouseManager;
import com.ruanko.dao.impl.HouseManagerImpl;
import com.ruanko.model.House;

public class HouseManagerService {
	HouseManager housemanager = new HouseManagerImpl();
	public List<House> listAllUncheckedHouse(int pageSize, int pageNow) {
		// TODO Auto-generated method stub
		return housemanager.listAllUncheckedHouse(pageSize, pageNow);
	}
	public List<House> listAllcheckedHouse(int pageSize, int pageNow) {
		// TODO Auto-generated method stub
		return housemanager.listAllcheckedHouse(pageSize, pageNow);
	}
}
