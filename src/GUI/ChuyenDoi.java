/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class ChuyenDoi {
    static DateFormat df = new SimpleDateFormat("dd/MM/yy");
    static DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
    
    public static Date getDate(String ngay){
        try {
            return df.parse(ngay);
        } catch (Exception e) {
            System.err.println("Lỗi ngày");
        }
        return null;
    }
    public static String getDate2(Date date){
        return df.format(date);
    }
    
    public static String DinhDangSo(double  so){
        return NumberFormat.getNumberInstance().format(so);
    }
     
    public static double ChuyenSangSo(String chuso){
        try {
            return NumberFormat.getNumberInstance().parse(chuso).doubleValue();
        } catch (Exception e) {
            return 0;
        }
    }
}
