<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="с"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Dashboard</title>
<link href="<c:url value = "../resources/css/my.css" />" rel="stylesheet">
<link href="<c:url value = "../resources/css/bootstrap.css" />" rel="stylesheet">
<link href="<c:url value = "../resources/css/sb-admin.css"/>" rel="stylesheet">
<link href="<c:url value = "../resources/css/plugins/morris.css"/>" rel="stylesheet">
<link href="<c:url value = "../resources/font-awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<c:url value = "../resources/css/style.css"/>">
<link rel="stylesheet" href="<c:url value = "../resources/css/jPages.css"/>">
<link rel="stylesheet" href="<c:url value = "../resources/css/jquery-te-1.4.0.css"/>">
<script src="<c:url value = "../resources/js/jquery.js"/>"></script>
<script src="<c:url value = "../resources/js/jquery-te-1.4.0.min.js"/>"></script>
<script src="<c:url value = "../resources/js/jPages.js"/>"></script>
</head>
<body>
	<button type="button" class="btn btn-lg btn-danger popover-button" data-placement="left" title="Some txt" data-content="Context">+</button>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">SB Admin</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Genn <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
						<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a></li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a></li>
						<li></li>
					</ul></li>
			</ul>
			<div data-role="scrollbox" data-scroll="vertical" class="collapse navbar-collapse navbar-ex1-collapse">
				<ul style="height: 100%; overflow: scroll; padding: 5px;" class="nav navbar-nav side-nav">
					<li class="dashboard"><a href="<%=request.getContextPath()%>"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a></li>
					<li><a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Projects <i
							class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo" class="collapse">
							<li><a href="#">Dropdown Item</a></li>
							<li><a href="#">Dropdown Item</a></li>
						</ul></li>
					<li>
						<div class="panel panel-default width200">
							<div class="panel-heading">Filters:</div>
							<div class="panel-body">
								Analyses <input type="text" size="15"> Assembly <input type="text" size="15"> Item <input type="text" size="15"> Item#
								<input type="text" size="15"> Category I <input type="text" size="15"> Category II <input type="text" size="15">
								Category III <input type="text" size="15"> EFF Day <input type="text" size="15"> Def Temple <input type="text" size="15">
							</div>
						</div>
					</li>
					<li>
						<div class="panel panel-default width200">
							<div class="panel-heading">Sort:</div>
							<div class="panel-body">
								Item <input type="text" size="15"> EFF DATE <input type="text" size="15"> ATTR1 <input type="text" size="15"> ATTR2 <input
									type="text" size="15"> ATTR3 <input type="text" size="15"> ATTR4 <input type="text" size="15"> ATTR5 <input
									type="text" size="15">
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
		<div id="page-wrapper">
			<!-- /#page-wrapper -->
			<div id="container" class="clearfix">
				<div id="content" class="defaults">
					<h2>Items Per Page</h2>
					<!-- item container -->
					<ul id="itemContainer" class="row photo">
						<li class="span2"><img src="../${dto.picture.getUrl()}" width="640" height="400" alt="image"></li>
					</ul>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							Todo list <input id="toDoButton" type="button" class="btn-outline btn-primary btn-xs" style="margin-left: 10;" value="Add todo" />
						</div>
					</div>
					<div id="addToDo" style="display: none">
						<form:form action="addtodo/${dto.picture.getId()}" method="post" commandName="addToDoForm">
							<form:input class="textbox" placeholder="new to-do list" path="name" />
							<input type="submit" style="margin-left: 10;" value="Add todo" />
						</form:form>
					</div>
					<ul>
						<c:forEach items="${dto.taskList}" var="eachtask">
							<li><a id="a${eachtask.getId()}" onclick="showHideSubtask('ul${eachtask.getId()}')">${eachtask.getName()}</a>
								<ul id="ul${eachtask.getId()}" style="display: none">
									<c:forEach items="${eachtask.getAllSubtasks()}" var="eachsubtask">
										<blockquote>${eachsubtask.getName()}</blockquote>
									</c:forEach>
									<form:form action="addsubtask/${eachtask.getId()}/${dto.picture.getId()}" method="post" commandName="addsubtask">
										<form:input class="textbox" placeholder="new subtask" path="name" />
										<input type="submit" style="margin-left: 10;" value="Add subtask" />
									</form:form>
								</ul></li>
						</c:forEach>
					</ul>
					<div class="panel panel-default">
						<div class="panel-heading">Comments</div>
						<table>
							<c:forEach items="${dto.commentList}" var="eachComment">
								<tr>
									<td><img src="../${dto.picture.getUrl()}" width="100" height="100" alt="image" class="round"></td>
									<td>
										<p style="font-weight: bold;">${eachComment.getUserName()}</p>
										<p style="font-family: Arial, Helvetica, sans-serif;">${eachComment.getCommentText()}</p> <small> <cite title="Source Title">Created:</cite>
											${eachComment.getDate()}
									</small>
									</td>
								</tr>
							</c:forEach>
						</table>
						<div class="list-inline">
							<table>
								<tr>
									<td><img src="../${dto.picture.getUrl()}" width="100" height="100" alt="image" align="middle" class="round"></td>
									<td>
										<div class="form-group" id="commentHidden">
											<input class="form-control" placeholder="Add comments">
										</div>
										<div align="left" id="commentForma" style="display: none">
											<form:form action="addcomment/${dto.picture.getId()}" method="post" commandName="commentForm">
												<table style="width: 800px">
													<tr>
														<td colspan="2" align="center"><h2>Comment</h2></td>
													</tr>
													<tr>
														<td>User Name:</td>
														<td><form:input class="form-control" placeholder="name:" path="userName" /></td>
													</tr>
													<tr height=" 10px;">
													</tr>
													<tr>
														<td style="padding: 10px 0;">Comment text:</td>
														<td><form:textarea class="form-control jqte-test" placeholder="comment:" rows="5" cols="40" path="commentText" /></td>
													</tr>
													<tr height=" 10px;">
													</tr>
													<tr>
														<td colspan="2" align="center"><input type="submit" class="btn btn-info btn-circle btn-lg" value="AddComment" /></td>
													</tr>
												</table>
											</form:form>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
		<!-- /#wrapper -->
	</div>
	<script>
		
	</script>
	<script src="<c:url value = "../resources/js/textEditor.js"/>"></script>
	<script src="<c:url value = "../resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value = "../resources/js/my.js"/>"></script>
	<!-- Morris Charts JavaScript -->
	<script src="<c:url value = "../resources/js/plugins/morris/raphael.min.js"/>"></script>
	<script src="<c:url value = "../resources/js/plugins/morris/morris.min.js"/>"></script>
	<script src="<c:url value = "../resources/js/plugins/morris/morris-data.js"/>"></script>

</body>
</html>
