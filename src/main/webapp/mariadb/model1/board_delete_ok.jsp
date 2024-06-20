<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-06-17
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="simple1.BoardTO" %>
<%@ page import="simple1.BoardDAO" %>
<%
    request.setCharacterEncoding("utf-8");
    BoardTO to = new BoardTO();

    to.setSeq(request.getParameter("seq"));
    to.setPassword(request.getParameter("password"));

    BoardDAO dao = new BoardDAO();
    int flag = dao.boardDeleteOk(to);

    out.println("<script type = 'text/javascript'>");
    if (flag == 0 ) {
        //System.out.println("정상 입력");
        out.println("alert('글삭제 성공');");
        out.println("location.href = './board_list1.jsp';");
    } else if (flag == 1) {
        //System.out.println("에러");
        out.println("alert('비밀번호 오류');");
        out.println("history.back();");
    } else {
        out.println("alert('글삭제 실패');");
        out.println("history.back();");
    }
    out.println("</script>");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
