/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package doan_oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author ADMIN
 */
public class DBconnection {
    public static Connection getConnection(String strUser,String strPassword){
        Connection connection = null;     
        try {
            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@192.168.1.32:1521:orcl1";
           // String user = "sys as sysdba";
          //   String passwd = "sys";
            Class.forName(driver);
            connection = DriverManager.getConnection(url, strUser, strPassword);
        } catch (Exception e) {
            //JOptionPane.showMessageDialog(this, "Co loi");
        }
        return connection;
        
    }
    public static Connection getConnection() {
        Connection connection = null;
        try {
            String user = "sys as sysdba";
            String password = "sys";
            
            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@192.168.1.32:1521:orcl1";
            
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
        }
        return connection;
    }
    
    public static void closeConnection(Connection con){
        if(con != null){
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void main(String[] args) {
        System.out.println(getConnection("VanHien", "VanHien"));
           //     System.out.println(getConnection());

    }
}
