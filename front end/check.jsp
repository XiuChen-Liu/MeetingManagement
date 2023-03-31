<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<%

if(request.getParameter("staffId")!= null && request.getParameter("password")!= null)
	{
	 request.setCharacterEncoding("utf-8");
	 String staffId = new String(request.getParameter("staffId").getBytes("ISO-8859-1"),"utf-8");
	 String password = request.getParameter("password");

 
	    String sql ="select * from users where users_staffId=? AND users_Password=?";
		 PreparedStatement prst = null;
		 prst = con.prepareStatement(sql);
		 prst.setString(1,request.getParameter("staffId"));
		 prst.setString(2,request.getParameter("password"));
		 ResultSet paperrs = prst.executeQuery();
		 session.removeAttribute("staffId");
	 
		 if(paperrs.next())
		 {
		  session.setAttribute("staffId",staffId);
		  out.print("<script>alert('登入成功!!')</script>");
		  response.setHeader("refresh","0;URL=index.jsp") ;
		 }
	 
		 else{
		  out.println("<script>alert('帳號密碼錯誤')");
		  out.println("window.history.back();");
		   out.println("</script>");
		 }

 
	 
	}

%>