<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbang.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HONG당무 마켓</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
	
	
	#items {
		padding: 10px;
		width: 330px;
		height: 300px;
	}
	
</style>

</head>
<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "SELECT seller.nickname, used_goods.title, used_goods.price, used_goods.picture FROM `seller` JOIN `used_goods` ON seller.id = used_goods.sellerId ORDER BY used_goods.id DESC;";
		ResultSet resultSet = mysqlService.select(query);
	%>
	
	<div class="container">
		<jsp:include page="header.jsp"/>
		<jsp:include page="nav.jsp"/>
		
		<section class="d-flex flex-wrap">
			<% while(resultSet.next()) { %>
			<div class="border border-warning" id="items">
				<% if(resultSet.getString("used_goods.picture") == null) { %>
					<div class="display-4">이미지가 없습니다.</div>
				<% } else { %>
					<img src="<%= resultSet.getString("used_goods.picture") %>" width="140px" alt="picture">
				<% } %>
				<div class="font-weight-bold"><%= resultSet.getString("used_goods.title") %></div>
				<div class="text-secondary"><%= resultSet.getInt("used_goods.price") %>원</div>
				<div class="text-success"><%= resultSet.getString("seller.nickname") %></div>
			</div>
			<% } %>
		</section>
		
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>