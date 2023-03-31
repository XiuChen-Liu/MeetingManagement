<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>


<%

		
		String ppp=(String)session.getAttribute("confs_Name"); 
    	String uuu=(String)session.getAttribute("staffId");   	
    	String sqlup="SELECT * FROM confs where confs_Name='"+ppp+"'";			
    	ResultSet rsup =con.createStatement().executeQuery(sqlup);
		rsup.next();					
		String id=rsup.getString("confs_Id");
		String or=rsup.getString("organizerId");


		
		if(uuu.equals(or)){
				String sqldel="DELETE FROM confs WHERE confs_Name='"+ppp+"'";
				con.createStatement().execute(sqldel);

				String sqldelat="DELETE FROM attendees WHERE confs_Id='"+id+"'";
				con.createStatement().execute(sqldelat);

				out.print("<script>alert('成功刪除會議!')</script>"); 
				out.println("<script>window.document.location.href='index.jsp';</script>");
			}
		else{
			out.print("<script>alert('您無權限刪除會議!')</script>"); 
			out.println("<script>window.history.back();</script>");
		}


%>