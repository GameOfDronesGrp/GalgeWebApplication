<%-- 
    Document   : HighscoreOut
    Created on : Apr 22, 2017, 12:27:29 PM
    Author     : Bulqe
--%>

<%@page import="database.Connector"%>
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
    try {
	galgelegport.wsdl.GalgeServiceService service = new galgelegport.wsdl.GalgeServiceService();
	galgelegport.wsdl.Galgelogik port = service.getGalgePort();
	 // TODO initialize WS operation arguments here
        java.lang.String brugernavn = request.getParameter("username");
	java.lang.String kode = request.getParameter("password");
	// TODO process result here
	java.util.List<galgelegport.wsdl.ScoreDTO> result = port.getRankList(brugernavn, kode);
        for(int i=0; i <result.size() ;i++){
            %>
            
                    <tr bgcolor="#DEB887">

            <td><%=i+1%></td>
            <td><%=""%></td>
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
