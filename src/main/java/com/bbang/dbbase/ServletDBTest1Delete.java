package com.bbang.dbbase;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbang.common.MysqlService;

@WebServlet("/db/test01Delete")
public class ServletDBTest1Delete extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String deleteQuery = "DELETE FROM `site` WHERE `id` = " + id + ";"; 
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		mysqlService.update(deleteQuery);
		mysqlService.disconnect();
		
		response.sendRedirect("/db/test01.jsp");
	}
}
