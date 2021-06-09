<%-- 
    Document   : SignUpPage
    Created on : May 9, 2021, 6:03:35 PM
    Author     : Anas ER
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Your Account</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
/*the container must be positioned relative:*/


     </style>

    </head>
    
    <body>
        <form action="signup" method="POST">
                <fieldset di>
                  <legend style="text-align: center; margin-top: 30px; "> Create Your Account</legend>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">First Name</label>
                   <input type="text" name= "Fname"  class="form-control" placeholder= "" style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Last Name</label>
                    <input type="text"  name= "Lname" class="form-control" placeholder="" style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Password</label>
                    <input type="text"  name= "Passw" id="disabledTextInput" class="form-control" placeholder="" style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Address</label>
                    <input type="text"  name= "Adre" id="disabledTextInput" class="form-control" placeholder="" style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Email</label>
                    <input type="text" name= "Emai" id="disabledTextInput" class="form-control" placeholder= "" style="width:80%; margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Phone Number</label>
                    <input type="text" name="PhoneN" id="disabledTextInput" class="form-control" placeholder="" style="width:80%;margin-left: 20px">
                  </div>
                  
                  <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Gender</label>
                  <div class="mb-3">
                    
                    <select name="Gen" class="browser-default custom-select"  id="mySelect" style="width:80%;margin-left: 20px" >
                        <option value="F" >Female</option>  
                        <option value="M" >Male</option>
                        </select>
                    </div>
                      
                  
                      <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Account Type</label>
                  <div>
                      <select  name="acc" class="browser-default custom-select" id="mySelect" style="width:80%;margin-left: 20px" >
                          <option value="Savings Account" >Savings Account</option>
                          <option value="Salary Account" >Salary Account</option>
                          <option value="Current Account" >Current Account</option>
                          <option value="Checking Account" >Checking Account</option>
                        </select>
                       
                      </div>
                 
                  
                      <div class="form-group" style="text-align: center; display:flex; justify-content: center;">
                        <input  type="submit" value="Create Account" class="btn float-right login_btn" style=" margin-top: 20px; margin-bottom: 60px; width:500px;" >
                    </div>
                </fieldset>
          </form>
        
        
    </body>
</html>
