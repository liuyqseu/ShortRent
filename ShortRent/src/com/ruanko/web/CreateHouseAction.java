package com.ruanko.web;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ruanko.model.House;
import com.ruanko.service.HouseService;

public class CreateHouseAction extends ActionSupport implements ModelDriven<House>
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private House house = new House();
	

	
	@Override
	public String execute() throws Exception
	{
		/*HttpServletRequest request = ServletActionContext.getRequest();
		
		System.out.println("re"+request);
		
		System.out.println("daoda1");
		UploadProcess.uploadSrcImage(request);*/		
		
		HouseService houseService = new HouseService();	
		
		System.out.println("this test： "+house.getName());
		
		houseService.createHouse(house);
		
		
		
	
		return "success";
	}



/*	public House getHouse()
	{
		return house;
	}



	public void setHouse(House house)
	{
		this.house = house;
	}*/



	@Override
	public House getModel()
	{
		// TODO Auto-generated method stub
		return this.house;
	}

	/*@Override
	public void setServletRequest(HttpServletRequest request)
	{
		this.request = request;
		
	}*/
	
	
	
	

}
