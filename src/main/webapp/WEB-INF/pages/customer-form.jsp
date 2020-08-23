<%-- 
    Document   : customer-form
    Created on : Dec 8, 2019, 12:16:27 PM
    Author     : XV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    </head>
    <body>
	<div class="container">
	    <div class="col-md-offset-2 col-md-7">
		<h2 class="text-center">Spring MVC + Hibernate + JSP + MySQL Example</h2>
		<div class="panel panel-info">
		    <div class="panel-heading">
			<div class="panel-title">Add Customer</div>
		    </div>
		    <div class="panel-body">
			<form:form action="saveCustomer" cssClass="form-horizontal"
				   method="post" modelAttribute="customer">

			    <!-- need to associate this data with customer id -->
			    <form:hidden path="id" />

			    <div class="form-group">
				<label for="firstname" class="col-md-3 control-label">First
				    Name</label>
				<div class="col-md-9">
				    <form:input path="firstName" cssClass="form-control" />
				</div>
			    </div>
			    <div class="form-group">
				<label for="lastname" class="col-md-3 control-label">Last
				    Name</label>
				<div class="col-md-9">
				    <form:input path="lastName" cssClass="form-control" />
				</div>
			    </div>

			    <div class="form-group">
				<label for="email" class="col-md-3 control-label">Email</label>
				<div class="col-md-9">
				    <form:input path="email" cssClass="form-control" />
				</div>
			    </div>
                                
                            <div class="form-group">
				<label for="address.street1" class="col-md-3 control-label">Street</label>
				<div class="col-md-9">
				    <form:input path="address.street1" cssClass="form-control" />
				</div>
			    </div>
                            
                            <div class="form-group">
				<label for="address.city" class="col-md-3 control-label">City</label>
				<div class="col-md-9">
				    <form:input path="address.city" cssClass="form-control" />
				</div>
			    </div>
                                
                            <div class="form-group">
				<label for="address.zipcode" class="col-md-3 control-label">Zipcode</label>
				<div class="col-md-9">
				    <form:input path="address.zipcode" cssClass="form-control" />
				</div>
			    </div>

			    <div class="form-group">
				<!-- Button -->
				<div class="col-md-offset-3 col-md-9">
				    <form:button cssClass="btn btn-primary">Submit</form:button>
				    </div>
				</div>

			</form:form>
		    </div>
		</div>
	    </div>
	</div>
    </body>
</html>
