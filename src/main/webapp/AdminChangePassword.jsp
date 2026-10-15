<!AdminChangePassword>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2:wght@800&family=Baloo+Bhaina+2:wght@800&display=swap" rel="stylesheet">
    <style>
        /* CSS RESET  */
        body{
            font-family: 'Baloo Bhai 2', cursive;
            margin: 0px;
            padding: 0px;
            background: url(Images/Student7.jpg);
            background-repeat:no-repeat ;
           background-size: 1550px 800px;  
           font-family: Baloo Bhai;  
           
        }
        .navbar
        {
         display: inline-block;
         border: 3px solid white;
        margin-left: 0%;
         margin-top: 25px;
         border-radius: 5px;
         width: 1500px;
        }
        .navbar li{
            display: inline-block;
        }
        .navbar li a{
            color: white;
            font-size:23px;
            padding: 15px;
            text-decoration: none;
        }
        .navbar li a:hover{
           
           color: grey;
           font-size:23px;
           padding:15px;
           text-decoration: none; 
       }
     

    
    </style>
 </head>
  <body>
    <header>
        <div class="navbar">
        <ul>
        <li><a href="AddQuestion.jsp"> Add Question</a> </li>
        <li><a href="QuestionList.jsp">Question List</a></li>
        <li><a href="AdminChangePassword.jsp">Change Password</a></li>
        <li><a href="Logout.jsp">Log Out</a></li>
        </ul>
    </div><hr>
    </header>
    <br><br>
    <center>
    <div style="width:800px;height:500px;background-color:lightblue;border:3px solid blue;">
    <h1>Admin Change Password</h1>
    <form action="#">
    <table width="600" height="450">
    <tr><td width="300">Old Password</td><td><input type="password" name="opswd"></td></tr>
    <tr><td width="300">New Password</td><td><input type="password" name="npswd"></td></tr>
    <tr><td width="300">Confirm Password</td><td><input type="password" name="cpswd"></td></tr>
    <tr><td width="300"><input type="submit" name="Change Password" name="opr"></td>
    <th><input type="reset" name="Reset Password"></th><tr>
    </table>
    </form>
    </div>
    <%
            if(request.getParameter("opr")!=null)
               {
            try
               {
                   String user=""+session.getAttribute("user");
                   String opswd=request.getParameter("opswd");
                   String npswd=request.getParameter("npswd");
                   String cpswd=request.getParameter("cpswd");
                   DB.DBCon db=new DB.DBCon();
                   db.pstmt=db.con.prepareStatement("select pswd from admin where user=?");
                   db.pstmt.setString(1, user);
                   db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
                {
                    String db_pswd=db.rst.getString(1);
            if(opswd.equals(db_pswd))
                {
            if(npswd.equals(cpswd))
                {
                    db.pstmt=db.con.prepareStatement("update admin set pswd=? where user=?");
                    db.pstmt.setString(1, npswd);
                    db.pstmt.setString(2, user);
                    int i=db.pstmt.executeUpdate();
            if(i>0)
                {
                    response.sendRedirect("AdminHome.html?msg=Password Updated Successfully");
                }
                }
            else
                {
                    out.println("<h2 style='color-red;'>ERROR:New and Confirm Password does not Match</h2>");
                }
                }
            else
                {
                    out.println("<h2 style='color:red;'>ERROR: Old Password does not Match</h2>");    
                }
                }
            else
                {
                    response.sendRedirect("AdminLogin.html?msg=Please Login First"); 
                }
                }
            catch(Exception e)
                {
                    e.printStackTrace();
                }
                }
    %>
    </center>
  </body>
</html>