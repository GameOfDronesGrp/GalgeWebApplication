<%-- 
    Document   : Tabt
    Created on : Mar 9, 2017, 11:43:44 AM
    Author     : Bulqe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>Spil</title>
    </head>
    <body>
                <header>
            
            <nav>
          <ul>
              <li> <a href="Index.jsp" > Log Ud </a></li>
          </ul>
          
          
      </nav>
        </header>
        <h1><center> Galgelegspillet</center></h1>
                <p><center>
    <%
    try {
	galgeleg.GalgelogikService service = new galgeleg.GalgelogikService();
	galgeleg.GalgelegI port = service.getGalgelogikPort();
	// TODO process result here
	java.lang.String result = port.getOrdet();
	out.println("Du tabte, Ordet var: "+result);
    } catch (Exception ex) {
        out.println("Kunne ikke få forbindelse til serveren" );
	// TODO handle custom exceptions here
    }
    %>
    </center></p>
    
    <center><label for="BrugteBogstaver">
    <%
    try {
	galgeleg.GalgelogikService service = new galgeleg.GalgelogikService();
	galgeleg.GalgelegI port = service.getGalgelogikPort();
	// TODO process result here
	java.util.List<java.lang.String> result = port.getBrugteBogstaver();
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
	galgeleg.GalgelogikService service = new galgeleg.GalgelogikService();
	galgeleg.GalgelegI port = service.getGalgelogikPort();
	// TODO process result here
	int result = port.getAntalForkerteBogstaver();
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
        <input type="submit" name="SpilIgen" value="Spil Igen">
    </form>

    <%
    try {
	galgeleg.GalgelogikService service = new galgeleg.GalgelogikService();
	galgeleg.GalgelegI port = service.getGalgelogikPort();
        if(request.getParameter("SpilIgen") != null){
	port.nulstil();
        response.sendRedirect("Spil.jsp");
    };
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>


    
    </body>

</html>
