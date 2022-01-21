package com.bbang.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test07")
public class Test07 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		int price = Integer.parseInt(request.getParameter("price"));
		
		out.println("<html><head><title>주문출력</title></head><body>");
		if(address.contains("서울시") && card != "신한카드") {
			out.println("<h3>" + address + " 배달 준비중</h3><hr>");
			out.println("결제금액 : " + price);
		} else if(card == "신한카드") {			
			out.println("<h3>결제 불가 카드입니다.</h3>");
		} else {
			out.println("<h3>배달 불가 지역입니다.</h3>");
		}
		
		out.println("</body></html>");
	}
}
