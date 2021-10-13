
import Controller.Controleur;

import java.sql.*;
import java.util.*;
import java.awt.*;

public class BDDRH {

    public static void main(String[] args) throws SQLException {
        Controleur ctl1 = new Controleur();
        ctl1.traiterRequete();
    }
}