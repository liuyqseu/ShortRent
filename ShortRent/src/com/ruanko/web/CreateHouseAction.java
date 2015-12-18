package com.ruanko.web;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ruanko.model.House;
import com.ruanko.service.HouseService;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;
import com.sun.org.apache.xerces.internal.impl.dtd.models.DFAContentModel;
import com.sun.org.apache.xerces.internal.impl.xs.SchemaSymbols;

public class CreateHouseAction extends ActionSupport implements ModelDriven<House>
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String realpath = "E:/images/";	//上传图片文件的根目录
	
	private House house = new House();
	
	private File picture01; // 上传图片1--picture1
	private File picture02; // 上传图片2--picture2
	private File picture03; // 上传图片3--picture3
	
	private String picture01FileName;	//picture1的文件名
	private String picture02FileName;	//picture2的文件名
	private String picture03FileName;	//picture3的文件名
	
	
	public File getPicture01()
	{
		return picture01;
	}

	public void setPicture01(File picture01)
	{
		this.picture01 = picture01;
	}

	public File getPicture02()
	{
		return picture02;
	}

	public void setPicture02(File picture02)
	{
		this.picture02 = picture02;
	}

	public File getPicture03()
	{
		return picture03;
	}

	public void setPicture03(File picture03)
	{
		this.picture03 = picture03;
	}

	public String getPicture01FileName()
	{
		return picture01FileName;
	}

	public void setPicture01FileName(String picture01FileName)
	{
		this.picture01FileName = picture01FileName;
	}

	public String getPicture02FileName()
	{
		return picture02FileName;
	}

	public void setPicture02FileName(String picture02FileName)
	{
		this.picture02FileName = picture02FileName;
	}

	public String getPicture03FileName()
	{
		return picture03FileName;
	}

	public void setPicture03FileName(String picture03FileName)
	{
		this.picture03FileName = picture03FileName;
	}

	
	
	@Override
	public String execute() throws Exception
	{
		//获取文件上传后的路径
		String picture01Path = realpath + picture01FileName;
		String picture02Path = realpath + picture02FileName;
		String picture03Path = realpath + picture03FileName;
		
		//将文件上传后的路径存入House对象中，然后写入数据库
		house.setPicture1(picture01Path);		
		house.setPicture2(picture02Path);		
		house.setPicture3(picture03Path);	
		
		System.out.println("----------------start test!------------------");
		
		System.out.println("test path1 :"+ house.getPicture1());
		System.out.println("test path2 :"+ house.getPicture2());
		System.out.println("test path3 :"+ house.getPicture3());
		
		System.out.println("picture01: "+this.picture01);
		System.out.println("picture02: "+this.picture02);
		System.out.println("picture03: "+this.picture03);
		
		System.out.println("fileName1: "+picture01FileName);
		System.out.println("fileName2: "+picture02FileName);
		System.out.println("fileName3: "+picture03FileName);
		
		System.out.println("-----------------end of test!-------------------");

		CreateHouseAction createHouseAction = new CreateHouseAction();
		
		//上传图片
		createHouseAction.uploadFile(picture01FileName,this.picture01);
		createHouseAction.uploadFile(picture02FileName,this.picture02);
		createHouseAction.uploadFile(picture03FileName,this.picture03);		
		
		//将创建房屋的信息写入数据库
		HouseService houseService = new HouseService();		
		houseService.createHouse(house);
	
		return "success";
	}

	//上传图片
	public  boolean uploadFile(String uploadFileFileName,File file1) throws Exception
	{
		
		System.out.println("到达uploadFile()");	
		System.out.println("要上传的路径：" + realpath);
		
		File file = new File(realpath);
		if (!file.exists())
		{
			file.mkdirs();
		}	
		
		FileUtils.copyFile(file1, new File(file, uploadFileFileName));
		
		return true;
	}

	@Override
	public House getModel()
	{
		// TODO Auto-generated method stub
		return this.house;
	}

}
