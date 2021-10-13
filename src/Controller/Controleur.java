/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Connexion;
import Model.Repository;
import View.*;
import java.awt.Font;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class Controleur {

    public void traiterRequete() throws SQLException {
        Statement stmt1=null, stmt2=null;

        ResultSet rst1=null, rst2=null;
        Properties props = new Properties();
        String url = "jdbc:mysql://localhost:3306/BDDRH";
        props.setProperty("user","root");
        props.setProperty("password","");

        Connection conn=null;
        try {
            //Appel de la méthode getConnexio() via la classe Connexion
            conn = Connexion.getConnexion(url, props);

            //Création d'objets de la classe Vue
            Vue1 vue1 = new Vue1();
            Vue2 vue2 = new Vue2();

            //Appel de la classe Repository du modèle
            Repository rep1 = new Repository(stmt1);
            Repository rep2 = new Repository(stmt2);

            //Récupération des résultats du requête du modèle
            String req1 = "SELECT * FROM candidat";
            String req2 = "SELECT  nom, prenoms, libelle FROM candidat c INNER JOIN specialite s ON c.idSpec = s.idSpec";

            //Lancement des requêtes et récupération des résultats
            rst1 = rep1.requete(conn, req1);
            rst2 = rep2.requete(conn, req2);

            //Appel de la vue
            vue1.showView(rst1);
            vue2.showView(rst2);
        }
        catch (SQLException se) {
            se.getMessage();
        }
    }
}
