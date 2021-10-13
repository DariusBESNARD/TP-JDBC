
package View;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Vue2 {
    public void showView(ResultSet result) throws SQLException {


        try {
            System.out.println("\n\nListe des candidats par spécialité");

            while (result.next()) {
                //Traitement requête
                String nom = result.getString("nom");
                String prenoms = result.getString("prenoms");
                String specialite = result.getString("libelle");
                System.out.println(nom+"\t\t\t"+prenoms+"\t\t\t"+specialite) ;
            }
        }
        catch(SQLException se) {
            se.getMessage();
        }
    }
}
