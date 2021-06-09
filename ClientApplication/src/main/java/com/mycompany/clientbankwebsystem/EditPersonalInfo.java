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
@WebServlet(name = "EditPersonalInfo", urlPatterns = {"/EditPersonalInfo"})
public class EditPersonalInfo extends HttpServlet {
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

if (FN.equals("")){
    FN= Login.Fname;
}
if (LN.equals("")){
LN= Login.Lname;
}
if (PA.equals("")){
PA= Login.PSW;
}
if (AD.equals("")){
AD= Login.Adress;
}
if (EM.equals("")){
EM= Login.Email;
}

if (PN.equals("")){
    PN= Login.Pnumber;
}
String qry = " Update bankcustomer set cust_fname='"+FN+"',cust_lname='"+LN+"',cust_password='"+ PA +"',cust_address='"+AD+"',cust_email='"+EM+"',cust_phonenumber='"+PN+"' where cust_id="+ Login.CustomerID;
            Login.PSW= PA;
            Login.Fname = FN ;
            Login.Lname=LN;
            Login.Adress=AD ;
            Login.Email= EM;
            Login.Pnumber= PN;
PreparedStatement prepStmt = conn.prepareStatement(qry);

prepStmt.execute();
response.sendRedirect("PersonalInfo.jsp");  
 } // end of try
             }
 }catch (SQLException ex) {
//out.println("<script>");
     out.print("<script>" );
      out.print("alert('Password, PhoneNumber and Email Should be Unique To You')" );
     out.print("</script>" );
//out.println("</script>");
}catch (Exception e) {
//out.println("<script>");
    out.println("Exception caught"+e);
//out.println("</script>");
    }
    }
        out.println("</body>");
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
