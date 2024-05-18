package Beans;
import java.sql.*;
public class users {
    private String firstName;
    private String lastName;
    private String sex;
    private String dob;
    private String email;
    private String phoneNumber;
    private String address;
    private String password;

    // Constructors
    public users() {
    }

    public users(String firstName, String lastName, String sex, String dob, String email, String phoneNumber,String password, String address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.sex = sex;
        this.dob = dob;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.address = address;
        
    }

    // Getters and setters
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }
       public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
    public void insertUser(users userToInsert){
     Dbconnection dbc = new Dbconnection();
     Connection con;
     String sql = "INSERT INTO tblusers (firstName, lastName, sex, dob, email, phoneNumber, password, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement stmt;
    
     
  
     
        try {
          
                con = dbc.getConnection();
                stmt = con.prepareStatement(sql);
                stmt.setString(1, userToInsert.getFirstName());
                stmt.setString(2, userToInsert.getLastName());
                stmt.setString(3, userToInsert.getSex());
                stmt.setString(4, userToInsert.getDob());
                stmt.setString(5, userToInsert.getEmail());
                stmt.setString(6, userToInsert.getPhoneNumber());
                stmt.setString(7, userToInsert.getPassword());
                stmt.setString(8, userToInsert.getAddress());
                stmt.executeUpdate();
                
                
               
        } catch (Exception e) {
            e.getMessage();
        }
        
        dbc.closeConnection();
        
    
        
     
      
    }
}