/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Thearding;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import javax.swing.JLabel;
/**
 *
 * @author ADMIN
 */
public class clockTheard extends Thread{
    private JLabel lbl;

    public clockTheard(JLabel lbl) {
        this.lbl = lbl;
    }
     public void run(){
         SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
         while(true){
             Date date = new Date();
             String st = sdf.format(date);
             
             lbl.setText(st);
             
             try {
                 Thread.sleep(1000); 
             } catch (Exception e) {
             }
         }
     }
}
