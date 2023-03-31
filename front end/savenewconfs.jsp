
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%	

	
		    	      
		    request.setCharacterEncoding("utf-8");
		    	
		    
			/*搜尋會議ID*/
			String conf_name=(String)session.getAttribute("confs_Name");
		    String sql119 = "SELECT confs.confs_Id FROM confs  WHERE  confs.confs_Name = '"+conf_name+ "'";
		    ResultSet rec9 =  con.createStatement().executeQuery(sql119);
		    rec9.next();
		    String conid = rec9.getString("confs.confs_Id") ;	

		    
		    /*四個按鈕*/
			String attendtype=request.getParameter("attendtype");
			String space=request.getParameter("space");
			String chair=request.getParameter("chair");
			String cost=request.getParameter("cost");
		    String staffid=(String)session.getAttribute("staffId");  
		    if(attendtype!="")
		    {
		    	String sql99="update attendees set attendMode='"+ attendtype +"' WHERE staffId='"+staffid+"' and confs_Id='"+conid+"'";
				con.createStatement().executeUpdate(sql99);
			
		    }
		    if(space!="")
		    {
		    	String sql100="update confs set isRoomSign='"+ space +"' WHERE confs_Id='"+conid+"'";
				con.createStatement().executeUpdate(sql100);
			
		    }

		    if(chair!="")
		    {
		    	String sql101="update confs set isChairSign='"+ chair +"' WHERE confs_Id='"+conid+"'";
				con.createStatement().executeUpdate(sql101);
			
		    }

			if(cost!="")
		    {
		    	String sql102="update confs set cost='"+ cost +"' WHERE confs_Id='"+conid+"'";
				con.createStatement().executeUpdate(sql102);
			
		    }


			String chairid=request.getParameter("chairId");
			String cid="";
	 		for(int i=0;i<8;i++){
	 			cid+=chairid.charAt(i);
			}

			String roomId= request.getParameter("roomId");
			String meetname= request.getParameter("name");
			String startTime=request.getParameter("startTime");
			String endTime=request.getParameter("endTime");
			String topic= request.getParameter("topic");

			/*update會議資料到confs*/
			
			String sqlll1="update confs  set confs_Name='"+meetname+"',startTime='"+startTime+"',endTime='"+endTime+"',topic='"+topic+"',charId='"+cid+"',roomID='"+roomId+"' WHERE confs.confs_Id='"+conid +"';";			
			con.createStatement().executeUpdate(sqlll1);

			
			

			/*搜尋參與人員該會議有幾筆資料*/
			int gg=0;
			String sqlgg="select * from attendees where  attendees.confs_Id='"+ conid +"'";
			ResultSet rsgg =  con.createStatement().executeQuery(sqlgg);
		    while(rsgg.next()){
		    	gg+=1;
			}			
			String sqldel="DELETE FROM attendees WHERE confs_Id='"+ conid +"'";
			con.createStatement().execute(sqldel);

			String sql2="";
			for(int j=0;j<gg;j++){
			String type=request.getParameter("type"+j);
			String userselect=request.getParameter("usersselect"+j);
			String userid="";
			
				for(int k=0;k<=7;k++){
				 userid+=userselect.charAt(k);
				 
				}
				
				sql2="Insert attendees (confs_Id,staffId,attendType,attendMode) value ('"+conid+"','"+userid+"','"+type+"','待確認')";
				con.createStatement().execute(sql2);
				
														
			}
			
				
			out.print("<script>alert('成功修改會議!')</script>"); 
			out.println("<script>window.document.location.href='index.jsp';</script>");
		

%>
