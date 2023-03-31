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
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
    	.btn:hover {
        
        border-color: currentColor;
        background-color: #613030;
        }
        button:focus {
        	outline:none;
        }
        :focus {
        	outline:none;
        }
        a :hover{
        	text-decoration:none;
        }
        .swal-footer {
    	text-align: center;
    	}

    </style>

    <script type="text/javascript">
    	
    function spacesign(){

    	<%
    	String ccc_name = request.getParameter("page");
        session.setAttribute("confs_Name",request.getParameter("page"));
    	String users_staffIdkkk=(String)session.getAttribute("staffId");
    	String managerid="";
    	String sql2="SELECT confs.roomID,confrooms.cfr_managerid FROM confs,confrooms where confs.roomID=confrooms.cfr_Name and confs.confs_Name='"+ccc_name+"'";			
    	ResultSet rs2 =con.createStatement().executeQuery(sql2);
		rs2.next();			
		managerid=rs2.getString("cfr_managerid");
		%>

		if(<%=managerid%>==<%=users_staffIdkkk%>){
		    		
		    swal({
				title: "是否核准會議?",
		    	icon: "warning",
				buttons:{
					confirm: {
					text: "核准",
					visible: true,
					value: "A"
					 },
					danger: {
					text: "駁回",
					visible: true,
					value: "B",
					dangerMode: false
					}
					}
				}).then((value) => {

					if(value=="A") {
						var ff=document.getElementById('space');					   
						ff.value="核准";								        	      
						swal("已核准!","請按下方保存鍵以儲存會議資料!!", "success");
						
						}
					else{ 	
						var ff=document.getElementById('space');					   
						ff.value="駁回";
						swal("已駁回!","請按下方保存鍵以儲存會議資料!!","error");	
										      		     
		        		}
		    		})
			 }
			else{
				swal("無法核准!", "您不是該場地負責人!", "error", {button: "確認"});
				 }
			

		}


 		function chairsign(){

    	<%
    	
        String ccc = request.getParameter("page");
    	String kkk=(String)session.getAttribute("staffId");   	
    	String sql25="SELECT confs.charId FROM confs where confs.confs_Name='"+ccc+"'";			
    	ResultSet rs25 =con.createStatement().executeQuery(sql25);
		rs25.next();			
		String chairid=rs25.getString("charId");
		%>

		if(<%=chairid%>==<%=kkk%>){
		    		
		    swal({
				title: "是否核准會議?",
		    	icon: "warning",
				buttons:{
					confirm: {
					text: "核准",
					visible: true,
					value: "A"
					 },
					danger: {
					text: "駁回",
					visible: true,
					value: "B",
					dangerMode: false
					}
					}
				}).then((value) => {

					if(value=="A") {
						var ff=document.getElementById('chair');					   
						ff.value="核准";								        	      
						swal("已核准!","請按下方保存鍵以儲存會議資料!!", "success");
						
						}
					else{ 	
						var ff=document.getElementById('chair');					   
						ff.value="駁回";
						swal("已駁回!","請按下方保存鍵以儲存會議資料!!","error");	
										      		     
		        		}
		    		})
			 }
			else{
				swal("無法核准!", "您不是該場地負責人!", "error", {button: "確認"});
				 }
			

		}
		 	
	function cost(){
		<%
		request.setCharacterEncoding("utf-8");
		String cccost = request.getParameter("page");	
    	String sqlcost="SELECT confrooms.cfr_price FROM confrooms,confs where confs.roomID=confrooms.cfr_Name and confs.confs_Name='"+cccost+"'";		
    	ResultSet rscost =con.createStatement().executeQuery(sqlcost);
		rscost.next();			
		String ss=rscost.getString("confrooms.cfr_price"); /*會議成本*/
		%>
		var ss=<%=ss%>;
		var people=0;
		<%
		String sqlpeople="SELECT attendees.staffId FROM attendees,confs where confs.confs_Id=attendees.confs_Id and confs.confs_Name='"+cccost+"'";		
    	ResultSet rspeople =con.createStatement().executeQuery(sqlpeople);
		while(rspeople.next()){%>

			 people+=1;
		<%}%>
		var pp=people*500;
		var cost=people*500+ss;
		var ff=document.getElementById('cost');					   
		ff.value=cost;
		swal("會議成本估計", "本會議人數為"+people+"人，每人500元人事費，總人事費為"+pp+"元。場地費為"+ss+"元。會議總費用為"+cost+"元。", "info", {button: "確認	"});
		
		
		
	}

	function attendtype(){

		swal({
		    icon: "warning",
		    title: "請選擇參與會議的模式!",
		    buttons:{
		      A: {
		        text: "在場",
		        value: "在場"
		      },
		      B: {
		        text: "線上",
		        value: "線上"
		      },
		      C: {
		        text: "離線",
		        value: "離線"
		      }
		    }
		  }).then((value) => {
		  	if(value==null){
		  		swal("您還沒選擇模式!!","","error");

		  	}
		  	else{
		  	var ff=document.getElementById('attendtype');					   
			ff.value=value;	
		    swal("您選擇參與此會議的模式是"+value,"請按下方保存鍵以儲存資料!!","success");
			}
		  });

	}
	

	function ChangeDisabled(value)
	{  
	    if(value=='1')
	    {
	    <%
	    String confs_Name = request.getParameter("page");
	    String sqll112 = "SELECT * FROM confs INNER JOIN users  WHERE  confs_Name = '"+confs_Name+ "' "  ;
	    ResultSet rec7 =  con.createStatement().executeQuery(sqll112);
	    rec7.next() ; 
	    String cc_organizer = rec7.getString("confs.organizerId");
	    String sstaffId =(String)session.getAttribute("staffId");%>
	    var i_count=0;
	    <%String sqqqq = "SELECT * FROM confs,attendees  WHERE  confs_Name = '"+confs_Name+ "' and confs.confs_Id=attendees.confs_Id "  ;
	    ResultSet rrrs =con.createStatement().executeQuery(sqqqq);
	    while(rrrs.next()){%>

			 i_count+=1;
		<%}%>
		   
	    	if(<%=sstaffId%>!=null)
	    	{ // 變更欄位為可用
			　   document.getElementById('meetingname').disabled=false;
			    document.getElementById('starttime').disabled=false;
			    document.getElementById('endtime').disabled=false;
			    document.getElementById('chairId').disabled=false;
			    document.getElementById('location').disabled=false;
			    document.getElementById('theme').disabled=false;
			    var count=i_count;

			    var delat = document.getElementById('delattendee');
			    var num= delat.getElementsByTagName('select');
			    var  k ;
			    for (k = 0; k<count; k++) 
			    {
			    document.getElementById("a_name"+k).disabled=false;
			    document.getElementById("type"+k).disabled=false;
			    }
	    
	   
	　  		}
		    else{
		    	swal({
			    icon: "error",
			    title: "您不是創建者，無法編輯資料～"
			    
		    	});
		    
		    }
	    
		}

	}	 	




</script>

</head>

<body > 
<nav class="navbar shadow-sm" style=";background-color:#B87070;">
    <div class="container" style="text-align: center;margin-left: 0px;">
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

<div class="container" style="margin-top: 3%;margin-left: 18%;">
    <div class="row">
        <div class="col-md-3">
            <label style="font-size: 20px; display: flex; align-items: center;font-weight:bolder">
            	<%String titlename = request.getParameter("page");%>
                會議列表 ----> <%out.print(titlename);%> 
            </label>
        </div>
        <div class="col-md-4" style="width:100px">
            <!-- 顯示 flash 訊息 -->
        </div>
        <div class="col-md-3" >
            <ul class="nav justify-content-end"  style="width:670px;margin-left:-240px;">

            	<li class="nav-item">
                    <button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;margin-left:20px;" onclick="ChangeDisabled(1)" id="">編輯</button>
                </li>


                <li class="nav-item">
                	<form action="delete.jsp" accept-charset="utf-8">
                		<button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;margin-left:20px;"  id="">刪除</button>
                	</form>                    
                </li>
                <li class="nav-item">
                <form action="meet_record.jsp">	
                    <button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;margin-left:20px;margin-right:20px;" >會議記錄</button>
                </form>  
                </li>
                
            	<li class="nav-item" style="color:#007bff;">
            	 		
            			<button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;margin-right:20px;"  onclick="attendtype()" type="button">與會模式</button>         
            			

                    	
                </li>
            	<li class="nav-item" style="color:#007bff;">
            			
            			<button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;margin-right:20px;"  onclick="spacesign()">場地簽核</button>         
            			
                    
                </li>

                <li class="nav-item" style="color:#007bff;">               	
                    	<button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;" onclick="chairsign()">主持人簽核</button>
                    	               
                </li>
                <li class="nav-item">
                	
                    <button style="font-weight:bolder;border-radius:10px;background-color:#EBD6D6;border:0;padding:3px 10px;margin-left:20px;"  onclick="cost()"  id="">成本估計</button>
                   		
                </li>
                
                


            </ul>
        </div>
    </div>
</div>


<%
    String cc_name = request.getParameter("page");
    session.setAttribute("confs_Name",request.getParameter("page"));
    String sqll11 = "SELECT * FROM confs as a join attendees as b join users as c WHERE  confs_Name = '"+cc_name+ "' "  ;
    ResultSet rec2 =  con.createStatement().executeQuery(sqll11);
    rec2.next() ; 
                        
                        String c_name = rec2.getString("a.confs_Name");
                        String c_organizer = rec2.getString("a.organizerId");
                        String c_stime = rec2.getString("a.startTime");
                        String c_etime = rec2.getString("a.endTime");
                        String c_roomid = rec2.getString("a.roomId");

                        String sqll12 = "SELECT * FROM confs INNER JOIN users  WHERE  confs.organizerId = users.users_staffId AND confs.confs_Name= '"+cc_name+ "' ";
                        ResultSet rec5 =  con.createStatement().executeQuery(sqll12);
                        rec5.next() ;
                        String c_orname = rec5.getString("users.users_name");

                        String sqll13 = "SELECT * FROM confs INNER JOIN users  WHERE  confs.charId = users.users_staffId AND confs.confs_Name= '"+cc_name+ "' ";
                        ResultSet rec6 =  con.createStatement().executeQuery(sqll13);
                        rec6.next() ;
                        String c_chname = rec6.getString("users.users_staffId")+rec6.getString("users.users_name");
%>

<!-- 新增會議的小視窗 -->
<div  style="margin-top: -15px;margin-left: 15%;" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
               <form action="savenewconfs.jsp" method="POST"  >
               	<input type="hidden" value="" name="attendtype" id="attendtype">
               	<input type="hidden" value="" name="space" id="space">
               	<input type="hidden" value="" name="chair" id="chair"> 
               	<input type="hidden" value="" name="cost" id="cost">
                    <div style="background:#f5f5f5;padding:1% 1%">
                        <div class="row" style="width: 100%;margin:0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="meetingname">會議名稱：</label>
                                <input type="text" class="form-control" id="meetingname" name="name"  value="<%= c_name %>" disabled>
                            </div>

                            <div class="col-sm">
                                <label for="">建立者：</label>
                                <input type="text" class="form-control" id="createUser"  value="<%= c_organizer %><%= c_orname%>" disabled>
                            </div>
                        </div>
                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="starttime">開始時間：</label>
                                <input type="datetime-local" class="form-control" id="starttime" name="startTime" value="<%= c_stime %>" disabled>
                            </div>
                            <div class="col-sm">
                                <label for="endtime">結束時間：</label>
                                <input type="datetime-local" class="form-control" id="endtime" name="endTime" value="<%= c_etime %>" disabled>
                            </div>
                        </div>
                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="employeeList">主持人編號：</label>
                                <select class="form-control" id="chairId" name="chairId"   disabled>
                                        <option ><%= c_chname%></option>
                                        <%
                                         sql="select users.users_staffId,users.users_name from  users";
                                         rs =con.createStatement().executeQuery(sql);
                                        while(rs.next())
                                        {   %>

                                        <option ><%out.print(rs.getString("users_staffId")+rs.getString("users_name"));%></option>
                               
                               
                                        <%}%> 
                            </select>
                                <datalist id="staffList">

                                </datalist>
                            </div>
                            <div class="col-sm">
                                <label for="location">地點：</label>
                                 <select class="form-control" id="location" name="roomId"  disabled>
                                    
                                    <option ><%= c_roomid %></option>
                                   <%  sql="select confrooms.cfr_Name from  confrooms";
                                        rs =con.createStatement().executeQuery(sql);
                                    while(rs.next()){       %>

                                    <option ><%out.print(rs.getString("confrooms.cfr_Name"));%></option>
                               
                               
                                    <%}%>  
                                </select>
                            </div>
                        </div>




                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <label for="theme">主題議程：</label>
                                <textarea class="form-control edit" id="theme"  name="topic" disabled><% out.print(rec2.getString("a.topic"));%></textarea>
                            </div>
                        </div>
                        <div class="row" style="width: 100%;margin: 0 auto;padding:1% 2%">
                            <div class="col-sm">
                                <div class="row">
                                    <div class="col">
                                        <label>與會人員：</label>
                                    </div>
                                    
                                </div>
                                <table class="table table-striped"
                                    style="width: 100%; background:#fffffe; background-size:auto; margin-top: 1%;">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">員工編號</th>
                                            <th scope="col">參與身分</th>
                                            <th scope="col">與會模式</th>
                                            
                                        </tr>
                                    </thead>
                                    
                                    <tbody id="delattendee1">
                                    <%
                                        String a_name = request.getParameter("page");
                                        String sqll1 = "SELECT * FROM  attendees INNER JOIN confs LEFT JOIN users ON confs.confs_Id=attendees.confs_Id  WHERE confs_Name = '"+a_name+ "' AND users.users_staffId=attendees.staffId";
                                        ResultSet rec3 =  con.createStatement().executeQuery(sqll1);
                                        int i =0;
                                        int j =0;
                                        while(rec3.next())
                                        {   
                                            
                                            
                                            String a_staffid = rec3.getString("attendees.staffId");
                                            String a_attendtype = rec3.getString("attendees.attendType");
                                            String a_attendmode = rec3.getString("attendees.attendMode");
                                            String uname = rec3.getString("users.users_name");
                                            

                                    %>
                                        <tr class="attendee" id="delattendee">
                                            <th scope="row">
                                                <select name="usersselect<%out.print(i);%>" class="a_name form-control" id="a_name<%out.print(i);%>"  disabled>
                                                <option ><%=a_staffid%><%=uname%></option>
                                            <%
                                                 sql="select users.users_staffId,users.users_name from  users";
                                                 rs =con.createStatement().executeQuery(sql);
                                                while(rs.next())
                                                {   %>

                                                <option >
                                                    <%out.print(rs.getString("users_staffId")+rs.getString("users_name"));%>  
                                                </option>
                                       
                                       
                                                <%}%>       
                                                    
                                                </select>  
                                            </th>

                                            <td id="ttype">
                                                <select class="form-control" id="type<%out.print(j);%>" name="type<%out.print(j);%>" disabled>
                                                    <option ><%=a_attendtype%></option>
                                                    <%
                                                    String a = "";

                                                    if(a_attendtype.equals("出席"))
                                                    {
                                                        a="列席";
                                                    }
                                                    else{
                                                        a="出席";
                                                }
                                                    %>
                                                    <option><%= a %></option>
                                                    
                                                </select>
                                            </td>
                                            <td valign="middle">
                                                <%=a_attendmode%>
                                            </td>
                                      
                                        </tr>
                                        <% i++;j++;}
                                        %>   
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div style="text-align:right;margin:2%">
                    	
                        <button class="btn btn-danger" id="checkmember" type="submit">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





 

</body>
</html>
