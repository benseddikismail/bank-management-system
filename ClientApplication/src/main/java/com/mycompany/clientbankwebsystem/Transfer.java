/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.clientbankwebsystem;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Anas ER
 */
@WebServlet(name = "Transfer", urlPatterns = {"/transfer"})
public class Transfer extends HttpServlet {
public static String Message="";
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
            try{
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
String AT = request.getParameter("AT");
String RI = request.getParameter("RI");
 int AccountTransfer= Integer.parseInt(AT);
 int AccReceiverID=Integer.parseInt(RI);
int balance=0;
if (RI.equals("") || AT.equals("") ){
    out.println(" <script> " );
      out.println(" alert('Please Enter All Required Information') ");
     out.println(" </script> " );
}else{
Statement stm= conn.createStatement();
String qry = " Select balance from Account where account_id=(select acc_id from Customer_accounts where cust_id="+ Login.CustomerID+")";
ResultSet rs = stm.executeQuery(qry);      
if(rs.next()){
            balance = rs.getInt(1);
}
if(AccountTransfer>balance){
                out.println(" <script> " );
                out.println(" alert('Not Enough Balance') ");
                out.println(" </script> " );
                Message="Not Enough Balance";  
                response.sendRedirect("MoneyTransfer.jsp");
 }else{
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  LocalDateTime now = LocalDateTime.now();
 String OPdate= dtf.format(now);
 String qry2 = " Insert into Transaction (transaction_type,description,amount,transactiondate,cust_id) values('transfer',' ',"+AccountTransfer+",'"+OPdate+"',"+Login.CustomerID+")";
 String qry3 = " Insert into Transaction (transaction_type,description,amount,transactiondate,cust_id) values('deposit',' ',"+AccountTransfer+",'"+OPdate+"',"+AccReceiverID+")";      
 PreparedStatement prepStmt1 = conn.prepareStatement(qry2);
 PreparedStatement prepStmt2 = conn.prepareStatement(qry3);
 prepStmt1.execute();
 prepStmt2.execute();
 Message="Transfer Made Succesfully";       
 conn.close();
response.sendRedirect("MoneyTransfer.jsp");  
 } // end of try
             }
}
 }
            
 }catch (SQLException ex) {
//out.println("<script>");
     //out.print("<script>" );
      out.print(ex);
     //out.print("</script>" );
//out.println("</script>");
}catch (Exception e) {
//out.println("<script>");
    out.println("Exception caught"+e);
//out.println("</script>");
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
