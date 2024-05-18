package Beans;

import java.sql.*;


public class Dbconnection {
    // JDBC URL of MySQL server
        private Connection connection;
        private String connectionUrl = "jdbc:mysql://localhost:3306/srukyeung";
        private String databaseUser = "Noy";
        private String databasePassword = "12345";
        
        
        
       public Connection getConnection() throws SQLException {
        
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                // Establish the connection
                connection = DriverManager.getConnection(connectionUrl, databaseUser, databasePassword);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        
    
        
        }
    }
}