<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>房屋查询--我的房屋</title>
	</head>
	
	<body>	
		<table border="1" >
			<tr bgcolor="red">
				<th>测试id</th>
				<th>房屋名称</th>
				<th>出租类型</th>
				<th>房屋类型</th>
				<th>面积</th>
				<th>日租价</th>
				<th>创建时间</th>
				<th>审核状态</th>
				<th>操作</th>
			</tr>
	
			<s:iterator value="houseList">
				<tr bgcolor="green">
				
					<td><s:property value="id" /></td>
					<td><s:property value="name" /></td>
					<td><s:property value="renttype" /></td>
					<td><s:property value="kind" /></td>
					<td><s:property value="area" /></td>
					<td><s:property value="dayprice" /></td>
					<td><s:property value="createtime" /></td>
					<td><s:property value="state" /></td>
					<td><s:a href="toUpdateHouse.action?id=%{id}">修改</s:a></td>
				</tr>
			</s:iterator>
	
		</table>
	
		<s:url id="url_pre" value="showMyHouse.action">
			<s:param name="pageNow" value="pageNow-1<1 ? 1 : pageNow-1"></s:param>
		</s:url>
	
		<s:url id="url_next" value="showMyHouse.action">
			<s:param name="pageNow"	value="pageNow+1 > (totalRecord/4+1) ? (totalRecord/4+1) : pageNow+1"></s:param>
		</s:url>
	
		<s:a href="%{url_pre}">上一页</s:a>
	
		<s:iterator value="houses" status="status">
			<s:url id="url" value="showMyHouse.action">
				<s:param name="pageNow" value="pageNow" />
			</s:url>
		</s:iterator>
	
		<s:a href="%{url_next}">下一页</s:a>
	
		&nbsp;&nbsp;第<s:property value="pageNow" />	页&nbsp; 
		&nbsp;共<s:property value="totalRecord/4+1" />页&nbsp;
		&nbsp;共<s:property value="totalRecord" />条记录	
	
	</body>
</html>