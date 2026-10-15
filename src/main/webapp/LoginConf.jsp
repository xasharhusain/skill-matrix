<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Student Login
        try
        {
        String user=request.getParameter("user");
        String pswd=request.getParameter("pswd");
        DB.DBCon db=new DB.DBCon();
        db.pstmt=db.con.prepareStatement("select * from stu_mstr where user=? and pswd=?");
        db.pstmt.setString(1, user);
        db.pstmt.setString(2, pswd);
        db.rst=db.pstmt.executeQuery();
        if (db.rst.next())
        {
        session.setAttribute("user",user);
        response.sendRedirect("StudentHome.html");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
    </body>
</html>
