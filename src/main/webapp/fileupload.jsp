<%--
  Created by IntelliJ IDEA.
  User: 서하늘
  Date: 2022-11-18
  Time: 오전 1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="javax.servlet.ServletRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
    <title>파일 업로드 결과</title>
</head>
<body>
    <%
        String filename ="";
        int sizeLimit = 15*1024*1024;

        String realPath = request.getSession().getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MultipartRequest multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

        filename = multipartRequest.getFilesystemName("photo");
    %>
    파일명: <%=filename%> <br />
    <img src="${pageContext.request.contextPath}/upload/<%=filename%>">;
</body>
</html>
