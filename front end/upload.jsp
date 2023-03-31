<%@ page import = "java.sql.*, java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%--
	檔案上傳
--%>
<%
	String filename=request.getParameter("file");
	java.util.Date date = new java.util.Date();
	SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd'T'HH:mm");
	String users_staffId=(String)session.getAttribute("staffId");
	
	String conf_name=(String)session.getAttribute("confs_Name");

	String sql123="select * from confs,attendees where confs.confs_Id=attendees.confs_Id and confs.confs_Name='"+conf_name+"'";

	ResultSet rs123 =  con.createStatement().executeQuery(sql123);
	while(rs123.next()){
		String staff=rs123.getString("staffId");
		String confs_Id=rs123.getString("confs.confs_Id");

	String sql321="Insert minutes (confs_Id,staffId,senderStaffId,filename,sendtime) value ('"+confs_Id+"','"+staff+"','"+users_staffId+"','"+conf_name+"','"+ft.format(date)+"')";
	
	con.createStatement().execute(sql321);
	}

	out.print("<script>alert('成功上傳會議!')</script>"); 
	out.println("<script>window.document.location.href='index.jsp';</script>");
%>