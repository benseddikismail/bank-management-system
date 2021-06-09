/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.clientbankwebsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;  

/**
 *
 * @author Anas ER
 */
@WebServlet(name = "SignUP", urlPatterns = {"/signup"})
public class SignUP extends HttpServlet {
   
/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            
              try {
 Context ctx = new InitialContext();
            if (ctx == null) {
            throw new Exception("Error - No Context");
            }
 // /jdbc/postgres is the name of the resource in context.xml
 DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/postgres");
 if (ds != null) {
 Connection conn = ds.getConnection();
if (conn != null) {


// create the insert preparedstatement
String FN = request.getParameter("Fname");
String LN = request.getParameter("Lname");
String PA = request.getParameter("Passw");
String AD = request.getParameter("Adre");
String EM = request.getParameter("Emai");
String PN = request.getParameter("PhoneN");
String G = request.getParameter("Gen");

 String AccT = request.getParameter("acc");

if (FN.equals("") || LN.equals("") || PA.equals("") || AD.equals("") || EM.equals("") || PN.equals("") || G.equals("") || AccT.equals("") ){
    out.println(" <script> " );
      out.println(" alert('Please Enter All Required Information') ");
     out.println(" </script> " );
}else{

String qry = " Insert into bankcustomer (cust_fname,cust_lname,cust_password,cust_address,cust_email,cust_gender,cust_phoneNumber) Values('"+FN+"','"+LN+"','"+PA+"','"+AD+"','"+EM+"','"+G+"','"+PN+"')";
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  LocalDateTime now = LocalDateTime.now();
 String OPdate= dtf.format(now);
String qry3="Update Account set type='"+AccT+"',opening_date='"+OPdate+"',balance="+100+",branch_id="+0+" where account_id=(select acc_id from customer_accounts where cust_id=(Select cust_id from bankcustomer where cust_fname='"+FN+"' and cust_lname='"+LN+"' and cust_password='"+PA+"'))";
PreparedStatement prepStmt = conn.prepareStatement(qry);
PreparedStatement prepStmt3 = conn.prepareStatement(qry3);
prepStmt.execute();
prepStmt3.execute();
out.println("<script>");
    out.println("alert('Account Created Succesfully')");
out.println("</script>");
response.sendRedirect("LOG.html");  
 }
}// end of try
             }
 }catch (SQLException ex) {
//out.println("<script>");
     out.println(" <script> " );
      out.println("alert('Phone Number, Email Should be Unique To you')");
     out.println(" </script> " );
//out.println("</script>");
}catch (Exception e) {
//out.println("<script>");
    out.println("Exception caught "+e);
//out.println("</script>");
    }
        
            out.println("</body>");
            out.println("</html>");
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
