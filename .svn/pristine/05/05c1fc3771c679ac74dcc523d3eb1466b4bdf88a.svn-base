<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.HotPlace.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
String s = request.getParameter("test");
//System.out.println(s);
String[] str = s.split(",");
System.out.println(str[0]+","+str[1]+","+str[2]+","+str[3]);
String sql ="update PC set address = ?, x=?, y=? where pc_num = ?";
Connection conn =null;
PreparedStatement pstmt =null;
	conn = DBConn.getConnection();
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(4, str[0]);
	pstmt.setString(1, str[1]);
	pstmt.setString(2, str[2]);
	pstmt.setString(3, str[3]);
	pstmt.executeUpdate();
	String str1 = pstmt.toString();
	System.out.println(str1);
	conn.close();
	pstmt.close();
%>
 --%>

<%
String s = request.getParameter("test");
System.out.println(s);
String sql ="insert into seat(seat_idx, pc_num) values(seat_seq.nextval,?)";
Connection conn =null;
PreparedStatement pstmt =null;
	conn = DBConn.getConnection();
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, s);
	pstmt.executeUpdate();
	
	String str1 = pstmt.toString();
	conn.close();
	pstmt.close();
%>