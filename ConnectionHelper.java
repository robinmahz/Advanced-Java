package com.helper;
import java.sql.*;

public class ConnectionHelper {
    public static Connection getConnection() throws Exception {  // 👈 static here
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost/java", "root", "asdfghjkl;'");
    }
}
