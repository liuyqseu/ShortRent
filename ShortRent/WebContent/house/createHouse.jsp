<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>房屋管理 - 轻松短租网</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../css/style.css" type="text/css" rel="stylesheet" />
		<link href="../css/reg.css" type="text/css" rel="stylesheet" />
		<link href="../css/house.css" type="text/css" rel="stylesheet" />
		
		<script type="text/javascript" src="../script/jquery-1.7.1.min.js"></script>
		
		<script type="text/javascript">
			
			/* 检查【必填项】是否已输入和输入是否符合要求 */
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
				
				if($("#dayprice").attr("value").trim().length==0)
				{
					alert("请输入【日租价】");	
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
					alert("请输入【面积】");	
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
				
				if($("#picture1").attr("value").trim().length+$("#picture1").attr("value").trim().length
						+$("#picture1").attr("value").trim().length==0)
				{
					alert("请最少上传一张图片");	
					$("#picture1").focus();
					return;
				}
				
				
				if($("#minday").attr("value").trim().length==0)
				{
					alert("请输入【最小天数】");
					$("#minday").focus();
					return;
				}
				
				if($("#maxday").attr("value").trim().length==0)
				{
					alert("请输入【最大天数】");	
					$("#maxday").focus();
					return;
				}
				
				$("#createHouseForm").submit()
				
			}
		
		
		
		
		
		
		
		
		
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
						
						<form  id="createHouseForm" name="createHouseForm" action="createThisHouse.action">
						
							<div class="reg-left">
							
								<div class="row_padding">									
									<span id="star_color">*</span>房屋名称：
									<input id="name" name="name" type="text" />	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;<span>发&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;票：</span>
									<input id="bill" name="bill" type="radio" value="1" />提供
									<!-- <input id="bill" name="bill" type="radio" value="2" />不提供		 -->							
								</div>
																	
								<div class="row_padding">
									&nbsp;&nbsp;出租类型：
									<input id="renttype" name="renttype" type="radio" value="1" />整租
									<!-- <input id="renttype" name="renttype" type="radio" value="2" />单间
									<input id="renttype" name="renttype" type="radio" value="3" />席位	 -->																		
								</div>								
								
								<div class="row_padding">
									&nbsp;&nbsp;房屋类型：
									<select id="kind" name="kind">
										<option style="width:100px" value=1>1</option>
										<option style="width:100px" value=2>2</option>
										<option style="width:100px" value=3>3</option>
										<option style="width:100px" value=4>4</option>
										<option style="width:100px" value=5>5</option>
									</select>	
								</div>									
								
								<div class="row_padding">										
									<span id="star_color">*</span>面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;积：
									<input id="area" name="area" type="text"/>平方米
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;可住人数：
									<select id="guestnum" name="guestnum">
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
										<option value=4>4</option>
										<option value=5>5</option>									
									</select>										
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;床&nbsp;&nbsp;位&nbsp;&nbsp;数：
									<select id="bednum" name="bednum">
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
										<option value=4>4</option>
										<option value=5>5</option>									
									</select>									
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;卧&nbsp;&nbsp;室&nbsp;&nbsp;数：
									<select id="bedroomnum" name="bedroomnum">
										<option value=1>1</option>
										<option value=2>2</option>
										<!-- <option>3</option>
										<option>4</option>
										<option>5</option>		 -->							
									</select>									
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;房&nbsp;&nbsp;间&nbsp;&nbsp;数：
									<select id="roomnum" name="roomnum">
										<option value=1>1</option>
										<option value=2>2</option>
										<!-- <option>3</option>
										<option>4</option>
										<option>5</option>	 -->								
									</select>	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;床&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：
									<select id="bedtype" name="bedtype">
										<option value=1>1</option>
										<option value=2>2</option>
									</select>	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;卫生间数：
									<select id="toiletnum" name="toiletnum">
										<option value=1>1</option>
										<option value=2>2</option>
										<!-- <option>3</option>
										<option>4</option>
										<option>5</option>		 -->							
									</select>	
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;入住时间：
									<input id="checkinTime" name="checkinTime" type="text"/><!-- 这里到时候添加插件选择时间 -->								
								</div>
								
								<div class="row_padding">
									&nbsp;&nbsp;退房时间：
									<input id="checkoutTime" name="checkoutTime" type="text"/><!-- 这里到时候添加插件选择时间 -->										
								</div>
								
								<div class="row_padding">
									<span id="star_color">*</span>最小天数：
									<input id="minday" name="minday" type="text"/><!-- 这里到时候添加插件选择时间 -->										
								</div>
								
								
								<div class="row_padding">
									<span id="star_color">*</span>最大天数：
									<input id="maxday" name="maxday" type="text"/><!-- 这里到时候添加插件选择时间 -->	
								</div>
								
								<div class="row_padding2">									
								</div>
								
								<!-- ***提交*** -->
								<div class="row_padding">
									<input name="submitCheck" type="button" value="提交审核" onClick="check()"/>										
									<input name="clear" type="reset"  value="清空" />																	
								</div>					
																
							</div><!-- end of reg-left -->		

							
							<div class="reg-right1">
								<div class="row_padding">
									<span id="star_color">*</span>全额退款日：
									<input id="refundday" name="refundday" type="text"/>								
								</div>
																	
								<div class="row_padding">
									<span id="star_color">*</span>日&nbsp;&nbsp;&nbsp;&nbsp;租&nbsp;&nbsp;&nbsp;&nbsp;价：
									<input id="dayprice" name="dayprice" type="text"/>元/天	
								</div>
								
								<div class="row_padding">								
									<span id="star_color">*</span>房屋描述：							
									<textarea id="roomdesc" name="roomdesc" rows="2" cols="15"></textarea>								
								</div>
								
								<div class="row_padding">
									<span id="star_color">*</span>使用规则：
									<textarea id="userule" name="userule" rows="2" cols="15"></textarea>
								</div>
								
								<div class="padding_row">
									<span id="star_color">*</span>设施服务：
									<textarea id="facility" name="facility" rows="2" cols="15"></textarea>		
								</div>
								
								<div class="padding_row">
									<span id="star_color">*</span>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：	
									<textarea id="address" name="address" rows="2" cols="15"></textarea>	
								</div>
								
								<div class="padding_row">
									&nbsp;&nbsp;付款规则：
									<select id="payrule" name="payrule">
										<option>严格</option>
										<option>不严格</option>
									</select>
								</div>
								
								<div class="padding_row">
									<span id="star_color">*</span>房屋图片：
									<input id="picture1" name="picture1" type="text" class="filebox"/>
								</div>
								
								<div class="padding_row">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="picture2" name="picture2" type="text" class="filebox"/>
								</div>
								
								<div class="padding_row">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="picture3" name="picture3" type="text" class="filebox"/>
								</div>
								
							</div><!-- end of right1 -->
											
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