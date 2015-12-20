package com.ruanko.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ruanko.model.House;
import com.ruanko.util.BaseDao;

public class HouseDao
{		
	java.sql.Connection conn = BaseDao.getConnection();		
	java.sql.PreparedStatement ppstmt = null;
	
	//将房屋信息写入数据库
	public void save(House house)
	{
		System.out.println("到达save()");
		
		System.out.println("this is test of house： "+ house.getName());
		
		try
		{
			String sql="insert into t_house(user_id,name,bill,renttype,kind,area,guestnum,bednum,bedroomnum,"
					+ "roomnum,bedtype,toiletnum,roomdesc,userule,facility,address,picture1,picture2,picture3,"
					+ "checkinTime,checkoutTime,minday,maxday,refundday,payrule,dayprice,state,del)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
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
			/*ppstmt.setDate(27, new Date(System.currentTimeMillis()));*/
			ppstmt.setInt(27, house.getState());
			ppstmt.setInt(28, house.getDel());		
			
			int effctedRows = ppstmt.executeUpdate();
			
			System.out.println("影响了"+effctedRows+"行");
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
	}//end of save()
	
	
	//根据用户Id查询用户的房屋
	public List<House> findByUserId(int user_id,int pageNow, int pageSize)
	{		
		List<House> houseList = new ArrayList<House>();	
		ResultSet result = null;
		
		try
		{
			if (conn != null && pageSize > 0 && pageNow > 0) {
				String sql = "select * from t_house where user_id = ? order by id limit " + (pageNow * pageSize - pageSize) + ","
						+ pageSize;
				ppstmt = conn.prepareStatement(sql);				
				ppstmt.setInt(1, user_id);				
				result = ppstmt.executeQuery();		
			}
						
			while(result.next())
			{
				House house = new House();
				
				house.setId(result.getInt("id"));
				house.setName(result.getString("name"));
				house.setBill(result.getInt("bill"));
				house.setRenttype(result.getInt("renttype"));
				house.setKind(result.getInt("kind"));
				house.setArea(result.getFloat("area"));
				house.setGuestnum(result.getInt("guestnum"));
				house.setBednum(result.getInt("bednum"));
				house.setBedroomnum(result.getInt("bedroomnum"));
				house.setRoomnum(result.getInt("roomnum"));
				house.setBedtype(result.getString("bedtype"));
				house.setToiletnum(result.getInt("toiletnum"));
				house.setRoomdesc(result.getString("roomdesc"));
				house.setUserule(result.getString("userule"));
				house.setFacility(result.getString("facility"));
				house.setAddress(result.getString("address"));
				house.setPicture1(result.getString("picture1"));
				house.setPicture2(result.getString("picture2"));
				house.setPicture3(result.getString("picture3"));
				house.setCheckinTime(result.getString("checkinTime"));
				house.setCheckoutTime(result.getString("checkoutTime"));
				house.setMinday(result.getInt("minday"));
				house.setMaxday(result.getInt("maxday"));
				house.setRefundday(result.getInt("refundday"));
				house.setPayrule(result.getString("payrule"));
				house.setDayprice(result.getFloat("dayprice"));
				house.setCreatetime(result.getDate("createtime"));
				house.setState(result.getInt("state"));
				house.setDel(result.getInt("del"));
				
				//将House对象加入列表中
				houseList.add(house);				
			}
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			
		}	
		
		return houseList;
	}//end of findByUserId()
	
	
	//获取t_house表的总记录数
	public int getTotalRecord()
	{
		ResultSet result = null;
		
		int totalRecord = 0;

		try
		{
			String sql = "select count(*)  from t_house";
			ppstmt = conn.prepareStatement(sql);
			
			result = ppstmt.executeQuery();
			
			while(result.next())
			{
				totalRecord = result.getInt(1);
			}
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		
		return totalRecord;
	}//end of getTotalRecord()
	
	
	//根据房屋id查询房屋所有信息，主要用于修改房屋信息
	public House findHousedById(int id)
	{		
		ResultSet result = null;
		House house = new House();
		
		try
		{
			
			String sql = "select * from t_house where id = ? ";
					
			ppstmt = conn.prepareStatement(sql);				
			ppstmt.setInt(1, id);				
			result = ppstmt.executeQuery();		
			
						
			while(result.next())
			{			
				house.setId(result.getInt("id"));
				house.setName(result.getString("name"));
				house.setBill(result.getInt("bill"));
				house.setRenttype(result.getInt("renttype"));
				house.setKind(result.getInt("kind"));
				house.setArea(result.getFloat("area"));
				house.setGuestnum(result.getInt("guestnum"));
				house.setBednum(result.getInt("bednum"));
				house.setBedroomnum(result.getInt("bedroomnum"));
				house.setRoomnum(result.getInt("roomnum"));
				house.setBedtype(result.getString("bedtype"));
				house.setToiletnum(result.getInt("toiletnum"));
				house.setRoomdesc(result.getString("roomdesc"));
				house.setUserule(result.getString("userule"));
				house.setFacility(result.getString("facility"));
				house.setAddress(result.getString("address"));
				house.setPicture1(result.getString("picture1"));
				house.setPicture2(result.getString("picture2"));
				house.setPicture3(result.getString("picture3"));
				house.setCheckinTime(result.getString("checkinTime"));
				house.setCheckoutTime(result.getString("checkoutTime"));
				house.setMinday(result.getInt("minday"));
				house.setMaxday(result.getInt("maxday"));
				house.setRefundday(result.getInt("refundday"));
				house.setPayrule(result.getString("payrule"));
				house.setDayprice(result.getFloat("dayprice"));
				house.setCreatetime(result.getDate("createtime"));
				house.setState(result.getInt("state"));
				house.setDel(result.getInt("del"));						
			}
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			
		}	
		
		return house;	
		
	}//end of findHousedById()
	
	//修改房屋信息，返回影响的行数
	public int update(House house)
	{
		System.out.println("到达update()");
		
		int effctedRows=0;
		
		System.out.println("this is test of house： "+ house.getName());
		
		try
		{
			String sql="update t_house set name=?,bill=?,renttype=?,kind=?,area=?,guestnum=?,bednum=?,bedroomnum=?,"
					+ "roomnum=?,bedtype=?,toiletnum=?,roomdesc=?,userule=?,facility=?,address=?,"
					+ "checkinTime=?,checkoutTime=?,minday=?,maxday=?,refundday=?,payrule=?,dayprice=? where id= ?";
			
			ppstmt =  conn.prepareStatement(sql);
			
			
			
			System.out.println("test SSS id :"+ house.getId());
			System.out.println("test SSS area :"+ house.getArea());
			
			ppstmt.setString(1, house.getName());
			ppstmt.setInt(2, house.getBill());
			ppstmt.setInt(3, house.getRenttype());
			ppstmt.setInt(4, house.getKind());
			ppstmt.setFloat(5, house.getArea());
			ppstmt.setInt(6, house.getGuestnum());
			ppstmt.setInt(7, house.getBednum());
			ppstmt.setInt(8, house.getBedroomnum());
			ppstmt.setInt(9, house.getRoomnum());
			ppstmt.setString(10, house.getBedtype());
			ppstmt.setInt(11, house.getToiletnum());
			ppstmt.setString(12, house.getRoomdesc());
			ppstmt.setString(13, house.getUserule());
			ppstmt.setString(14, house.getFacility());
			ppstmt.setString(15, house.getAddress());
			ppstmt.setString(16, house.getCheckinTime());
			ppstmt.setString(17, house.getCheckoutTime());
			ppstmt.setInt(18, house.getMinday());
			ppstmt.setInt(19, house.getMaxday());
			ppstmt.setInt(20, house.getRefundday());
			ppstmt.setString(21, house.getPayrule());
			ppstmt.setFloat(22, house.getDayprice());
			ppstmt.setInt(23, house.getId());
			
			effctedRows = ppstmt.executeUpdate();
			
			System.out.println("in: "+effctedRows);
			
			System.out.println("修改影响了"+effctedRows+"行");
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		
		
		System.out.println("out:" + effctedRows);
		
		return effctedRows;
	}
	
	
	
	
	
	
	
	
	

}
