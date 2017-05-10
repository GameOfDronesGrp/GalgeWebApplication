/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

public class BrugerLogIn {
    
    private static String _brugernavn;
    private static String _password;

    public static String getBrugernavn() {
        return _brugernavn;
    }

    public static String getPassword() {
        return _password;
    }

    public static void setBrugernavn(String brugernavn) {
        _brugernavn = brugernavn;
    }


    public static void setPassword(String password) {
        _password = password;
    }

    
}
