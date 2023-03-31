<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<%	
	
	request.setCharacterEncoding("utf-8");
	String chairid=request.getParameter("chairId");
	String[]count=request.getParameterValues("count");
	int fuck=0;
	for(int k=2;k<=count.length+2;k++){
		
		String userselectkk=request.getParameter("usersselect"+k); 

		if(chairid.equals(userselectkk)){
			
			fuck++;
		}

	}
		
	
	if(session.getAttribute("staffId")==null){
		out.print("<script>alert('您尚未登入')</script>"); 
		out.println("<script>window.history.back();</script>");
	}
	else if (fuck>0){
		out.print("<script>alert('主持人與參與人員不能相符!')</script>"); ; 
		out.print("<script>window.history.back();</script>");
	}
	else{

	 
	 String meetname= request.getParameter("name");
	 String creatid=(String)session.getAttribute("staffId");
	 String startTime=request.getParameter("startTime");
	 String endTime=request.getParameter("endTime");
	 
	 String cid="";
	 for(int i=0;i<8;i++){
	 	cid+=chairid.charAt(i);
	}
	String topic= request.getParameter("topic");
	String roomId= request.getParameter("roomId");	
	String singstr="待確認";
	
	
	
	/*新增會議到資料庫*/
	String sql="insert confs(confs_Name,organizerId,startTime,endTime,topic,charId,roomID,isChairSign,isRoomSign) values('"+meetname+"',";
	sql+="'"+creatid+"',";
	sql+="'"+startTime+"',";
	sql+="'"+endTime+"',";
	sql+="'"+topic+"',";
	sql+="'"+cid+"',";
	sql+="'"+roomId+"',";
	sql+="'"+singstr+"',";
	sql+="'"+singstr+"')";
	con.createStatement().execute(sql);

	/*搜尋會議ID*/
	String sql2="select * from confs where confs_Name='"+meetname+"'";
	ResultSet rs2=con.createStatement().executeQuery(sql2);
	while(rs2.next())
		{
			String meetid=rs2.getString("confs_Id");
		
	
	/*新增參與人員*/
		for(int j=2;j<=count.length+2;j++){

		String userselect=request.getParameter("usersselect"+j);
		String staffid="";
		 for(int i=0;i<8;i++){
		 	staffid+=userselect.charAt(i);
		}
		String attendType=request.getParameter("attendType"+j);
		String attendMode="待確認";

		sql2="insert attendees(confs_Id,staffId,attendType,attendMode) values('"+meetid+"',";
		sql2+="'"+staffid+"',";
		sql2+="'"+attendType+"',";
		sql2+="'"+attendMode+"') ";
		con.createStatement().execute(sql2);

		}
	}

	out.print("<script>alert('成功新增會議!')</script>"); 
	out.println("<script>window.history.back();</script>");

	}
	

%>
