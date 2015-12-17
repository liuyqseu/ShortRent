package com.ruanko.web;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;

public class ToCreateHouseAction extends ActionSupport
{
	
	/**
	 * 这里主要是判断用户是否登录：
	 * -->已登录：跳转至createHouse.jsp
	 * -->未登录，跳转至登录页面
	 */
	private static final long serialVersionUID = 1L;

	public String redirect()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		HttpServletResponse response=ServletActionContext.getResponse();
		
		//session.setAttribute("userName", "test");
		
        
        String userName = (String) session.getAttribute("userName");
        
		if (userName.length()>0)
		{
			try
			{
				response.sendRedirect("house/createHouse.jsp");
			} catch (IOException e)
			{
				e.printStackTrace();
			} 
			
		}
		else
		{
			
		}
		
		return "success";
		
	}
	
	
	

}
