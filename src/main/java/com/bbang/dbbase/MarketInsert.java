package com.bbang.dbbase;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbang.common.MysqlService;

@WebServlet("/db/marketInsert")
public class MarketInsert extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		
		int sellerId = Integer.parseInt(request.getParameter("sellerId"));
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		String picture = request.getParameter("picture");
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connect();
		
		
		String insertQuery = "INSERT INTO `used_goods`\r\n"
				+ "(`sellerId`, `title`, `price`, `description`, `picture`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUE\r\n"
				+ "(" + sellerId + ", '" + title + "', " + price +", '" + description +"', '" + picture + "', now(), now());";
		
		mysqlService.update(insertQuery);
		
		mysqlService.disconnect();
		
		response.sendRedirect("/db/test02/main.jsp");
	
	}
}
