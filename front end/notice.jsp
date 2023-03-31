<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>華新雲平台 </title>

    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/validateForm.js"></script>
    <script src="/js/minuteForm.js"></script>

    <style>
    	.btn:hover {
        
        border-color: currentColor;
        background-color: #613030;
        }
        button:focus {
        	outline:none;
        }
        a :hover{
        	text-decoration:none;
        }
    </style>

</head>

<body > 
<nav class="navbar shadow-sm" style=";background-color:#B87070;">
    <div class="container" style="text-align: center;margin-left: 0;">
        <div class="navbar-brand" style="margin-left: 0;" >
            <img src="assets/img/huasinsmall.png" style="height: 30px; ">
            <a class="navbar-brand header-title" style="color:#FFFFFF;"><b>華新雲平台</b> </a>
        </div>
        <div style="margin-right: -23%;">
    <%	
    	String users_staffId=(String)session.getAttribute("staffId");
    	String sql="select * from  users where users_staffId="+users_staffId;
		ResultSet rs =con.createStatement().executeQuery(sql);
		while(rs.next())
		{
    %>        
            <div style="color: #FFFFFF;width:150px;display:inline;">
            Hi, <%out.print(rs.getString("users_name"));}%> &emsp;
            </div>
            <form action="logout.jsp" accept-charset="utf-8" style="display:inline;color: #FFFFFF;">
            <button class="btn " type="submit" style="color: #FFFFFF;">登出</button>
            </form>
        </div>
    </div>

</nav>
<div class="w3-sidebar  w3-bar-block" style="width:15%;background-color:#EBD6D6; font-weight:bolder;" id="sidebar">
    <h4 class="w3-bar-item " style="color:#930000;font-weight:bolder;" >會議管理</h4>
    <a href="index.jsp" class="w3-bar-item" style="display: flex; align-items: center;text-decoration:none;">
        會議列表
    </a>
    <a href="checklist.jsp" class="w3-bar-item" style="display: flex; align-items: center;text-decoration:none;">
        待核准會議
    </a>
    <a href="notice.jsp" class="w3-bar-item" style="display: flex; align-items: center;text-decoration:none;">
        通知中心
    </a>

</div>


<!-- 通知-->

<div class="container" style="margin-top: 3%;margin-left: 15%;">
    <div class="row">
        <div class="col">
            <label style="font-size: 20px;font-weight:bolder; display: flex; align-items: center">
               通知列表
            </label>
        </div>
    </div>
</div>

<div class="w3-container">
    <div>
        <div style="margin: 0 5%;margin-left: 15%;text-align:center;">
            <table class="table conf-table">
                <thead>
                    <tr style="color: #930000;">
                        <th scope="col">主旨</th>
                        <th scope="col" class="text-center">寄件者</th>
                        <th scope="col" class="text-center">傳送時間</th>
                    </tr>
                </thead>
                <tbody>
                	<div>
                <% 
                String sqlno="select * from minutes where staffId='"+users_staffId+"'";
                ResultSet rsno =  con.createStatement().executeQuery(sqlno);
				while(rsno.next()){
                %>		
                     <tr style="color:#000000;font-size: 15px;">
                       <th   scope="col"><%=rsno.getString("filename")%>的會議記錄已上傳!</th>
                        <th scope="col"><%=rsno.getString("senderStaffId")%></th>
                        <th scope="col"><%=rsno.getString("sendtime")%></th>
                    </tr>
                    <%}%>
                    </div>
                   
                    
                </tbody>

            </table>
            
        </div>
    </div>
</div>






 
</body>

</html>