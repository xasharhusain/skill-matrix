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
            String qid[]=new String[20];
            String ans[]=new String[20];
            int i;
            int count=1;;
            for(i=0;i<20;i++)
            {
                qid[i]=request.getParameter("qid"+count);
                ans[i]=request.getParameter("ans"+count);
                count++;
            }
            String user=session.getAttribute("user").toString();
            DB.DBCon db=new DB.DBCon();
            for(i=0;i<20;i++)
            {
                db.pstmt=db.con.prepareStatement("insert into result_trans(user,qid,ans,date_time) values(?,?,?,?)");
                db.pstmt.setString(1, user);
                db.pstmt.setString(2, qid[i]);
                db.pstmt.setString(3, ans[i]);
                db.pstmt.setString(4, new java.util.Date().toString());
                db.pstmt.executeUpdate();
            }
            response.sendRedirect("Result.jsp");
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            %>
    </body>
</html>
