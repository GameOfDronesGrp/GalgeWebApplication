

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
      <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="main.css">
        <title>Spil</title>
         </head>
         
         <%
             
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
        for(Cookie cookie : cookies){
	if(cookie.getName().equals("brugernavn")) userName = cookie.getValue();
        }
        }
        if(userName == null) response.sendRedirect("Index.jsp");             

             %>
      
        
   
    <body>
        <header>
            
            <nav>
          <ul>
              <li> <a href="HighscoreIn.jsp" style="margin-right: 5px" > Highscore </a></li>
              <li> <a href="Index.jsp"  style="margin-left: 5px" > Log Ud </a></li>
          </ul>
          
          
      </nav>
        </header>
        <h1><center> Galgelegspillet</center></h1>
                <p><center> 
    <%
        
        galgelegport.wsdl.GalgeServiceService service = new galgelegport.wsdl.GalgeServiceService();
	galgelegport.wsdl.Galgelogik port = service.getGalgePort();
        
        String brugernavn = (String)session.getAttribute("name");
        String kode = (String) session.getAttribute("pass");
    try {


	// TODO process result here
	java.lang.String result = port.getSynligtOrd(brugernavn, kode);
	out.println("Dit ord: "+result);
    } catch (Exception ex) {
        out.println("Kunne ikke få forbindelse til serveren" );
	// TODO handle custom exceptions here
    }
    %>
    </center></p>
    
    <center><label for="BrugteBogstaver">
    <%
    try {
        
	// TODO process result here
	java.util.List<java.lang.String> result = port.getBrugteBogstaver(brugernavn, kode);
	out.println("Brugte Bogstaver: "+result);
    } catch (Exception ex) {
        out.println("Kunne ikke få forbindelse til serveren" );
	// TODO handle custom exceptions here
    }
    %>

        </label></center>
    
        
        <div style="margin-top: 30px;" class="Hangman" id="HangmanPic"> <center>
            <img src=
    <%
    try {
	// TODO process result here
	int result = port.getAntalForkerteBogstaver(brugernavn, kode);
        String billede;
        switch(result){
            case 0: billede = "HangManBilleder/Hangman0.png";
                break;
                
            case 1: billede = "HangManBilleder/Hangman1.png";
                break;
            
            case 2: billede = "HangManBilleder/Hangman2.png";
                break;
                
            case 3: billede = "HangManBilleder/Hangman3.png";
                break;
               
            case 4: billede = "HangManBilleder/Hangman4.png";
                break;
                
            case 5: billede = "HangManBilleder/Hangman5.png";
                break;
                
            case 6: billede = "HangManBilleder/Hangman6.png";
                break;
                
            case 7: billede = "HangManBilleder/Hangman6.png";
                break;
                
            default: billede = "HangManBilleder/Hangman0.png";
        };
        
        out.println(billede);
        
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>

                 
                 />
     <center>
        </div>
        



    <form> 
         
          <input   name="gaetbogstav" id="gaetbogstav" placeholder="Gæt et bogstav">
          <input type="submit" value="gæt">
    </form>

    <form> 
        

 </form>
    <%
    try {
	 // TODO initialize WS operation arguments here
	java.lang.String arg0 = request.getParameter("gaetbogstav");
	port.gætBogstav(brugernavn, kode, arg0);
        response.sendRedirect("Spil.jsp");
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>


    <%
    try {
	// TODO process result here
	boolean result = port.erSpilletTabt(brugernavn, kode);
	if(result){
             response.sendRedirect("Tabt.jsp");
        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    
    <%
    try {
	// TODO process result here
	boolean result = port.erSpilletVundet(brugernavn, kode);
	if(result){
             response.sendRedirect("Vundet.jsp");
        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>

    
    
    
    </body>
                     
  
              
</html>


