<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map> info = (List<Map>)session.getAttribute("info");
	System.out.println(info);
%>
<%@ include file="/layout/top.jspf" %>
	<h2>My Page</h2>
	<p>
		이름 : 
	</p>
<%@ include file="/layout/lower.jspf"%>