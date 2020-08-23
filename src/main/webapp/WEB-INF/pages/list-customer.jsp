<%-- 
    Document   : list-customer
    Created on : Dec 8, 2019, 12:27:02 PM
    Author     : XV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />"
              rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <title>JSP Page</title>
    </head>
    <body>
	<div class="container">
	    <div class="col-md-offset-1 col-md-10">
		<h2>CRM - Customer Relationship Manager</h2>
		<hr />

		<input type="button" value="Add Customer"
		       onclick="window.location.href = 'showForm'; return false;"
		       class="btn btn-primary" />
		<br/><br/>
		<div class="panel panel-info">
		    <div class="panel-heading">
			<div class="panel-title">Customer List</div>
		    </div>
		    <div class="panel-body">
			<table class="table table-striped table-bordered">
			    <tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
                                <th>Street</th>
                                <th>City</th>
                                <th>Zip Code</th>
				<th>Action</th>
			    </tr>

			    <!-- loop over and print our customers -->
			    <c:forEach var="tempCustomer" items="${pagedListHolder}">

				<!-- construct an "update" link with customer id -->
				<c:url var="updateLink" value="/customer/updateForm">
				    <c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>

				<!-- construct an "delete" link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
				    <c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>

				<tr>
				    <td>${tempCustomer.firstName}</td>
				    <td>${tempCustomer.lastName}</td>
				    <td>${tempCustomer.email}</td>
                                    <td>${tempCustomer.address.street1}</td>
                                    <td>${tempCustomer.address.city}</td>
                                    <td>${tempCustomer.address.zipcode}</td>


				    <td>
					<!-- display the update link --> 
					<a href="${updateLink}">Update</a>| 
					<a href="${deleteLink}"	onclick="if (!(confirm('Are you sure you want to delete this customer?')))
					    return false">Delete</a>
				    </td>
				</tr>
			    </c:forEach>
			</table>
                        <%-- <c:url value="/list" var="pagedLink">
                                <c:param name="p" value="~" />
                        </c:url>
                        <tg:paging pagedListHolder="${pagedListHolder}"	pagedLink="${pagedLink}" /> --%>
		    </div>
		</div>
	    </div>
	</div>
    </body>
</html>
