package com.bbang.dbbase;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbang.common.MysqlService;

@WebServlet("/db/test01")
public class ServletDBTest01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String insertQuery = "INSERT INTO `real_estate`\r\n"
				+ "(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUE\r\n"
				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000, NULL, now(), now());";
		
		String selectQuery = "SELECT `realtorId`, `address`, `area`, `type`, `price`, `rentPrice` FROM `real_estate` ORDER BY `id` DESC LIMIT 10;";
		ResultSet resultSet = mysqlService.select(selectQuery);
	}
}
