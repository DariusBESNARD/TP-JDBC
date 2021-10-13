
package View;

import java.awt.Font;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Vue1 {

    public void showView(ResultSet result) throws SQLException {

        try {
            System.out.println("Liste des candidats");

            while (result.next()) {
                //Traitement requête
                String nom = result.getString("nom");
                String prenoms = result.getString("prenoms");
                String courriel = result.getString("courriel");
                System.out.println(nom+"\t\t\t"+prenoms+"\t\t\t"+courriel) ;
            }
        }
        catch(SQLException se) {
            se.getMessage();
        }
    }
}
