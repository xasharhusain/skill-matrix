<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          try
          {
              String qid=request.getParameter("qid");
               String ques=request.getParameter("ques");
               String opt1=request.getParameter("opt1");
               String opt2=request.getParameter("opt2");
               String opt3=request.getParameter("opt3");           
               String opt4=request.getParameter("opt4");
               String ans=request.getParameter("ans");
               DB.DBCon db=new DB.DBCon();
               db.pstmt=db.con.prepareStatement("insert into ques_mstr values(?,?,?,?,?,?,?)");
               db.pstmt.setString(1, qid);
               db.pstmt.setString(2, ques);
               db.pstmt.setString(3, opt1);
               db.pstmt.setString(4, opt2);
               db.pstmt.setString(5, opt3);
               db.pstmt.setString(6, opt4);
               db.pstmt.setString(7, ans);
               int i=db.pstmt.executeUpdate();
               if(i>0)
               {
                   out.println("<script>alert('Question Added Successfully')</script>");
                   response.sendRedirect("AddQuestion.jsp?msg=Question Added Successfully");
               }
          }
          catch(Exception e)
          {
              e.printStackTrace();
          }
        %>
    </body>
</html>
