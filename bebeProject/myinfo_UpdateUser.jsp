<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	String phone = request.getParameter("phone");
	String babyage = request.getParameter("babyage");

//------
	String url_mysql = "jdbc:mysql://localhost/bebegoods?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();

	    String A = "UPDATE user SET password = ? , nickname = ? , phone = ? , babyage = ? ";
	    String B = "WHERE email = ? ";

	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, password);
	    ps.setString(2, nickname);
	    ps.setString(3, phone);
	    ps.setString(4, babyage);
	    ps.setString(5, email);

	    ps.executeUpdate();

	    conn_mysql.close();
	}

	catch (Exception e){
	    e.printStackTrace();
	}

%>
