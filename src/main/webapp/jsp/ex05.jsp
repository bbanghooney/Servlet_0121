<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
</head>
<body>
	
	<%
		// 자바 문법
		Calendar todayCalendar = Calendar.getInstance();
	
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
		String dateString = formatter.format(todayCalendar.getTime());
		out.println("<br>" + dateString);
		
		// 날짜 계산
		todayCalendar.add(Calendar.DATE, -5);
		todayCalendar.add(Calendar.MONTH, 3);
		todayCalendar.add(Calendar.YEAR, 8);
		
		out.println("<br>" + formatter.format(todayCalendar.getTime()));
		
		// 날짜 비교
		
		// 앞의 것이 더 크다 1
		// 뒤의 것이 더 크다 -1
		// 같다 0
		Calendar calendar = Calendar.getInstance();
		int result = todayCalendar.compareTo(calendar);
		if(result > 0) {
			out.println("todayCalendar가 더 크다.");
		} else if(result < 0) {
			out.println("calendar가 더 크다.");
		} else {
			out.println("같다.");
		}
	%>
</body>
</html>