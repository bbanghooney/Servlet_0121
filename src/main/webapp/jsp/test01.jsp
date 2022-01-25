<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 스크립트 요소</title>
	</head>
	<body>
		<%-- 1. 점수들의 평균 구하기 --%>
		<%
			int[] scores = {80, 90, 100, 95, 80};
			
			int sum = 0;
			
			for(int i = 0; i < scores.length; i++){
				sum += scores[i];
			}
			
			double average = sum / (double)scores.length;
		%>
		
		평균 : <%= average %>
		
		
		<%-- 2. 채점 결과 --%>
		<%
			List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
			
			int scoreSum = 0;
			for(String score : scoreList){
				if(score.equals("O")){
					scoreSum += 10;
				}
			}			
		%>
		
		점수 : <%=scoreSum %>
		
		
		<%-- 3. 1부터 n까지의 합계를 구하는 함수 --%>
		<%!		public int nSum(int number) {
				int sumAll = 0;
				for(int i = 1; i <= number; i++) {
					sumAll += i;
				}
				return sumAll;
			}
		%>
		
		1부터 50까지의 합 : <%= nSum(50) %>
		
		
		<%-- 4. 나이 구하기 --%>
		<%
			String birthDay = "20010820";
			int year = Integer.parseInt(birthDay.substring(0, 4));		
		%>
		
		<%= birthDay %> 의 나이는 <%= 2022 - year + 1 %>살 입니다.
	</body>
</html>