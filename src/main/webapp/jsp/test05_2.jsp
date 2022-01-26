<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>변환 결과</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</head>
	<body>
		<h1>변환 결과</h1>
		<%
			int number = Integer.parseInt(request.getParameter("number"));
		%>
		<h2><%= number %>cm</h2>
		<hr>
		<%
			
			String results = "";
			String[] units = request.getParameterValues("unit");
			for(int i = 0; i < units.length; i++) {
				if(units[i].equals("inch")) {
					results += (number * 0.3937) + " in <br>"; 
				} else if(units[i].equals("yard")) {
					results += (number * 0.0109) + " yd <br>";
				} else if(units[i].equals("feet")) {
					results += (number * 0.0328) + " ft <br>";
				} else if(units[i].equals("meter")) {
					results += (number * 0.01) + " m <br>";
				}
			} 
		%>
		
		<h3><%= results %></h3>
	</body>
</html>