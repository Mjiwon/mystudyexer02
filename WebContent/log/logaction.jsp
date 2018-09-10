<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String logid = (String)request.getParameter("id");
	String password = (String)request.getParameter("pass");
	System.out.println(password);
	String freepass = (String)request.getParameter("freepass");
	
	AccountDao adao = new AccountDao();
	LoginDao ldao = new LoginDao();

	List<Map> member = adao.getmember(logid);
	System.out.println(member.get(0));
	
	String ment;
	
	if(member == null || !member.get(0).get("PASS").equals(password)){
		ment = "실패";
	}else{
		ment = "성공";
		Set set = (Set)application.getAttribute("users");
		
		set.add(logid);
		
		application.setAttribute("users", set);
		session.setAttribute("auth", true);
		session.setAttribute("id", logid);
		
		if(freepass!=null){
			Cookie c = new Cookie("freepass",logid);
			c.setPath(application.getContextPath());
			c.setMaxAge(60*60);
			response.addCookie(c);
		}
		
		List<Map> log = ldao.selLogData(logid);
		
		System.out.println("이거 들어오니? "+log);
		
		session.setAttribute("info", member);
		
		if(log.size() != 0){
			session.setAttribute("time", log.get(0).get("TIME"));
		}
		
		ldao.addLogingMember(logid);
	}
	
	String uri = (String)session.getAttribute("uri");
	String query = (String)session.getAttribute("query");
	
	String go = uri+(query!=null ? "?"+query : "");
	
%>
<%@ include file="/layout/top.jspf" %>
<%switch(ment) {
case "성공" : 
	String red = uri ==null ? application.getContextPath()+"/mypage/main.jsp" :go;
	response.sendRedirect(red);
	break;
case "실패" :
%>
회원이 아니거나 아이디 또는 비밀번호가 틀리셨습니다<br>	
		아이디 또는 비밀번호를 확인 하세요.<br>
	<a href="<%=application.getContextPath() %>"><button type="submit">로 그 인</button></a>
	<a href="<%=application.getContextPath() %>/joinin.jsp"><button type="submit">회 원 가 입</button></a>
	<%break;
	default :%>
		 이미 로그인이 되어 있습니다.
		 <a href="<%=application.getContextPath() %>"><button type="submit">돌 아 가 기</button></a>
<%} %>

<%@ include file="/layout/lower.jspf" %>