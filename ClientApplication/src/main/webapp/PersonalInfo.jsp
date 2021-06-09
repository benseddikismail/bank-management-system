<%-- 
    Document   : test
    Created on : May 1, 2021, 7:07:02 PM
    Author     : Anas ER
--%>

<%@page import="com.mycompany.clientbankwebsystem.Login"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Types"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.clientbankwebsystem.Transfer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">iBank</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="Transaction.jsp">My Transactions</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="PersonalInfo.jsp">Personal Information</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled" href="Account.jsp" tabindex="-1" aria-disabled="true"> My Accounts</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link " href="Loan.jsp" > My Loans</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link " href="MoneyTransfer.jsp" > Make a Transfer</a>
                  </li>
                   <li class="nav-item">
                    <a class="nav-link " href="CreditCard.jsp" > View Credit Cards</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link " href="LOG.html" > Logout</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        <form action="EditPersonalInfo" method="POST">
                <fieldset di>
                  <legend style="text-align: center; margin-top: 30px; "> Your Personal Account</legend>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">First Name</label>
                   <input type="text" name= "Fname"  class="form-control" placeholder= <%= Login.Fname %> style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Last Name</label>
                    <input type="text"  name= "Lname" class="form-control" placeholder=<%=Login.Lname%> style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Password</label>
                    <input type="text"  name= "Passw" id="disabledTextInput" class="form-control" placeholder=<%= Login.PSW %> style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Address</label>
                    <input type="text"  name= "Adre" id="disabledTextInput" class="form-control" placeholder="<%=Login.Adress%>" style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Email</label>
                    <input type="text" name= "Emai" id="disabledTextInput" class="form-control" placeholder= <%=Login.Email %> style="width:80%; margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Phone Number</label>
                    <input type="text" name="PhoneN" id="disabledTextInput" class="form-control" placeholder=<%= Login.Pnumber %> style="width:80%;margin-left: 20px">
                  </div>
                  
                  
                      
                      <div class="form-group" style="text-align: center; display:flex; justify-content: center;">
			<input type="submit" value="Edit Personal Information" class="btn float-right login_btn" style=" margin-top: 20px; margin-bottom: 60px; width:500px; ">
                    </div>
                </fieldset>
          </form>
    
    </body>
    <%

        %>
</html>
