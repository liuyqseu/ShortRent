package com.ruanko.web;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ruanko.model.House;
import com.ruanko.service.HouseService;

public class UpdateHouseAction extends ActionSupport implements ModelDriven<House>
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private House house = new House();
	
	
	@Override
	public String execute() throws Exception
	{		
		HouseService houseService = new HouseService();		
		int effectRows = houseService.updateHouse(house);	
		
		if(effectRows == 1)
		{
			return "success";			
		}
		else
		{
			return "error";
		}		
	}
	
	
	
	@Override
	public House getModel()
	{
		return this.house;
	}
	

}
