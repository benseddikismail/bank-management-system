/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.clientbankwebsystem;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;

 
/**
 *
 * @author Anas ER
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {
  public static String CustomerID="";
   public static String PSW="";
   public static String Fname="";
   public static String Lname="";
   public static String Adress="";
   public static String Email="";
   public static String Pnumber="";
   public String Gender="";
   public static String AccountType="";
   public static String AccountOpeningDate="";
   public static Double AccountBalance;
   public static Double AccountMinBalance;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
 try {
 Context ctx = new InitialContext();
 if (ctx == null) {
 throw new Exception("Error - No Context");
 }
  String Cid = request.getParameter("cust_id");
String DCpass = request.getParameter("cust_password");
 // /jdbc/postgres is the name of the resource incontext.xml
 DataSource ds = (DataSource)
ctx.lookup("java:/comp/env/jdbc/postgres");
 if (ds != null) {
 Connection conn = ds.getConnection();
 if (conn != null) {

Statement stm= conn.createStatement();
ResultSet rs = stm.executeQuery("select * from bankcustomer where cust_id="+Cid+ " and cust_password= '"+ DCpass+"'");
 if(rs.next())
        {
            CustomerID=Cid;
            PSW=DCpass ;
            ResultSet rst= stm.executeQuery("select * from bankcustomer where cust_id="+Cid + " and cust_password= '"+ DCpass+"'");
            while (rst.next()) {
            Fname = rst.getString(2);
            Lname=rst.getString(3) ;
            Adress=rst.getString(4) ;
            Email=rst.getString(5) ;
            Gender=rst.getString(6) ;
            Pnumber=rst.getString(7) ;
    } 
        conn.close();
        response.sendRedirect("index.html");  
        }
        else
        {
            CustomerID="";
           out.println("Username or Password Login incorrect"+ Cid+" "+ DCpass);
           response.sendRedirect("LOG.html");
        }
    
 } // end of try

 }
 }
 catch (SQLException ex) {
out.println("Login SQLException: " + ex);
}
 catch (Exception e) {
 //e.printStackTrace();
 out.println("Exception caught");
 out.println(e.toString());
 }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
