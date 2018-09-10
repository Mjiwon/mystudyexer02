<%@ page import="beans.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AccountDao adao = new AccountDao();
	LoginDao ldao = new LoginDao();
	
	
%>
<%@ include file="/layout/top.jspf" %>
<p>
	<img src="<%=application.getContextPath()%>/image/mypagemain.jpg" style="width: 40%; border-radius: 30px;">
</p>

<%@ include file="/layout/lower.jspf" %>