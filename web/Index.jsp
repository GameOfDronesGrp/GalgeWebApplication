

<%@page import="javax.security.auth.login.LoginException"%>
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
    
<script>
function loginAlert(){
if (username.value === "" || password.value === ""){
alert ("Brugernavn eller adgangskode er forkert, indtast venligst igen.");
return false;
}
alert ("Du logger nu ind, hvis de indtastede oplysninger er korrekte");
return true;
}

</script>
    <body>
        <h1 style="margin-top: 30px;"><center>Velkommen til Galgeleg</center></h1>
    <p style="margin-top: 30px;"><center>Login for at starte spillet</center></p>

<form name="form" onsubmit="return loginAlert();">
    <table>
    <center>        
        <label for="username">Brugernavn:</label>
        <br>
        <input type="text" id="username" name="username" placeholder="sxxxxxx@student.dtu.dk">
        <br>
        <br>
        <label for="password">Adgangskode</label>
        <br>
        <input type="password" id="password" name="password" placeholder="password">
        <br>
        <br>
        <input type="submit" name="Submit" value="Login" onclick="loginAlert();">
    </center>
    </table>
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
            if(result){
            response.sendRedirect("Spil.jsp");
        }else{
          %>  
          <script>alert("Forkert brugernavn eller adgangskode");</script>
           <%
        }
    
    } catch (Exception ex) {
	
    }
    
    %>

    </body> 
</html>
