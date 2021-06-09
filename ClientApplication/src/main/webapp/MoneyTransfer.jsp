<%@page import="com.mycompany.clientbankwebsystem.Transfer"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Make a Transfer</title>
        <meta charset="UTF-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <a class="nav-link " href="Account.jsp" tabindex="-1"> My Account</a>
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
        <div>
            
             <form action="transfer" method="POST">
                <fieldset >
                  <legend style="text-align: center; margin-top: 30px; "> Make Transfer</legend>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Amount to Transfer</label>
                   <input type="text" name= "AT"  class="form-control" placeholder="Enter The Amount you Want to Transfer"  style="width:80%;margin-left: 20px">
                  </div>
                  
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label" style="margin-left:20px;">Receiver ID</label>
                    <input type="text"  name= "RI" class="form-control" placeholder="Enter The Receiver ID You Want to Transfer Money To" style="width:80%;margin-left: 20px"> 
                  </div> 
                  
                      <div class="form-group" style="text-align: center; display:flex; justify-content: center;">
			<input type="submit" value="Make Transfer" class="btn float-right login_btn" style=" margin-top: 20px; margin-bottom: 60px; width:500px;">
                    </div>
                       <div class="mb-3">
                           <input type="text"  name= "Lname" class= "form-control" style=" width:30%; margin: 0px auto; border-color:white; " placeholder= "<%= Transfer.Message %>" >
                  </div>
                </fieldset>
          </form>
        </div>
    </body>
</html>
