<%-- 
    Document   : HighscoreIn
    Created on : Apr 22, 2017, 12:27:29 PM
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
                    <li> <a href="Spil.jsp" style="margin-right: 5px"> Spil Igen </a></li>
                    <li> <a href="Index.jsp" style="margin-left: 5px"> Log Ud </a></li>
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
                          
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
        for(Cookie cookie : cookies){
	if(cookie.getName().equals("brugernavn")) userName = cookie.getValue();
        }
        }
        if(userName == null) response.sendRedirect("HighscoreOut.jsp");             

             %>

<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr bgcolor="#A52A2A">
		<td><b>Rank</b></td>
		<td><b>Username</b></td>
		<td><b>Score</b></td>
		<td><b>Time</b></td>
	</tr>        
        
    <%
    try {
	galgelegport.wsdl.GalgeServiceService service = new galgelegport.wsdl.GalgeServiceService();
	galgelegport.wsdl.Galgelogik port = service.getGalgePort();

	java.util.List<galgelegport.wsdl.ScoreDTO> result = port.getRankList();
        for(int i=0; i <result.size() ;i++){
            %>
            
                    <tr bgcolor="#DEB887">

            <td><%=i+1%></td>
            <td><%=result.get(i).getUserID()%></td>
            <td><%=result.get(i).getScore()%></td>
            <td><%=result.get(i).getDatetime()%></td>

        </tr>
            
            
            <%
        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    
   
    %>    
</table>
    
</body>
</html>
