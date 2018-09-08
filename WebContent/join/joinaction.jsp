<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<%
	AccountDao adao = new AccountDao();
	
	Map data = new HashMap();
	
	String name = (String)request.getParameter("name");
	String id = (String)request.getParameter("id");
	String pass = (String)request.getParameter("pass");
	String gender = (String)request.getParameter("gender");
	
	System.out.println(name+" / " +id+" / " + pass+" / " +gender);
	data.put("name",name);
	data.put("id",id);
	data.put("pass",pass);
	data.put("gender",gender);

	String ment;
	if(name.contains(" ")||!name.matches("[가-힣]+")||!id.matches("\\w{4,12}")||!pass.matches("\\w{4}")){
		ment = "실패";
	}else{
		boolean check = adao.selectId(id);
		System.out.println(check);
		if(check){
			int n = adao.addNewMember(data);
			
			if(n==1){
				ment = "성공";
			}else{
				ment = "DB";
			}
		}else{
			ment = "중복";
		}
	}
	
%>
<%@ include file="/layout/top.jspf" %>
<%switch(ment){ 
case "성공" : 
%>
	<b><%=name %></b> 회원님.<br>
	회원가입에 성공하셨습니다.<br>
	앞으로 많은 이용 부탁드립니다!<br>
	<a href="<%=application.getContextPath()%>/index.jsp"><button type="submit">로그인</button></a>
<%break;
case "실패" : 
%>
	회원가입 시 참고사항을 다시 한번 확인 후 회원가입 해주세요.<br>
	<b style="color: red;">참고사항</b><br>
<ul style="list-style: inside;">
	<li> 아이디는 영문,숫자 4~12자 내외</li>
	<li> 이름은 공백 없이 한글만 설정 &emsp;</li>
	<li> 비밀번호는 4자 이상으로 설정&emsp;</li>   
</ul>
	 <a href="<%=application.getContextPath() %>/joinin.jsp"><button type="submit">돌 아 가 기</button></a>
<%break;
case "중복" : 
%>
입력하신 <b><%=id %></b> 존재하는 ID 입니다.<br>
다른 아이디를 이용해주세요<br>
<a href="<%=application.getContextPath() %>/joinin.jsp"><button type="submit">돌 아 가 기</button></a>
<%break;
case "DB" :
%>
죄송합니다 지금 서비스 장애로 회원가입이 되지 않았습니다 <br>
잠시 후 다시 해주시기 바랍니다<br>
<a href="<%=application.getContextPath()%>/index.jsp"><button type="submit">홈페이지이동</button></a>
<%} %>


<%@ include file="/layout/lower.jspf" %>