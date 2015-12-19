package com.ruanko.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.ruanko.model.House;
import com.ruanko.service.HouseService;

public class ToUpdateHouseAction extends ActionSupport
{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private House house = new House();
	
	
	@Override
	public String execute() throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();  
		int id = Integer.parseInt(request.getParameter("id"));
		
		System.out.println("this is id: "+ id);
		
		HouseService houseService = new HouseService();
		house = houseService.getHouseById(id);
		
			
		System.out.println("test name: "+ house.getName());
		System.out.println("test bill: "+ house.getBill());
		System.out.println("test house kind: "+ house.getKind());
		System.out.println("test bedtype: "+ house.getBedtype());
		System.out.println("test dayprice : "+house.getDayprice());
		System.out.println("test picture1: "+ house.getPicture1());
		
		
		return "success";
	}


	public House getHouse()
	{
		return house;
	}


	public void setHouse(House house)
	{
		this.house = house;
	}
	
	
	

}
