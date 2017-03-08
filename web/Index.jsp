

<%@page import="javax.xml.namespace.QName"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Galgespil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    
    <body>
        <h1 style="margin-top: 30px;"><center>Velkommen til Galgelegspillet</center></h1>
    <p style="margin-top: 30px;"><center>Login for at start spilet</center></p>

    <form>
    <center>        
        <label for="username">User Name:</label>
        <br>
        <input type="text" id="username" name="username" placeholder="sxxxxxx@student.dtu.dk">
        <br>
        <label for="password">Password:</label>
        <br>
        <input type="password" id="password" name="password" placeholder="password">
        <br>
        <br>
        <input type="submit" value="Login"> 
    </center>
    </form>



    
    <%
    try {
	galgeleg.GalgelogikService service = new galgeleg.GalgelogikService();
	galgeleg.GalgelegI port = service.getGalgelogikPort();
	 // TODO initialize WS operation arguments here
	java.lang.String arg0 = request.getParameter("username");
	java.lang.String arg1 = request.getParameter("password");
	// TODO process result here
	boolean result = port.hentBruger(arg0, arg1);
	out.println("Result = "+result);
            if(result){
            response.sendRedirect("Spil.jsp");
        }else {
            response.sendRedirect("Index.jsp");
            out.println("Forkert brugernavn eller adgangskode");
        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    


    %>

    </body> 
</html>
