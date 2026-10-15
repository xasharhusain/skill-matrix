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
<center>
    <br><br>
    <div style="width:1200px; height:600px; border:2px solid blue; background-color: pink; overflow:"
         <h1>Question List </h1>
        <table width="1200" border="1" cellspacing="0">
            <tr bgcolor="yellow"> <th>Q.Id.</th><th>Question </th><th>Option1</th><th>Option2</th><th>Option3</th>
                <th>Option4</th><th>Answer</th></tr>
            <%
             try
              {
                DB.DBCon db=new DB.DBCon();
                db.pstmt=db.con.prepareStatement("select * from ques_mstr");
                db.rst=db.pstmt.executeQuery();
                while(db.rst.next())
                {
                out.println("<tr><td>"+db.rst.getString(1)+"</td><td>"+db.rst.getString(2 )+"</td>" 
                + "<td>"+db.rst.getString(3)+"</td><td>"+db.rst.getString(4)+"</td>"
                + "<td>"+db.rst.getString(5)+"</td><td>"+db.rst.getString(6)+"</td>" 
                + "<td>"+db.rst.getString(7)+"</td></tr>");       
                }
              }
              catch(Exception e)
              {
              e.printStackTrace();
              }
             %>
        </table>
</center>
</body>
</html>