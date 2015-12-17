package com.ruanko.dao;

import java.sql.Date;
import java.sql.SQLException;

import com.ruanko.model.House;
import com.ruanko.util.BaseDao;


public class HouseDao
{	
	
	public void save(House house)
	{
		
		java.sql.Connection conn = BaseDao.getConnection();		
		java.sql.PreparedStatement ppstmt = null;
		
		System.out.println("到达save()");
		
		
		System.out.println("this is test of house： "+ house.getName());
		
		
		
		try
		{
			String sql="insert into t_house(user_id,name,bill,renttype,kind,area,guestnum,bednum,bedroomnum,"
					+ "roomnum,bedtype,toiletnum,roomdesc,userule,facility,address,picture1,picture2,picture3,"
					+ "checkinTime,checkoutTime,minday,maxday,refundday,payrule,dayprice,createtime,state,del)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			ppstmt =  conn.prepareStatement(sql);			
			
			ppstmt.setInt(1, 1);	//user_id有待修改
			ppstmt.setString(2, house.getName());
			ppstmt.setInt(3, house.getBill());
			ppstmt.setInt(4, house.getRenttype());
			ppstmt.setInt(5, house.getKind());
			ppstmt.setFloat(6, house.getArea());
			ppstmt.setInt(7, house.getGuestnum());
			ppstmt.setInt(8, house.getBednum());
			ppstmt.setInt(9, house.getBedroomnum());
			ppstmt.setInt(10, house.getRoomnum());
			ppstmt.setString(11, house.getBedtype());
			ppstmt.setInt(12, house.getToiletnum());
			ppstmt.setString(13, house.getRoomdesc());
			ppstmt.setString(14, house.getUserule());
			ppstmt.setString(15, house.getFacility());
			ppstmt.setString(16, house.getAddress());
			ppstmt.setString(17, house.getPicture1());
			ppstmt.setString(18, house.getPicture2());
			ppstmt.setString(19, house.getPicture3());
			ppstmt.setString(20, house.getCheckinTime());
			ppstmt.setString(21, house.getCheckoutTime());
			ppstmt.setInt(22, house.getMinday());
			ppstmt.setInt(23, house.getMaxday());
			ppstmt.setInt(24, house.getRefundday());
			ppstmt.setString(25, house.getPayrule());
			ppstmt.setFloat(26, house.getDayprice());
			ppstmt.setDate(27, new Date(System.currentTimeMillis()));
			ppstmt.setInt(28, house.getState());
			ppstmt.setInt(29, house.getDel());		
			
			int effctedRows = ppstmt.executeUpdate();
			
			System.out.println("影响了"+effctedRows+"行");
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		
	}

}
