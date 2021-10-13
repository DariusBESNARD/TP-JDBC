
import Controller.Controleur;

import java.sql.*;
import java.util.*;
import java.awt.*;

public class BDDRH {

    public static void main(String[] args) throws SQLException {
        int a;
        System.out.println("1. Liste salariés embauchés avant une date"+
        "\n2. Contrat en fin de validité"
        "\n3. Contrats signés par un salarié"
        "\n4. Nombre de postes existants"
        "\n5. Les services des salariés"
        "\n6. Insertion d'un salarié"
        "\n7. Quitter")
        a = Scanner.System.in()
        Controleur ctl1 = new Controleur();
        ctl1.traiterRequete();
    }
}