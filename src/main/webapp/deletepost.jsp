<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberDAO memberDAO = new MemberDAO();
		MemberVO u = new MemberVO();
		u.setSid(id);
		String filename = memberDAO.getPhotoFilename(id);
		if (filename != null)
			FileUpload.deleteFile(request, filename);
		memberDAO.deleteMember(u);
	}
	response.sendRedirect("posts.jsp");
%>