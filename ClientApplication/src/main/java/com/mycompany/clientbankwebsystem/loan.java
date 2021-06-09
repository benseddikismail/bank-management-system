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
import java.sql.SQLException;
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
@WebServlet(name = "loan", urlPatterns = {"/loan"})
public class loan extends HttpServlet {
public static String LoanAmount="";
public static String AccountID="";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loan</title>");            
            out.println("</head>");
            out.println("<body>");
           
            /* TODO output your page here. You may use following sample code. */
            
            
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
LoanAmount =  request.getParameter("LoanAmount");
AccountID=  request.getParameter("ID");

/*String qry = " Update bankcustomer set cust_fname='"+FN+"',cust_lname='"+LN+"',cust_password='"+ PA +"',cust_address='"+AD+"',cust_email='"+EM+"',cust_phonenumber='"+PN+"' where cust_id="+ Login.CustomerID;
            
PreparedStatement prepStmt = conn.prepareStatement(qry);
prepStmt.execute();
out.println("<script>");
    out.println("alert('Information Modified Successfully')");
out.println("</script>");
response.sendRedirect("PersonalInfo.jsp");*/  
 } // end of try
             }
 }catch (SQLException ex) {
//out.println("<script>");
     out.println(" <script> " );
      out.println(" alert('Password, PhoneNumber and Email Should be Unique To You" );
     out.println(" </script> " );
//out.println("</script>");
}catch (Exception e) {
//out.println("<script>");
    out.println("Exception caught"+e);
//out.println("</script>");
    }
        
            }
            out.println("</body>");
            out.println("</html>");
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
