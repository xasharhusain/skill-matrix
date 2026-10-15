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
        <div style="width:800px;height:500px;border:2px solid red;background-color:lightgray;">
            <h1>Add Question </h1>
            <form action="AddQuestionConf.jsp">
            <table width="600" height="400">
            <tr><td width="300">Question Id</td><td><input type="number" name="qid"</td></tr>
            <tr><td width="300">Question</td><td><input type="text" name="ques"</td></tr>
            <tr><td width="300">Option1</td><td><input type="text" name="opt1"</td></tr>
            <tr><td width="300">Option2</td><td><input type="text" name="opt2"</td></tr>
            <tr><td width="300">Option3</td><td><input type="text" name="opt3"</td></tr>
            <tr><td width="300">Option4</td><td><input type="text" name="opt4"</td></tr>
            <tr><td width="300">Answer</td><td><input type="text" name="ans"</td></tr>
            <tr><th width="300"><input type="submit" values="Submit"</th>
            <th><input type="reset" value="Reset"</th></tr>
            </table>
            </form>
        </div>
    </center>
</body>
</html>
