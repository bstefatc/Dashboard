<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="с"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags'%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Dashboard</title>
<link href="<c:url value = "resources/css/bootstrap.css" />" rel="stylesheet">
<link href="<c:url value = "resources/css/my.css" />" rel="stylesheet">
<link href="<c:url value = "resources/css/sb-admin.css"/>" rel="stylesheet">
<link href="<c:url value = "resources/css/plugins/morris.css"/>" rel="stylesheet">
<link href="<c:url value = "resources/font-awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<c:url value = "resources/css/style.css"/>">
<link rel="stylesheet" href="<c:url value = "resources/css/jPages.css"/>">
<script src="<c:url value = "resources/js/jquery.js"/>"></script>
<script src="<c:url value = "resources/js/jPages.js"/>"></script>
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
			<ul class="nav navbar-center top-nav">
				<li><a href="#" id="small">small</a></li>
				<li><a href="#" id="medium">medium</a></li>
				<li><a href="#" id="large">large</a></li>
				<sec:authorize ifAnyGranted='anonim'>
					<li>
						<form method="POST" class="navbar-form pull-right" action="<c:url value='/j_spring_security_check'/>">
							<input type="text" name="j_username" class="span2" placeholder="login"> <input type="password" name="j_password" class="span2"
								placeholder="password">

							<button type="submit" class="btn">Ok</button>
						</form>
					</li>
				</sec:authorize>
				<sec:authorize ifAnyGranted='user'>
				
						<li><a href="#"><b><sec:authentication property="principal.username" /></b></a></li>
						<li><a href=<c:url value='/j_spring_security_logout'/>>Logout</a></li>
	

				</sec:authorize>
			</ul>
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
				<ul class="nav navbar-nav side-nav myScroll">
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
						<c:forEach items="${pictureList}" var="URLA">
							<spring:url value="/items/${URLA.getId()}" var="addHref" />
							<li class="span2"><a href="${addHref}"><img src="${URLA.getUrl()}" width="320" height="200" alt="image"></a>
						</c:forEach>
					</ul>

				</div>
				<div class="holder"></div>
			</div>

			<%-- 				<sec:authorize ifAnyGranted='anonim'> --%>
			<!-- 					<li><a href="#myModal" data-toggle="modal">Registration</a></li> -->
			<%-- 				</sec:authorize> --%>

			<div class="" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h3 id="myModalLabel">Registration</h3>
				</div>
				<c:url var="post_url" value="/createuser" />
				<form:form id="form" method="POST" action="${post_url}" commandName="user">
					<div class="modal-body">
						<table class="table table-bordered table-hover text-center">
							<tr>
								<td>Name :</td>
								<td><form:input path="username" id="name" />
									<div id="nameanswer"></div></td>
							</tr>
							<tr>
								<td>Password :</td>
								<td><form:password path="password" /></td>
							</tr>

						</table>
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
						<input class="btn btn-primary" type="submit" value="submit">
					</div>
				</form:form>

				${msg}
			</div>


		</div>
		<!-- /#wrapper -->

	</div>




	<script src="<c:url value = "resources/js/my.js"/>"></script>
	<script src="<c:url value = "resources/js/bootstrap.min.js"/>"></script>

	<!-- Morris Charts JavaScript -->
	<script src="<c:url value = "resources/js/plugins/morris/raphael.min.js"/>"></script>
	<script src="<c:url value = "resources/js/plugins/morris/morris.min.js"/>"></script>
	<script src="<c:url value = "resources/js/plugins/morris/morris-data.js"/>"></script>

</body>
</html>
