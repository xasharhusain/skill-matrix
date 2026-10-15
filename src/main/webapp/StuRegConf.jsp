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
            String rn=request.getParameter("rno");
            String name=request.getParameter("sname");
            String dob=request.getParameter("dob");
            String gen=request.getParameter("gen");
            String course=request.getParameter("course");
            String sem=request.getParameter("sem");
            String addr=request.getParameter("addr"); 
            String cont=request.getParameter("cont");
            String mail=request.getParameter("mail"); 
            String user=request.getParameter("user");
            String pswd=request.getParameter("pswd");
            DB.DBCon db=new DB.DBCon();
            db.pstmt=db.con.prepareStatement("insert into stu_mstr values(?,?,?,?,?,?,?,?,?,?,?,?)");
            db.pstmt.setString(1, rn);
            db.pstmt.setString(2, name);
            db.pstmt.setString(3, dob);
            db.pstmt.setString(4, gen);
            db.pstmt.setString(5, course);
            db.pstmt.setString(6, sem);
            db.pstmt.setString(7, addr);
            db.pstmt.setString(8, cont);
            db.pstmt.setString(9, mail);
            db.pstmt.setString(10, user);
            db.pstmt.setString(11, pswd);
            db.pstmt.setString(12, new java.util.Date().toString());
            int i=db.pstmt.executeUpdate(); 
            if(i>0)
            {
                out.println("<script>alert('User Registered Successfully')</script>");
                response.sendRedirect("index.html?msg=User Registered Successfully");
            }
            }
            catch(Exception e) 
            { 
            e.printStackTrace();
            }
            %>
    </body>
</html>
