
<%
	Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con=DriverManager.getConnection(url,"root","1234");
    Statement  stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    if(con.isClosed())
           out.println("連線建立失敗");
        else
    {	
    String sql="USE dbsa";
    con.createStatement().execute(sql);
	}
%>