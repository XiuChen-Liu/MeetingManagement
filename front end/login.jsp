<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>華新雲平台</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
		<script src="/js/jquery-3.4.1.min.js"></script>
    	<script src="/js/main.js"></script>
    	<script src="/js/validateForm.js"></script>
    	<script src="/js/minuteForm.js"></script>
		
	</head>
	<body>
		<nav class="navbar shadow-sm  .bg-white">
	    <div class="container" style="text-align: center;">
		        <div class="navbar-brand" style="padding-left: 10%;">
		        	<img src="assets/img/huasin.png" style="height: 30px;">
		            <a class="navbar-brand header-title"><b>華新雲平台</b> </a>
		        </div>
		        
	    </div>
		</nav>
		<div style="width:250px;margin:auto;margin-top:30px;">
		    <img src="assets/img/huasin.png" style="width:250px;">
		</div>	

			<!--alert-->
              <!--  <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top:20px;width:20%">
                  <strong>您已成功登出！</strong>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
				-->

      <div style="display: flex;justify-content:center; padding:2% 15%">          
         <div class="information" style="width:40%;margin:1% 3%">
                <div style="padding: 3%;font-size:20px;font-weight:bolder;">
                           
					<div>
		              <form method="POST" action="check.jsp" >
		                        <div style="padding: 2%;text-align:center;">
		                            <label >帳號</label>
		                            <input class="form-control" type="text" id="account" name="staffId" required>
		                        </div>
		                        <div style="margin:1% 0;padding: 2%;text-align:center;">
		                            <label >密碼</label>
		                            <input class="form-control" type="password" id="password" name="password" required>
		                        </div>
		                        <div style="padding: 5% 2%;font-color:#FFFFFF;">
		                            <input class="form-control" style="font-size:20px;font-weight:bolder;height:45px;background-color:#930000;color:#FFFFFF;" type="submit" value="登入">
		                        </div>
		               </form>
		        	</div>
        		</div>
    	 </div>
    	</div>
	</body>