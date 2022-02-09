package com.bbang.dbbase;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbang.common.MysqlService;

@WebServlet("/db/test01Insert")
public class ServletDBTest1 extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		String insertQuery = "INSERT INTO `site`\r\n"
				+ "(`name`, `url`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUE\r\n"
				+ "('" + name + "', '" + url + "', now(), now());";
		
		mysqlService.disconnect();
		response.sendRedirect("/db/test01.jsp");
	}
}
