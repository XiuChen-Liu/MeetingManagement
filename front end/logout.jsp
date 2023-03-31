<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@page pageEncoding="UTF-8"%>
<%
if(session.getAttribute("users_staffId")==null)
{
	out.print("<script>alert('您已登出!')</script>");
	response.setHeader("refresh","0;URL=login.jsp") ;
}
else{
session.removeAttribute("users_staffId");
out.print("<script>alert('登出成功!')</script>");
response.setHeader("refresh","0;URL=login.jsp") ;
}
%>