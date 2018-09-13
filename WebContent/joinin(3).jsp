<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<h2>회 원 가 입</h2>
	<font size="2" >
	<b style="color: red;">참고사항</b><br>
	<ul style="list-style: inside;">
		<li> 아이디는 영문,숫자 4~12자 내외</li>
		<li> 이름은 공백 없이 한글만 설정 &emsp;</li>
		<li> 비밀번호는 4자 이상으로 설정&emsp;</li>   
	</ul>
	</font>
	<form action="<%=application.getContextPath() %>/join/joinaction.jsp" method="post" >
	<div align="center" >	
		<div style="width: 300px; text-align: left; padding: 20px;" >
				이름 : <br><input type="text" name="name" style="padding: 5px;" placeholder="이름을 입력해주세요." onchange="checkname(this);"/>  <br>
				<small><span id="newname"></span></small><br> <br>
				아이디 :<br> <input type="text" name="id" style="padding: 5px;" placeholder="아이디를 입력하세요." onchange="checkid(this);"/> <button >중복확인</button>	 <br>
				<small><span id="newid"></span></small><br><br>
				패스워드 :<br> <input type="password" name="pass"style=" padding: 5px;" placeholder="비밀번호입력하세요." onchange="checkpass(this);"/> <br>
				<small><span id="newpass1"></span></small><br><br>
				패스워드 재확인 :<br> <input type="password" name="pass1"style=" padding: 5px;" placeholder="비밀번호입력하세요." onkeyup="passcheck(this);"/> <br>
				<small><span id="newpass2"></span></small><br><br>
				성별(M/F):<br>
				<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="M" checked/><span style="font-size: 16px; padding: 5px">남성</span>
				<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="F"/><span style="font-size: 16px; padding: 5px">여성</span>
		</div>
	</div>
		<input type="submit" value="회원가입" id="sbt" disabled>
		<a href="<%=application.getContextPath() %>"><button type="button">로  그  인</button></a>
	</form>
	<script src="<%=application.getContextPath()%>/js/joinjs.js"></script>
	<script>
		var c = new Joinjs();
		c.vaild;
		c.checkid(a);
		c.checkname(a);
		c.checkpass(a);
		c.passcheck(a);
		
	</script>
	
	
<%@ include file="/layout/lower.jspf" %>