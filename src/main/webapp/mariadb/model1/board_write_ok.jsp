<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-06-17
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="simple1.BoardDAO" %>
<%@ page import="simple1.BoardTO" %>

<%
    request.setCharacterEncoding("utf-8");

    BoardTO to = new BoardTO();

    to.setSubject( request.getParameter("subject") );
    to.setWriter(request.getParameter("writer"));

	to.setMail("");
    if (!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")) {
        to.setMail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
    }

    to.setPassword(request.getParameter("password") );
    to.setContent(request.getParameter("content"));
    to.setWip(request.getRemoteAddr());

    // 데이터 소스 얻어오기
    BoardDAO dao = new BoardDAO();
    int flag = dao.boardWriteOk(to);

    out.println("<script type = 'text/javascript'>");
    if (flag == 0 ) {
    	//System.out.println("정상 입력");
    	out.println("alert('글쓰기 성공');");
    	out.println("location.href = './board_list1.jsp';");
    } else {
    	//System.out.println("에러");
    	out.println("alert('글쓰기 실패');");
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
