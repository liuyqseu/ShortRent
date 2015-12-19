<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>房屋管理 - 轻松短租网</title>
		
		<!-- 因为从action跳转到该页面，该页面地址为：http://localhost:8080/ShortRent/toModifyHouse.action?id=3，所以需要修改引用地址 -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/style.css" type="text/css" rel="stylesheet" />
		<link href="css/reg.css" type="text/css" rel="stylesheet" />
		<link href="css/house.css" type="text/css" rel="stylesheet" />
		<link href="css/timepicki.css" type="text/css" rel="stylesheet" />
		
		<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="script/timepicki.js"></script>
		
		<script type="text/javascript">
		
			/* 检查【必填项】是否已输入 */
			function check()
			{				
				if($("#name").attr("value").trim().length==0)
				{
					alert("请输入【房屋名称】");
					$("#name").focus();
					return;
				}
				
				if($("#refundday").attr("value").trim().length==0)
				{
					alert("请输入【全额退款日】");	
					$("#refundday").focus();
					return;
				}
				
				if($("#dayprice").attr("value").trim().length==0 )
				{
					alert("请输入【日租价】，必须为数字，可包含小数！");	
					$("#dayprice").focus();
					return;
				}
				
				if($("#roomdesc").attr("value").trim().length==0)
				{
					alert("请输入【房屋描述】");
					$("#roomdesc").focus();
					return;
				}
				
				if($("#area").attr("value").trim().length==0)
				{
					alert("请输入【面积】,必须为数字，可包含小数！");	
					$("#area").focus();
					return;
				}
				
				if($("#userule").attr("value").trim().length==0)
				{
					alert("请输入【使用规则】");
					$("#userule").focus();
					return;
				}
				
				if($("#facility").attr("value").trim().length==0)
				{
					alert("请输入【设施服务】");
					$("#facility").focus();
					return;
				}
				
				if($("#address").attr("value").trim().length==0)
				{
					alert("请输入【地址】");	
					$("#address").focus();
					return;
				}
				
				if($("#minday").attr("value").trim().length==0)
				{				
					alert("请输入【最小天数】，必须为数字！");
					$("#minday").focus();
					return;
				}
				
				if($("#maxday").attr("value").trim().length==0)
				{
					alert("请输入【最大天数】，必须为数字！");	
					$("#maxday").focus();
					return;
				}
							
				$("#updateHouseForm").submit()
				
			}
			
			//判断是否为正整数
			function checkInt(v)
			{
				 var r=/^[0-9]*$/;
				 if(!r.test(v) & v!='')
				 {
			           alert('只能输入正整数！');
			           
			           //将不符合规范的输入清除
			           if(!r.test($("#minday").attr("value")))
			           {
			        	   $("#minday").attr("value","");
			           }
			           
			           if(!r.test($("#maxday").attr("value")))
			           {
			        	   $("#maxday").attr("value","");
			           } 
			           
			           if(!r.test($("#refundday").attr("value")))
			           {
			        	   $("#refundday").attr("value","");
			           } 			           
			     }
			}
			
			//判断是否为正浮点数
			function checkFloat(v)
			{
				var reg=/^(([0-9]+\.[0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
				if(!reg.test(v) & v!='')
				{
		            alert('只能输入正数！');
		            
		          //将不符合规范的输入清除
		           if(!reg.test($("#dayprice").attr("value")))
		           {
		        	   $("#dayprice").attr("value","");
		           }
		           
		           if(!reg.test($("#area").attr("value")))
		           {
		        	   $("#area").attr("value","");
		           } 		                    
		     	}				
			}
		/* } */	
		</script>
		
	</head>

	<body>
		<div id="wrapper">
			<!-- header -->
			<div id="head">
				<h1 class="f-left">
					<a href="index.htm">短租网</a>
				</h1>
				<span class="chat"></span>
				<ul>
					<li>
						<a href="register.htm">注册</a>
					</li>
					<li>
						｜
					</li>
					<li>
						<a href="login.htm">登录</a>
					</li>
					<li>
						｜
					</li>
					<li>
						<a href="create.htm">免费创建房屋</A>
					</li>
				</ul>
			</div>

			<!-- body -->
			<div id="cols">

				<div class="index_zbg">
					<div class="reg-main">
						
						<form  id="updateHouseForm" name="updateHouseForm" action="updateHouse.action" 
							enctype="multipart/form-data" method="post">
							
							<div class="reg-left">
								
								<div class="row_padding">									
									<span id="star_color">*</span>房屋名称：
									<input id="name" name="name" type="text" value=<s:property value="house.name" />     />	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;<span>发&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;票：</span>									
									<s:radio list="#{'1':'提供','2':'不提供'}"  name = "house.bill"></s:radio>	
								</div>
																	
								<div class="row_padding">
									&nbsp;&nbsp;出租类型：
									<s:radio list="#{'1':'整租','2':'单间','3':'床位'}" name = "house.renttype"></s:radio>	
								</div>								
								
								<div class="row_padding">
									&nbsp;&nbsp;房屋类型：									
									<s:select list="#{'1':'酒店','2':'客栈','3':'旅馆'}" name="house.kind"/>								
								</div>									
								
								<div class="row_padding">										
									<span id="star_color">*</span>面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;积：
									<input id="area" name="area" type="text" onpropertychange="checkFloat(this.value)" oninput="checkFloat(this.value)"
										value=<s:property value="house.area" /> />平方米
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;可住人数：
									<s:select list="#{'1':1,'2':2,'3':3,'4':4,'5':5}" name="house.guestnum"/>																
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;床&nbsp;&nbsp;位&nbsp;&nbsp;数：
									<s:select list="#{'1':1,'2':2,'3':3,'4':4,'5':5}" name="house.bednum"/>									
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;卧&nbsp;&nbsp;室&nbsp;&nbsp;数：
									<s:select list="#{'1':1,'2':2,'3':3,'4':4,'5':5}" name="house.bedroomnum"/>	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;房&nbsp;&nbsp;间&nbsp;&nbsp;数：
									<s:select list="#{'1':1,'2':2,'3':3,'4':4,'5':5}" name="house.roomnum"/>	
								</div>
								
								<!-- 不规范字段 -->
								<div class="row_padding">
									&nbsp;&nbsp;床&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：
									<s:select list="#{'双人床':'双人床','单人床':'单人床','高低床':'高低床'}" name="house.bedtype"/>	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;卫生间数：
									<s:select list="#{'1':1,'2':2,'3':3}" name="house.toiletnum"/>	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;入住时间：		
									<s:select list="#{'12:00':'12:00','13:00':'13:00','14:00':'14:00'}" name="house.checkinTime"/>								
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;退房时间：
									<s:select list="#{'11:00':'11:00','12:00':'12:00','13:00':'13:00','14:00':'14:00'}" name="house.checkoutTime"/>								
								</div>
								
								<div class="row_padding">
									<span id="star_color">*</span>最小天数：
									<input id="minday" name="minday" type="text" onpropertychange="checkInt(this.value)" oninput="checkInt(this.value)"
										value=<s:property value="house.minday" /> />									
								</div>								
								
								<div class="row_padding">
									<span id="star_color">*</span>最大天数：
									<input id="maxday" name="maxday" type="text" onpropertychange="checkInt(this.value)" oninput="checkInt(this.value)"
										value=<s:property value="house.maxday" /> />
								</div>
								
								<div class="row_padding2">									
								</div>
								
								<!-- ***提交*** -->
								<div class="row_padding">
									<input name="submitCheck" type="button" value="提交审核" onClick="check()"/>										
									<input name="clear" type="reset"  value="清空" />																	
								</div>					
																
							</div>
							<!-- end of reg-left -->	
							
														
							<div class="reg-right1">
								<div class="row_padding">
									<span id="star_color">*</span>全额退款日：
									<input id="refundday" name="refundday" type="text" onpropertychange="checkInt(this.value)" oninput="checkInt(this.value)"
										value=<s:property value="house.refundday" /> />							
								</div>
																	
								<div class="row_padding">
									<span id="star_color">*</span>日&nbsp;&nbsp;&nbsp;&nbsp;租&nbsp;&nbsp;&nbsp;&nbsp;价：
									<input id="dayprice" name="dayprice" type="text" onpropertychange="checkFloat(this.value)" oninput="checkFloat(this.value)"
										value=<s:property value="house.dayprice" /> />元/天	
								</div>
								
								<div class="row_padding">								
									<span id="star_color">*</span>房屋描述：							
									<textarea id="roomdesc" name="roomdesc" rows="2" cols="15"><s:property value="house.roomdesc" /></textarea>								
								</div>
								
								<div class="row_padding">
									<span id="star_color">*</span>使用规则：
									<textarea id="userule" name="userule" rows="2" cols="15" ><s:property value="house.userule" /></textarea>
								</div>
								
								<div class="padding_row">
									<span id="star_color">*</span>设施服务：
									<textarea id="facility" name="facility" rows="2" cols="15"><s:property value="house.facility" /></textarea>		
								</div>
								
								<div class="padding_row">
									<span id="star_color">*</span>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：	
									<textarea id="address" name="address" rows="2" cols="15"><s:property value="house.address" /></textarea>	
								</div>
								
								<!-- 不规范字段 -->
								<div class="padding_row">
									&nbsp;&nbsp;付款规则：
									<s:select list="#{'严格':'严格','不严格':'不严格'}" name="house.payrule"></s:select>
								</div>
								
								<!-- 对于图片的修改，待后续添加 -->
								<%-- <div class="padding_row">
									<span id="star_color">*</span>房屋图片：
									<input id="picture1" name="picture01" type="file" class="filebox" value=<s:property value="house.picture1"/> />
								</div>
								
								<div class="padding_row">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="picture2" name="picture02" type="file" class="filebox" value=<s:property value="house.picture2"/>/>
								</div>
								
								<div class="padding_row">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="picture3" name="picture03" type="file" class="filebox" value=<s:property value="house.picture3"/> />
								</div> --%>
								
								<!-- 隐藏输入框，用于设定默认的状态和删除标志，以及获取用户id -->
								<input id="user_id" name="user_id" type="hidden" value="1"/>
								<input id="state" name="state" type="hidden" value="1"/>
								<input id="del" name="del" type="hidden" value="0"/>
								<input id="id" name="id" type="hidden" value=<s:property value="house.id" /> />
								
								
							</div>
							<!-- end of right1 -->
							
						</form>		
						
					</div>
					
				</div>

			</div>
			
			<!-- footer -->
			<div id="footer">
				<ul>
					<li>
						<a target="_blank" href="#">管理员登录</a>
					</li>
					<li>
						｜
					</li>
					<li>
						<a target="_blank" href="#">关于轻松短租</a>
					</li>
					<li>
						｜
					</li>
					<a target="_blank" href="#">友情链接</a>
					<li>
						｜
					</li>
					<a target="_blank" href="#">全部城市</a>
					<li>
						｜
					</li>
					<a target="_blank" href="#">精彩专题</a>
					<li>
						｜
					</li>
					<li>
						<a target="_blank" href="#">《短租网服务协议》</a>
					</li>
					<li>
						｜
					</li>
					<li>
						<a target="_blank" href="#">《隐私条款》</a>
					</li>
					<li>
						｜
					</li>
					<li>
						<a target="_blank" href="#">《房客规则》</a>
					</li>
					<li>
						｜
					</li>
					<li>
						<a target="_blank" href="#">《房东规则》</a>
					</li>
					<li>
						｜
					</li>
					<li>
						<a target="_blank" href="#">帮助</a>
					</li>
				</ul>
				
			</div>
		</div>
	</body>
</html>