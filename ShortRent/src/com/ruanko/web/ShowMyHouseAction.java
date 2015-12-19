package com.ruanko.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.ruanko.model.House;
import com.ruanko.service.HouseService;

public class ShowMyHouseAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int user_id=1;	//暂时模拟用户ID
	
	List<House> houseList;
	private int pageNow = 1 ; //初始化为1,默认从第一页开始显示  
    private int pageSize = 4 ; //每页显示4条记录      
    private int totalRecord;	//总记录数

	@Override
	public String execute() throws Exception
	{
		System.out.println("请求到达");	
		
		HouseService houseService = new HouseService();
		
		totalRecord = houseService.getTotalRecord();	
		
		houseList = houseService.getMyHouse(user_id,pageNow, pageSize);
		
		System.out.println("已返回");
		
		return "success";
	}



	public int getPageNow()
	{
		return pageNow;
	}
	public void setPageNow(int pageNow)
	{
		this.pageNow = pageNow;
	}
	
	public int getPageSize()
	{
		return pageSize;
	}
	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}
	
	
	public List<House> getHouseList()
	{
		return houseList;
	}
	public void setHouseList(List<House> houseList)
	{
		this.houseList = houseList;
	}
	
	public int getTotalRecord()
	{
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord)
	{
		this.totalRecord = totalRecord;
	}

}
