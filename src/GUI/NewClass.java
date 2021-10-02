/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;
import doan_oracle.DBconnection;
import java.sql.Connection;
import doan_oracle.frm_DangNhap;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
/**
 *
 * @author ADMIN
 */
public class NewClass {
   // Connection connection = null;
    public static void main(String[] args) {
        Connection connection = null;
        try {
            connection = DBconnection.getConnection(frm_DangNhap.tenDangNhap(), frm_DangNhap.matKhauDangNhap());
                String query = "select * from tbl_khachhang where ssodienthoai = '0337122712'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultset = preparedStatement.executeQuery();
                
                //if(!resultset.next()){
                    //JOptionPane.showMessageDialog(this, "Không tìm thấy tài khoản khách hàng");
                                        System.out.println("a");

                    System.out.println(resultset.getString("sHoTen"));
                   // return;
               // }
              //  else {
                    String data = resultset.getString("sHoTen");
                    //this.lbTenKH.setText(data);
                    //this.txtMaKH.setEditable(true);
                    //this.lbIconKhoa.setIcon(icon);
            //    }
        } catch (Exception e) {
        }
    }
}
