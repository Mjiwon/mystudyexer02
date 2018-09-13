<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="beans.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AccountDao adao = new AccountDao();
	LoginDao ldao = new LoginDao();
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
	Date time = (Date)session.getAttribute("time");
	
%>
<%@ include file="/layout/top.jspf" %>
<p align="right">
	<small>최근 접속 시간 : <%=time!=null? sdf.format(time):"-"%></small><br>
	<button>쪽지함</button>
	<button>게시판</button>
	<a href="<%=application.getContextPath()%>/mypage/mypage.jsp"><button>Mypage</button></a>
	<a href="<%=application.getContextPath()%>/log/logoutaction.jsp"><button>로그아웃</button></a>
</p>
<p>
	<img src="<%=application.getContextPath()%>/image/mypagemain.jpg" style="width: 40%; border-radius: 30px;">
</p>

<%@ include file="/layout/lower.jspf" %>