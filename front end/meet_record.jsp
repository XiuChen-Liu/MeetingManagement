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

    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="assets/js/jquery-3.5.1.min.js"></script>
    

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



<!-- 主持人/場地簽核-->

<div class="container" style="margin-top: 3%;margin-left: 15%;">
    <div class="row">
        <div class="col">
            <label style="font-size: 20px;font-weight:bolder; display: flex; text-align: center;">
               上傳會議紀錄
            </label>
        </div>
    </div>
</div>

<div class="w3-container">
    <div>
        <div style="margin: 3 5%;margin-left: 15%; text-align: center">
            <table class="table conf-table" style="text-align: center;table-layout:fixed">
                <thead>
                    <tr style="color: #930000;text-align:left;">
                        <td colspan="3">  
                        	請選擇檔案
                        </td>
                    </tr>
                </thead>
                <tbody>
                	<tr >
                		<td colspan="3">
		                	<form action="upload.jsp" method="post"
		                        enctype="multipart/form-data">
							<input type="file" name="file" size="50" />
							
							<input type="submit" value="上傳給以下參與人員" style="margin-top:75px;margin-bottom:75px" />
							</form>
						</td>
          			</tr>
          			<tr>
          				<td colspan="3">
          					參與人員:         					
          				</td> 
          				         				
          			</tr>
          			
          			<tr  >
          				<td>
          				     員工編號 					
          				</td>
          				<td>
          				    員工姓名  					
          				</td> 
          				<td>
          				     員工職位 					
          				</td>           				
          			</tr>
          			<%
          			String conf_name=(String)session.getAttribute("confs_Name");
    				String sql999="select * from  attendees,confs,users where confs.confs_Id=attendees.confs_Id and users.users_staffId=attendees.staffId and confs.confs_Name='"+conf_name+"'";
					ResultSet rs999 =con.createStatement().executeQuery(sql999);
					while(rs999.next())
					{%>

					<tr>
          				<td>
          				    <%out.print(rs999.getString("users.users_staffId"));%> 					
          				</td>
          				<td>
          				    <%out.print(rs999.getString("users.users_name"));%>  					
          				</td> 
          				<td>
          				     <%out.print(rs999.getString("users.users_position"));%> 					
          				</td>           				
          			</tr>

          			<% };%>
                </tbody>

            </table>
           
        </div>
    </div>
</div>




 
</body>

</html>