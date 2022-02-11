<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbang.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물건 올리기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "SELECT `id`, `nickname` FROM `seller` ORDER BY `id`;";
		ResultSet resultSet = mysqlService.select(query);
	%>
	
	<div class="container">
		<jsp:include page="header.jsp"/>
		<jsp:include page="nav.jsp"/>
		
		<section>
			<div class="display-4 my-4">물건 올리기</div>
			
			<form method="post" action="/db/marketInsert">
				<!-- 아이디, 제목, 가격 -->
				<div class="d-flex">
					<!-- 아이디 선택 -->
					<div>
						<select class="form-select">
							<option selected>-아이디 선택-</option>
							<% while(resultSet.next()) { %>
								<option name="sellerId"  value="<%= resultSet.getInt("seller.id") %>"><%= resultSet.getString("seller.nickname") %></option>
							<% } %>
						</select>
					</div>
					<!-- 제목 -->
					<div>
						<input type="text" class="form-control" placeholder="제목" name="title">
					</div>
					<!-- 가격 -->
					<div class="d-flex">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="가격" name="price">
							<div class="input-group-append">
								<span class="input-group-text">원</span>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 본문, 이미지 url, 저장 -->
				<textarea rows="10" cols="100" name="description"></textarea>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">이미지 url</span>
					</div>
					<input type="text" class="form-control" name="picture">
				</div>
				<button type="submit" class="btn btn-success">저장</button>
			</form>
		</section>
	</div>
		
		
		<jsp:include page="footer.jsp"/>
</body>
</html>