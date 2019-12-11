<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath(); //获得项目名
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>/css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>/css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=basePath%>/css/sb-admin-2.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=basePath%>/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/boot-crm.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="wrapper">
		<!-- 导航栏部分 -->
		<nav class="navbar navbar-inverse navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>customer/list.action">客户管理系统
				</a>
			</div>
			<!-- 导航栏右侧图标部分 -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- 邮件通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>张经理</strong> <span class="pull-right text-muted">
										<em>昨天</em>
									</span>
								</div>
								<div>今天晚上开会，讨论一下下个月工作的事...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 邮件通知 end -->
				<!-- 任务通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">完成40%</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">完成20%</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>查看所有任务</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 任务通知 end -->
				<!-- 消息通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> 新回复 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> 新消息 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> 新任务 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 消息通知 end -->
				<!-- 用户信息和系统设置 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>
								用户：${USER_SESSION.user_name} </a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
						<li class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath }/logout.action"> <i
								class="fa fa-sign-out fa-fw"></i>退出登录
						</a></li>
					</ul></li>
				<!-- 用户信息和系统设置结束 -->
			</ul>
			<!-- 左侧显示列表部分 start-->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="查询内容...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
									</button>
								</span>
							</div>
						</li>
						<li><a
							href="${pageContext.request.contextPath }/customer/list.action">
								<i class="fa fa-edit fa-fw"></i> 客户管理
						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/order/list.action">
								<i class="fa fa-edit fa-fw"></i> 订单管理
						</a></li>
							<li>
				   		 <a href="${pageContext.request.contextPath}/user/list.action">
				     		 <i class="fa fa-edit fa-fw" ></i> 用户管理
				    	</a>
				</li>
					</ul>
				</div>
			</div>
			<!-- 左侧显示列表部分 end-->
		</nav>
		<!-- 客户列表查询部分  start-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">订单管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="get"
						action="${pageContext.request.contextPath }/order/list.action">
						
						<div class="form-group">
							<label for="customerName">缴费人</label> <input type="text"
								class="form-control" id="payername" value="${payername}"
								name="payername" />
						</div>
						<div class="form-group">
							<label for="customerName">经办人</label> <input type="text"
								class="form-control" id="orderusername" value="${orderusername}"
								name="orderusername" />
						</div>
						<div class="form-group">
							<label for="custLevel">缴费类型</label> <select class="form-control"
								id="feetype" name="feetype">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == feetype}"> selected</c:if>>
										${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<a href="#" class="btn btn-primary" data-toggle="modal"
				data-target="#newOrderDialog" onclick="clearOrder()">新建</a>
			<a href="#" class="btn btn-primary" data-toggle="modal"
				data-target="#newCountFeeDialog" >统计</a>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">订单信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>编号</th>
									<th>缴费人</th>
									<th>缴费日期</th>
									<th>到期日期</th>
									<th>费用</th>
									<th>缴费类型</th>
									<th>经办人</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.order_id}</td>
										<td>${row.payer_name}</td>
										<td>${row.create_time_str}</td>
										<td>${row.end_time_str}&nbsp&nbsp &nbsp &nbsp &nbsp &nbsp
											&nbsp &nbsp &nbsp <c:if test="${row.remindmessage!=null}">
												<input type="text" value="${row.remindmessage}"
													style="color: red; text-align: center;">
											</c:if>
										</td>
										<td>${row.fee}</td>
										<td>${row.fee_type}</td>
										<td>${row.order_username}</td>
										<td><a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#orderEditDialog"
											onclick="editOrder(${row.order_id})">修改</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteOrder(${row.order_id})">删除</a> <a href="#"
											class="btn btn-primary btn-xs"
											onclick="addMonth(${row.order_id})">续月</a> <a href="#"
											class="btn btn-primary btn-xs"
											onclick="addYear(${row.order_id})">续年</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itheima:page
								url="${pageContext.request.contextPath }/order/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 订单列表查询部分  end-->
	</div>
	<!-- 创建订单模态框 -->
	<div class="modal fade" id="newOrderDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建订单信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_order_form">
						<div class="form-group">
							<label for="new_payerName" class="col-sm-2 control-label">
								缴纳人名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_payerName"
									placeholder="缴纳人名称" name="payer_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_userName" class="col-sm-2 control-label">
								经办人名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_userName"
									placeholder="经办人名称" name="order_username"
									value="${sessionScope.USER_SESSION.user_name}" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_levelType"
								style="float: left; padding: 7px 15px 0 27px;">缴费类型 </label>
							<div class="col-sm-10">
								<select class="form-control" id="new_levelType" name="fee_type">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.dict_id}">
											${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_fee" class="col-sm-2 control-label">缴费费用
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_fee"
									placeholder="包月50、包年600" name="fee">
							</div>
						</div>
						<div class="form-group">
							<label for="new_createDate" class="col-sm-2 control-label">缴费日期
							</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="create_time_str"
									id="new_createDate">
							</div>
						</div>
						<div class="form-group">
							<label for="new_endDate" class="col-sm-2 control-label">到期日期
							</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="end_time_str"
									id="new_endDate">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createOrder()">创建订单</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改客户模态框 -->
	<div class="modal fade" id="orderEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改订单信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_order_form">
					<input type="hidden" id="edit_order_id" name="order_id"/>
						<div class="form-group">
							<label for="edit_PayerName" class="col-sm-2 control-label">缴纳人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_PayerName"
									placeholder="缴纳人名称" name="payer_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_UserName" class="col-sm-2 control-label">经办人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_UserName"
									placeholder="经办人名称" name="order_username" />
							</div>
						</div>
							<div class="form-group">
							<label for="edit_FeeType"
								style="float: left; padding: 7px 15px 0 27px;">缴费类型 </label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_FeeType" name="fee_type">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id==fee_type}"> selected</c:if>>
										${item.dict_item_name }</option>
								</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_createDate" class="col-sm-2 control-label">缴费日期</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="create_time_str"
									id="edit_createDate">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_endDate" class="col-sm-2 control-label">到期日期</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="end_time_str"
									id="edit_endDate">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_fee" class="col-sm-2 control-label">费用</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_fee"
									placeholder="费用" name="fee" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateOrder()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 统计模态框 -->
	<div class="modal fade" id="newCountFeeDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">统计费用</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="count_order_form">
						<div class="form-group">
							<label for="count_createDate" class="col-sm-2 control-label">缴费日期</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="create_time_str"
									id="count_createDate">
							</div>
						</div>
						<div class="form-group">
							<label for="count_endDate" class="col-sm-2 control-label">到期日期</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="end_time_str"
									id="count_endDate">
							</div>
						</div>
						<div class="form-group">
							<label for="count_fee" class="col-sm-2 control-label">费用</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="count_fee"
									placeholder="费用" name="fee" value="0"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="countOrder()">统计</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入js文件 -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">

 	//生成费用 
		$("#new_levelType").change(function(){		
			if($("#new_levelType").val()==6)
				$("#new_fee").val("600");
			else
				$("#new_fee").val("50");
		}); 	
		
	//生产截止日期	
	 	$("#new_createDate").change(function(){	
	 		var a =$("#new_createDate").val();
			var b=a.substring(0,4);
			var c=a.substring(5,7);
			var d=a.substring(8,10);
			if($("#new_levelType").val()==6){  				
				var f=Number(b)+1;			
				var e=f+"-"+c+"-"+d;
				$("#new_endDate").val(e);
		  }
			else{
				if(c!=12)
				{
					var f=Number(c)+1;
					var e=b+"-"+f+"-"+d;
					$("#new_endDate").val(e);
				}
				else{
					var f=Number(b)+1;
					var g="01";
					var e=f+"-"+g+"-"+d;
					$("#new_endDate").val(e);	
				}
			}
		});
		
	//清空新建订单窗口中的数据
	 function clearOrder() {
	    $("#new_payerName").val("");
	    $("#new_levelType").val("");
	    $("#new_fee").val("");
	    $("#createDate").val("");
	    $("#endDate").val("");
	}
	// 统计
		function countOrder() {
		$.post("<%=basePath%>order/countOrder.action",
		$("#count_order_form").serialize(),function(data){
			 $("#count_fee").val(data.fee);			
		    });
		} 
  	// 创建订单
	function createOrder() {
	$.post("<%=basePath%>order/createOrder.action",
	$("#new_order_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("客户创建成功！");
	            window.location.reload();
	        }else{
	            alert("客户创建失败！");
	            window.location.reload();
	        }
	    });
	} 
	//修改订单的模态框内容
	function editOrder(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>order/getOrderById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_PayerName").val(data.payer_name);
	            $("#edit_UserName").val(data.order_username);
	            $("#edit_FeeType").val(data.fee_type);
	            $("#edit_createDate").val(data.create_time_str1);      
	            $("#edit_endDate").val(data.end_time_str1);	
	            $("#edit_fee").val(data.fee);	
	            $("#edit_order_id").val(data.order_id);	 
	        }
	    });
	}
    // 执行修改客户操作
	function updateOrder() {
		$.post("<%=basePath%>order/updateOrder().action",$("#edit_order_form").serialize(),function(data){
			if(data =="OK"){
				alert("客户信息更新成功！");
				window.location.reload();
			}else{
				alert("客户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除订单
	function deleteOrder(id) {
	    if(confirm('确实要删除该订单吗?')) {
	$.post("<%=basePath%>order/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("订单删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除订单失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
	//续年
	function addYear(id) {
	$.post("<%=basePath%>order/addYear.action",
	{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("续费成功！");
	                window.location.reload();
	            }else{
	                alert("续费失败！");
	                window.location.reload();
	            }
	        });
	   }
	//续月
	function addMonth(id) {
	$.post("<%=basePath%>order/addMonth.action",
	{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("续费成功！");
	                window.location.reload();
	            }else{
	                alert("续费失败！");
	                window.location.reload();
	            }
	        });
	   }
			
</script>
</body>
</html>