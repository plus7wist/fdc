<%-- <%@page import="com.fdc.dao.UsersDao"%>
<%@page import="com.fdc.po.UsersCase"%> --%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%-- <%@page import="com.fdc.dao.HouseNewsDAO"%> --%>
<%-- <%@page import="com.fdc.pojo.HouseNews"%> --%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ page import="com.fdc.pojo.Users"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// 	Users thisUsr = VisualUser.CreateVisualUser();
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%-- <base href="<%=basePath%>"> --%>
	<title>My JSP 'grzx.jsp' starting page</title>
	
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<meta content="text/html; charset=utf-8" />
	
	<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/main.css" />
	
	<link rel="stylesheet" type="text/css" href="css/buttons.css" />
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link href="css/mystyle.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	
	<link rel="stylesheet" href="css/mystyles.css" />
	<script src="js/main.js"></script>
	
	<style type="text/css">
		.tab-pane .list-group-item {
			background-color: transparent;
		}
		
		.panel-group .panel {
			background-color: transparent;
		}
	</style>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="row">
						<img src="${thisUsers.headImg }" class="img-circle center-block" style="width: 100%; height: 200px;"
							alt="Headimg" /><br />
					</div>
				</div>
				<div class="col-lg-10">
					<h3>${thisUsers.nickName }</h3>
					<table class="table table-bordered">
						<tr>
							<td>真实姓名:</td>
							<td>${thisUsers.realName }</td>
							<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
							<td><jstl:if test="${thisUsers.sex == false }">女</jstl:if>
							<jstl:if test="${thisUsers.sex == true }">男</jstl:if></td>
						</tr>
						<tr>
							<td>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:</td>
							<td>${thisUsers.age }</td>
							<td>联系邮箱: </td>
							<td>${thisUsers.email }</td>
						</tr>
						<tr>
							<td>联系电话: </td>
							<td>${thisUsers.tel }</td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<ul class="nav nav-pills nav-stacked col-lg-2 list-group"
					role="tablist">
					<li role="presentation list-group-item"><a href="#wdxx"
						aria-controls="wdxx" role="tab" data-toggle="tab">我的消息</a></li>
					<li role="presentation" class="active"><a href="#xgzl"
						aria-controls="xgzj" role="tab" data-toggle="tab">修改资料</a></li>
					<li role="presentation"><a href="#zgjl" aria-controls="zgjl"
						role="tab" data-toggle="tab">租购记录</a></li>
					<li role="presentation"><a href="#wdfb" aria-controls="wdfb"
						role="tab" data-toggle="tab">我的发布</a></li>						
					<li role="presentation"><a href="#wdsc" aria-controls="wdsc"
						role="tab" data-toggle="tab">我的收藏</a></li>
				</ul>
				<div class="tab-content col-lg-10">
					<div role="tabpanel" class="tab-pane active" id="xgzl">
						<div class="row">
							<div class="col-lg-6">
								<form action="updateUserInfo!updateUserInfo" method="post"
									enctype="multipart/form-data">
									<div class="form-group">
										<label for="exampleInputEmail1">用户名</label> <input type="text"
											class="form-control" name="users.nickName"
											placeholder="${thisUsers.nickName }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">真实姓名</label> <input
											type="text" class="form-control" name="users.realName"
											placeholder="${thisUsers.realName }">
									</div>
									<%-- 							  	<div class="form-group">
							    	<input type="text" class="form-control" placeholder="<%=thisUsr.getSexString() %>">
							  	</div> --%>
									<div class="form-group">
										<label for="exampleInputPassword1">性别</label>
										<div class="form-control">
											<input type="radio" name="users.sex" value="true" />男 <input
												type="radio" name="users.sex" vale="false" />女
										</div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">年龄</label> <input
											type="text" class="form-control" name="users.age"
											placeholder="${thisUsers.age }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">身份证号</label> <input
											type="text" class="form-control" name="users.icNumber"
											placeholder="${thisUsers.icNumber }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">联系邮箱</label> <input
											type="text" class="form-control" name="users.email"
											placeholder="${thisUsers.email }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">联系电话</label> <input
											type="text" class="form-control" name="users.tel"
											placeholder="${thisUsers.tel }">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">上传头像</label> <input type="file"
											id="exampleInputFile" name="headImg">
										<p class="help-block">图片大小不得超过200kb</p>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">旧密码&nbsp;<font
											color="red">*</font></label> <input type="password"
											class="form-control" placeholder="Old Password"
											name="oldPass">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">新密码</label> <input
											type="password" class="form-control" name="users.password"
											placeholder="New Password">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">新密码重复</label> <input
											type="password" class="form-control" name="passRe"
											placeholder="Ner Password re">
									</div>
									<button type="submit" class="btn btn-danger">保存</button>
								</form>
							</div>
						</div>
					</div>

					<div role="tabpanel" class="tab-pane" id="wdxx">
						<jstl:forEach var="e" items="${mails }">
							<div class="message">
								<h3>${e.title }</h3>
								<p>发送时间:${e.sendTime }</p>
								<p>${e.mailContent }</p>
								<p>
									<a href="lx?toId=${e.userFromId}" class="btn btn-primary btn-sm" href="jsfw" role="button">回复</a>
								</p>
							</div>
						</jstl:forEach>
						<!-- 					<p>---------------------历史消息---------------------</p> -->

					</div>

					<div role="tabpanel" class="tab-pane" id="zgjl">
						<jstl:forEach var="e" items="${houseNewsRecords }">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img src="img/剪刀.png" alt="租房缩略图"
										class="img-rounded" style="width: 64px; height: 64px;" />
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading">${e.houseTitle }</h4>
									房屋地址：${e.houseAddr } 房屋楼层：${e.houseFloor } 房租价格：${e.housePrice }
									房屋面积：${e.houseArea } 装修状况：${e.houseStatus } 联系电话：${e.tel }<br>
									记录状态：${e.recordState } 记录时间：${e.recordReqTime }
									<jstl:if test="${e.recordState == 0}">
										<a href="cancle?recordId=${e.recordId }" class="btn btn-default">取消订单</a>
									</jstl:if>
								</div>
							</div>
						</jstl:forEach>
					</div>

					<div role="tabpanel" class="tab-pane" id="wdfb">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne"> 我的房屋 </a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- myHouseNewsmyHouseNewsRecords -->
										<jstl:forEach var="e" items="${myHouseNews }">
											<div class="media">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/剪刀.png"
														alt="..." style="height: 100px; width: 100px;">
													</a>
												</div>
												<div class="media-body">
													<h4 class="media-heading">${e.houseTitle }</h4>
													<p>
														地址：${e.houseAddDetail }楼层：${e.houseFloor }价格：${e.housePrice }电话：${e.tel }<br>详情：${e.houseDetail }
													</p>

													<a href="zs?newsId=${e.id }" class="btn btn-default">查看详情</a>
													<a href="#" class="btn btn-default">修改信息</a>
													<jstl:if test="${e.houseNewsStatus == 0 }">
														<spn>审核中</spn>
													</jstl:if>
													<jstl:if test="${e.houseNewsStatus == 1 }">
														<a href="shelves?houseNewsId=${e.id }"
															class="btn btn-default">下架</a>
													</jstl:if>
													<jstl:if test="${e.houseNewsStatus == 2 }">
														<spn>已下架</spn>
													</jstl:if>
												</div>
											</div>
										</jstl:forEach>
										<p></p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo"> 我的订单 </a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<jstl:forEach var="e" items="${myHouseNewsRecords }">
											<div class="media">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/剪刀.png"
														alt="..." style="height: 100px; width: 100px;">
													</a>
												</div>
												<div class="media-body">
													<h4 class="media-heading">${e.houseTitle }</h4>
													<p>时间：${e.recordReqTime } | 状态：${e.recordState } | 客户id:${e.recordId }</p>
													<jstl:if test="${e.recordState == 0 }">
													<a href="agree?recordId=${e.recordId }" class="btn btn-default">同意交易</a>
													<a href="refuse?recordId=${e.recordId }" class="btn btn-default">放弃交易</a>
													</jstl:if>
													<jstl:if test="${e.recordState == 1 }">
													<p>房屋已出售</p>
													</jstl:if>
													<jstl:if test="${e.recordState == 2 }">
													<p>客户取消</p>
													</jstl:if>
													<jstl:if test="${e.recordState == 3 }">
													<p>已拒绝</p>
													</jstl:if>
													<jstl:if test="${e.recordState == 4 }">
													<p>房屋已出售</p>
													</jstl:if>
												</div>
											</div>
										</jstl:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div role="tabpanel" class="tab-pane" id="wdsc"><!-- 我的收藏 -->
						<jstl:forEach var="e" items="${CollectHouses }">
							<div class="row list-group-item">
								<div class="col-lg-3 house-img">
									<a href="zs?newsId=${e.id }"> <img src="${e.img1 }" alt="no picture!"
										class="img-rounded"/></a>
								</div>
								<div class="col-lg-9 house-info-table">
									<table class="table table-bordered house-info">
										<tr>
											<td style="width:10%">地址</td>
											<td>${e.houseReg }${e.houseAddDetail }</td>
										</tr>
										<tr>
											<td style="width:10%">楼层</td>
											<td>${e.houseFloor }</td>
										</tr>
										<tr>
											<td style="width:10%">价格</td>
											<td>${e.housePrice }元</td>
										</tr>
										<tr>
											<td style="width:10%">住房面积</td>
											<td>${e.houseArea }平米</td>
										</tr>
										<tr>
											<td style="width:10%">房屋描述</td>
											<td>${e.houseDetail }</td>
										</tr>
									</table>
								</div>
							</div>
						</jstl:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
