
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
        <link rel="stylesheet" href="main.css">
    
    </head>
    
<script>
function loginAlert(){
if (username.value === "" || password.value === ""){
alert ("Brugernavn eller adgangskode er forkert, indtast venligst igen.");
return false;
}
return true;
}

</script>
    <body>
                <header>         
            <nav>
          <ul>
              <li> <a href="HighscoreOut.jsp" style="margin-right: 5px" > Highscore </a></li>
          </ul>         
      </nav>
        </header>
        <h1 style="margin-top: 30px;"><center>Velkommen til Galgeleg</center></h1>
    <p style="margin-top: 30px;"><center>Login for at starte spillet</center></p>

<form name="form" onsubmit="return loginAlert();">
    <table>
    <center>        
        <label for="username">DTU Brugernavn:</label>
        <br>
        <input type="text" id="username" name="username" placeholder="sxxxxxx">
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
        
        Cookie loginCookie = null;
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null){
            for(Cookie cookie : cookies){
    		if(cookie.getName().equals("brugernavn")){
                    loginCookie = cookie;
                    break;
    		}
            }
    	}
    	if(loginCookie != null){
    		loginCookie.setMaxAge(0);
        	response.addCookie(loginCookie);
    	}
        
        
        galgelegport.wsdl.GalgeServiceService service = new galgelegport.wsdl.GalgeServiceService();
	galgelegport.wsdl.Galgelogik port = service.getGalgePort();
       
        String brugernavn = request.getParameter("username");
	String kode = request.getParameter("password");
                
            session.removeAttribute("name");
            session.removeAttribute("pass");
            
    try {
	boolean result = port.hentBruger(brugernavn, kode);
            if(result){
            loginCookie = new Cookie("brugernavn",brugernavn);
            //setting cookie to expiry in 30 mins
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
            session.setAttribute("name", brugernavn);
            session.setAttribute("pass", kode);
            response.sendRedirect("Spil.jsp");
        }else{
          %>  
          <script>alert("Indtast venligst gyldig brugernavn og adgangskode");</script>
           <%
        }
    
    } catch (Exception ex) {
	
    }
    
    %>

    </body> 
</html>
