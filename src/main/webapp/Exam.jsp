 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Question Paper</h1>
        <form action="SubmitAnswer.jsp">
            <table width="800" border="1" cellspacing="0"bgcolor="lightpink">
                <%
                    DB.DBCon db=new DB.DBCon();
                    db.pstmt=db.con.prepareStatement("select * from ques_mstr");
                    int count=1;
                    db.rst=db.pstmt.executeQuery();
                    while(db.rst.next())
                    {                    
                    out.println("<tr bgcolor=yellow><td colspan=2><b>Ques. "+count+": "+db.rst.getString(2)+"</b></td></tr>");
                    out.println("<tr><td witdth=400><input type=radio name=ans"+count+" value='"+db.rst.getString(3)+"'>"+db.rst.getString(3)+"</td>");
                    out.println("<td><input type=radio name=ans"+count+" value='"+db.rst.getString(4)+"'>"+db.rst.getString(4)+"</td></tr>");
                    out.println("<tr><td witdth=400><input type=radio name=ans"+count+" value='"+db.rst.getString(5)+"'>"+db.rst.getString(5)+"</td>");
                    out.println("<td><input type=radio name=ans"+count+" value='"+db.rst.getString(6)+"'>"+db.rst.getString(6)+"</td></tr>");
                    out.println("<input type='hidden' name='qid"+count+"' value="+db.rst.getString(1)+">");
                    count++;
                    
                    }
                    out.println("<tr><th colspan='2'><input type='submit' value='Submit' style='width:150px;height:40px;color:white;background-color:red;font-size:30px;'></th></tr>");
                    %>
            </table>
        </form
    </center>
    </body>
</html>
