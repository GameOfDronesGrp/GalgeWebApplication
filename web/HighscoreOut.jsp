<%-- 
    Document   : HighscoreOut
    Created on : Apr 22, 2017, 12:27:29 PM
    Author     : Bulqe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>Galgeleg Highscore</title>
    </head>
    <body>
    <center>
        <header>
            <nav>
                <ul>
                    <li> <a href="Index.jsp"> Back to Login </a></li>
                </ul>
            </nav>
        </header>
    </center>

        <h1><center style = "margin-bottom: 50px "> Galgeleg Highscore </center></h1>    
    
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://gruppe11sql.cxyxxbzjqour.us-west-2.rds.amazonaws.com";
	String dbName = "GalgeLegDB";
	String userId = "gruppe11";
	String password = "gruppe11";
        int port = 3306;
	
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
	<tr bgcolor="#A52A2A">
		<td><b>Rank</b></td>
		<td><b>Username</b></td>
		<td><b>Score</b></td>
		<td><b>Time</b></td>
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+ ":" + port + "/" +dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT  @curRank := @curRank + 1  AS rank, user_id, score, time  FROM ( SELECT @curRank := 0) r,  Highscore h  ORDER BY  score DESC";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#DEB887">
			
			<td><%=resultSet.getString("rank") %></td>
			<td><%=resultSet.getString("user_id") %></td>
			<td><%=resultSet.getString("score") %></td>
			<td><%=resultSet.getString("time") %></td>
			
		</tr>
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>

</body>
</html>
