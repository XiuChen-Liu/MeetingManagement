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
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/validateForm.js"></script>
    <script src="/js/minuteForm.js"></script>
    <script type="text/javascript">
        function addtr(){
		//table_name 是table的id
		var tr = document.getElementById("table123").insertRow();
		var tbody = document.getElementById("table123");
		var sIndex=tbody.getElementsByTagName('tr').length+1;
		var count = document.createElement("input");
		count.name = "count";
		count.value=sIndex;
		count.setAttribute("type", "hidden");

		tr.className="attendee";
		
		var td1 = tr.insertCell();
		
		var selectList = document.createElement("select");
		
		selectList.name = "usersselect"+sIndex;
		td1.appendChild(selectList);
		td1.appendChild(count);
		selectList.className="form-control";
		<%
		String sql2="select users.users_staffId,users.users_name from  users";
		ResultSet rs2 =con.createStatement().executeQuery(sql2);
		while(rs2.next())
		{%>
				var newOption = document.createElement('option');
				var op ='<%out.print(rs2.getString("users_staffId")+rs2.getString("users_name"));%>';
				
			    newOption.value=op;
			    newOption.text=op;
			    selectList.appendChild(newOption);


		<%}%> 
		
			  	       																	
		var td2 = tr.insertCell();
		var attendselect = document.createElement("select");
		td2.appendChild(attendselect);
		attendselect.name = "attendType"+sIndex;
		attendselect.className="form-control";
		var attendop=["出席","列席"];
			for (var i =0; i <= 1; i++) {
				var option = document.createElement("option");
				    option.value = attendop[i];
				    option.text = attendop[i];
				    attendselect.appendChild(option);
			}


		}


    </script>

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
        <div style="margin-right: -20%;">
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

<!-- 會議列表 -->
<div class="container" style="margin-top: 3%;margin-left: 15%;">
    <div class="row">
        <div class="col-md-3">
            <label style="font-size: 20px; display: flex; align-items: center;font-weight:bolder;">
                會議列表
            </label>
        </div>
        <div class="col-md-4">
            <!-- 顯示 flash 訊息 -->
        </div>
        <div class="col-md-3">
            <ul class="nav justify-content-end" >
                <li class="nav-item" style="color:#007bff;">
                    <button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;" onclick="openCity(event,'London')" id="defaultOpen">參與</button>
                </li>
                <li class="nav-item">
                    <button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;margin-left:20px;" onclick="openCity(event,'Paris')" >主持</button>
                </li>
            </ul>
        </div>
        <div class="col-md-2 text-right">
            <a class="btn " onclick="document.getElementById('id01').style.display='block'" data-toggle="modal" data-target="#NewMeetingModal" style="background-color:#B87070;color:#FFFFFF;border:0;padding:3px 10px;margin-bottom:5px;">&#10010;
                舉辦會議
            </a>
        </div>
    </div>
</div>

<!--新增會議視窗-->
<div style="left: 0;
  		top: 0;
  		width: 100%; 
  		height: 100%;		 
  		overflow: auto; 
  		display:none;
  		position: absolute; 
  		background-color: rgba(0,0,0,0.4); 
  		z-index: 100000; " id="id01">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="NewMeeting">新增會議</h5>
                <button type="button" class="close" onclick="document.getElementById('id01').style.display='none'">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                 	
        <%	
        %>    
            <div class="modal-body">
                <form action="addmeet.jsp" method="POST" name="createConfForm" onsubmit="return checkCreateForm()">
                    <div style="background:#f5f5f5;padding:1% 1%">
                        <div class="row" style="width: 100%;margin:0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="meetingname">會議名稱：</label>
                                <input type="text" class="form-control" id="meetingname" name="name" required>
                            </div>
                            <%
								sql="select users.users_name from  users where users_staffId="+users_staffId;
								 rs =con.createStatement().executeQuery(sql);
								while(rs.next())
								{   %>	
                            <div class="col-sm">
                                <label for="">建立者：</label>
                                <input type="text" class="form-control" id="createUser" disabled value="<%out.print(rs.getString("users_name"));}%>">
                            </div>
                        </div>
                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="starttime">開始時間：</label>
                                <input type="datetime-local" class="form-control" id="starttime" name="startTime"
                                    required>
                            </div>
                            <div class="col-sm">
                                <label for="endtime">結束時間：</label>
                                <input type="datetime-local" class="form-control" id="endtime" name="endTime" required>
                            </div>
                        </div>
                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="employeeList">主持人編號：</label>

                             
                            <select class="form-control" id="staffList"name="chairId"  required>

										<%
										 sql="select users.users_staffId,users.users_name from  users";
										 rs =con.createStatement().executeQuery(sql);
										while(rs.next())
										{   %>

										<option ><%out.print(rs.getString("users_staffId")+rs.getString("users_name"));%></option>
                               
                               
                                		<%}%> 
                            </select>
                            </div>
                            <div class="col-sm">

                                <label for="location">地點：</label>
                                <select class="form-control" id="location" name="roomId" required>

                                <% sql="select confrooms.cfr_Name from  confrooms";
								 rs =con.createStatement().executeQuery(sql);
								while(rs.next()){		%>

									<option ><%out.print(rs.getString("confrooms.cfr_Name"));%></option>
                               
                               
                                	<%}%>                                     
                                </select>
                            </div>
                        </div>




                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="theme">主題議程：</label>
                                <textarea class="form-control edit" id="theme" value="" name="topic" required></textarea>
                            </div>
                        </div>

                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <div class="row">
                                    <div class="col">
                                        <label>與會人員：</label>
                                    </div>
                                    <div class="col  text-right">
                                        <button type="button" class="btn btn-outline-primary btn-sm" id="add" onclick="addtr();">
                                            <span aria-hidden="true">&#10010; 新增</span>
                                        </button>
                                    </div>
                                </div>

                                <table class="table table-striped" 
                                    style="width: 100%; background:#fffffe; background-size:auto; margin-top: 1%;">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">員工編號</th>
                                            <th scope="col">參與身分</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="table123">

	                                   <tr class="attendee" >
                                            <td scope="row">
                                                <select name="usersselect2" class="form-control" required>
                                            <%
												 sql="select users.users_staffId,users.users_name from  users";
												 rs =con.createStatement().executeQuery(sql);
												while(rs.next())
												{   %>

												<option value="<%out.print(rs.getString("users_staffId")+rs.getString("users_name"));%>">
													<%out.print(rs.getString("users_staffId")+rs.getString("users_name"));%>  
												</option>
		                               
		                               
		                                		<%}%>     	
                                                	
                                                </select>  
                         
                                             </td>
                                            <td>
                                                <select class="form-control" name="attendType2" required>
                                                    <option value="出席">出席</option>
                                                    <option value="列席">列席</option>
                                                </select>
                                            </td>
                                            
                                        </tr>
                                      
                                        	


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div style="text-align:right;margin:2%">
                        <button class="btn btn-danger" type="submit">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--新增會議視窗尾-->



<div class="w3-container tabcontent" id="London">
    <div style="margin-bottom :7%;margin-left: 15%;">
        <div style="margin:3 5%; text-align: center">
            <table class="table conf-table" >
                <thead>
                    <tr style="color:#930000;font-size: 15px;">
                        <th scope="col">會議名稱</th>
                        <th scope="col">開始時間</th>
                        <th scope="col">結束時間</th>
                        <th scope="col">地點</th>   
                        <th scope="col">參與身分</th>
                        <th scope="col">與會模式</th>
                        <th scope="col">主持人審核</th>
                        <th scope="col">場地審核</th>
                    </tr>
                </thead>


                   
                 <tbody>
                    <div>

                      <%
                        con.createStatement().execute("USE dbsa");
                        String users_staffId1=(String)session.getAttribute("staffId");
                        String sql3="select * from  attendees INNER JOIN  confs ON confs.confs_Id=attendees.confs_Id where attendees.staffId="+users_staffId1;
                        ResultSet rs3 =con.createStatement().executeQuery(sql3);
                        while(rs3.next())
                        {   
                     %>
                     <tr style="color:#000000;font-size: 15px;cursor: pointer;" onclick="window.location ='editmeet.jsp?page=<% out.print(rs3.getString("confs.confs_Name"));%>'">
                        <th scope="col"><%out.print(rs3.getString("confs.confs_Name"));%></th>
                        <th scope="col"><%out.print(rs3.getString("confs.startTime"));%></th>
                        <th scope="col"><%out.print(rs3.getString("confs.endTime"));%></th>
                        <th scope="col"><%out.print(rs3.getString("confs.roomID"));%></th>
                        <th scope="col"><%out.print(rs3.getString("attendees.attendType"));%></th>
                        <th scope="col"><%out.print(rs3.getString("attendees.attendMode"));%></th>
                        <th scope="col"><%out.print(rs3.getString("confs.isChairSign"));%></th>
                        <th scope="col"><%out.print(rs3.getString("confs.isRoomSign"));%></th>
                    </tr>

                    <%}%> 
                    </div>
                    
                </tbody>

                
                
            </table>
            <!-- 判斷有無會議 
            {{#if confsData}}
            {{else}}
            {{!-- 沒有會議 --}}
            尚無會議
            {{/if}}-->
        </div>
    </div>
</div>


<div class="w3-container tabcontent" id="Paris">
    <div style="margin-bottom :7%;margin-left: 15%;">
        <div style="margin:3 5%; text-align: center">
            <table class="table conf-table" >
                <thead>
                    <tr style="color:#930000;font-size: 15px;">
                        <th scope="col">會議名稱</th>
                        <th scope="col">開始時間</th>
                        <th scope="col">結束時間</th>
                        <th scope="col">地點</th>
                        <th scope="col">主持人審核</th>
                        <th scope="col">場地審核</th>
                    </tr>
                </thead>
                <tbody>
                    <div>

                      <%
                        con.createStatement().execute("USE dbsa");
                        String users_staffId2=(String)session.getAttribute("staffId");
                        String sql4="select * from  confs  where confs.charId="+users_staffId2;
                        ResultSet rs4 =con.createStatement().executeQuery(sql4);
                        while(rs4.next())
                        {   
                     %>
                     <tr style="color:#000000;font-size: 15px;cursor: pointer;" onclick="window.location ='editmeet.jsp?page=<% out.print(rs4.getString("confs.confs_Name"));%>'">
                        <th scope="col"><%out.print(rs4.getString("confs.confs_Name"));%></th>
                        <th scope="col"><%out.print(rs4.getString("confs.startTime"));%></th>
                        <th scope="col"><%out.print(rs4.getString("confs.endTime"));%></th>
                        <th scope="col"><%out.print(rs4.getString("confs.roomID"));%></th>
                        <th scope="col"><%out.print(rs4.getString("confs.isChairSign"));%></th>
                        <th scope="col"><%out.print(rs4.getString("confs.isRoomSign"));%></th>
                    </tr>

                    <%}%> 
                    </div>
                    
                </tbody>
            </table>

        </div>
    </div>
</div>


<script>
			function openCity(evt, cityName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(" active", "");
				}
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}
			document.getElementById("defaultOpen").click();
			</script>
 
</body>

</html>