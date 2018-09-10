<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<p>
	<img src="<%=application.getContextPath()%>/image/firstmain.jpg" style="width: 40%; border-radius: 30px;">

<form action="<%=application.getContextPath() %>/log/logaction.jsp" method = "post">
<div align="center" >	
	<div style="width: 300px; text-align: left; padding: 20px;" >
			아&nbsp;이&nbsp;디&nbsp; : <input type="text" name="id" placeholder="아이디를 입력하세요." style="padding: 5px;">	<br>
			<br>
			패스워드 : <input type="password" name="pass" placeholder="비밀번호입력하세요." style="padding: 5px;"><br>
			자동 로그인 : <input type="checkbox" name="freepass">
	</div>
</div>
	<a href="<%=application.getContextPath() %>/joinin.jsp"><button type="submit" style="height: 60px; width: 100px;">회 원 가 입</button></a>
 	<button type="submit" style="height: 60px; width: 100px;">로  그  인</button>
</form>
	
	
</p>
<%@ include file="/layout/lower.jspf" %>