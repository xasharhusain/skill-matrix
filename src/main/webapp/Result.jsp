<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* CSS RESET  */
        body{
            margin: 0px;
            padding: 0px;
            background: url(Images/Student7.jpg);
            background-repeat:no-repeat ;
           background-size: 1550px 800px;
           
             
           
        }
        .navbar
        {
         display: inline-block;
         border: 3px solid white;
        margin-left: 2%;
         margin-top: 25px;
         border-radius: 5px;
         /* position: fixed; */
        }
        .navbar li{
            display: inline-block;
        }
        .navbar li a{
            color: white;
            font-size: 23px;
            padding:  60px;
            text-decoration: none; 
        }
        .navbar li a:hover{
           
            color: grey;
            font-size: 23px;
            padding:  60px;
            text-decoration: none; 
        }
    </style>
</head>
<body>
    <header>
        <div class="navbar">
        <ul>
        <li><a href="Exam.jsp">Start Exam</a></li>
        <li><a href="Result.jsp">Result</a></li>
        <li><a href="StuChangePassword.jsp">Change Password</a></li>
        <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div><hr>
    </header>
<center>
    <div style="width: 700px;height: 500px;background-color: white;border: 3px solid black;">
        <h2><u>Student Card</u></h2>
        <%
            try 
            {
             if(session.getAttribute("user")==null)
             {
                 response.sendRedirect("index.html?msg=Please Login Error");
             }
            String user=session.getAttribute("user").toString();
            DB.DBCon db=new DB.DBCon();
            int total=0,obtain=0;
            db.pstmt=db.con.prepareStatement("Select qid,ans FROM result_trans WHERE user=?");
            db.pstmt.setString(1, user);
            db.rst=db.pstmt.executeQuery();
            String qid="",ans="";
            while(db.rst.next())
            {
                total=total+5;
                qid=db.rst.getString(1);
                ans=db.rst.getString(2);
                java.sql.PreparedStatement ps=db.con.prepareStatement("select * from ques_mstr where qid=? and ans=?");
                ps.setString(1, qid);
                ps.setString(2, ans);
                java.sql.ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    obtain=obtain+5;
                }
                }
            int per=obtain*100/total;
            String grade;
            if(per>=75)
            grade="Grade: A";
            else if(per>=60)
            grade="Grade: B";
            else if(per>=50)
            grade="Grade: C";
            else grade="Not Qualified";
            db.pstmt=db.con.prepareStatement("SELECT rno,name,dob,gender,course,sem FROM stu_mstr WHERE user=?");
            db.pstmt.setString(1, user);
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
            out.println("<table width=600 border=1 cellspacing=0 cellpadding=10>");
            out.println("<tr><td width=300>Roll Number</td><td>"+db.rst.getString(1)+"</td></tr>");
            out.println("<tr><td width=300>Student Name</td><td>"+db.rst.getString(2)+"</td></tr>");
            out.println("<tr><td width=300>Date of Birth</td><td>"+db.rst.getString(3)+"</td></tr>");
            out.println("<tr><td width=300>Gender</td><td>"+db.rst.getString(4)+"</td></tr>");
            out.println("<tr><td width=300>Course</td><td>"+db.rst.getString(5)+"</td></tr>");
            out.println("<tr><td width=300>Semester</td><td>"+db.rst.getString(6)+"</td></tr>");
            out.println("<br><table width=600 border=1 cellspacing=0 cellpadding=10 bgcolor=lightgrey>");
            out.println("<tr><td width=300>Total Marks</td><td>"+total+"</td></tr>");
            out.println("<tr><td width=300>Obtain Marks</td><td>"+obtain+"</td></tr>");
            out.println("<tr><td width=300>Percentage</td><td>"+per+"</td></tr>");
            out.println("<tr><td width=300>Result</td><td>"+grade+"</td></tr>");
            
            }
            }
              catch(Exception e)
              {
              e.printStackTrace();
              }
            %>
        
    </div>
            
</center>
</body>
</html>