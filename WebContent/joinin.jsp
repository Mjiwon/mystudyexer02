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
				이름 : <br><input type="text" name="name" style="padding: 5px;" placeholder="이름을 입력해주세요." onchange="checkname(this)">  <br>
				<small><span id="newname"></span></small><br> <br>
				아이디 :<br> <input type="text" name="id" style="padding: 5px;" placeholder="아이디를 입력하세요." onchange="checkid(this)"> <button >중복확인</button>	 <br>
				<small><span id="newid"></span></small><br><br>
				패스워드 :<br> <input type="password" name="pass"style=" padding: 5px;" placeholder="비밀번호입력하세요." onchange="checkpass(this)"> <br>
				<small><span id="newpass1"></span></small><br><br>
				패스워드 재확인 :<br> <input type="password" name="pass1"style=" padding: 5px;" placeholder="비밀번호입력하세요." onkeyup="passcheck(this)"> <br>
				<small><span id="newpass2"></span></small><br><br>
				성별(M/F):<br>
				<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="M" checked/><span style="font-size: 16px; padding: 5px">남성</span>
				<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="F"/><span style="font-size: 16px; padding: 5px">여성</span>
		</div>
	</div>
		<input type="submit" value="회원가입" id="sbt" disabled>
		<a href="<%=application.getContextPath() %>"><button type="button">로  그  인</button></a>
	</form>
	<script>
	var ar = [false,false,false,false];
	var vaild = function() {
		console.log(ar);
		if(ar.includes(false)) {
			document.getElementById("sbt").disabled=true;
		}else {
			document.getElementById("sbt").disabled=false;
		}
	}
	
	var checkid =function(a){
		var c = a.value;
		var check = /^[a-zA-Z]\w{3,11}$/.test(c);
		ar[0] = check;
		if(check){
			var x =document.getElementById("newid");
			x.innerHTML = "일치합니다";
			x.style.color = "blue";
		}else{
			var x =document.getElementById("newid");
			x.innerHTML = "영문,숫자 4~12자 내외";
			x.style.color = "red";
		}
		vaild();
	}
	
	var checkname=function(a){
		var c = a.value;
		var check = /^[가-힇]{1,}$/.test(c);
		ar[1] = check;
		if(check){
			var x =document.getElementById("newname");
			x.innerHTML = "일치합니다";
			x.style.color = "blue";
		}else{
			var x =document.getElementById("newname");
			x.innerHTML = "공백 없이 한글만 설정";
			x.style.color = "red";
		}
		vaild();
	}
	
	var checkpass=function(a){
		var c = a.value;
		var check = /^\w{4,12}$/.test(c);
		ar[2] = check;
		if(check){
			var x =document.getElementById("newpass1");
			x.innerHTML = "일치합니다";
			x.style.color = "blue";
		}else{
			var x =document.getElementById("newpass1");
			x.innerHTML = "4~12자";
			x.style.color = "red";
		}
		vaild();
	}
	
	var passcheck = function(a){
		var p1 = document.getElementsByTagName("input")[2].value;
		var p2 = a.value;
		console.log(p2);
		if(p1==p2){
			var x =document.getElementById("newpass2");
			x.innerHTML = "일치합니다";
			x.style.color = "blue";
			ar[3] = true;
		}else{
			var x =document.getElementById("newpass2");
			x.innerHTML = "비밀번호확인해주세요";
			x.style.color = "red";
			ar[3] = false;
		}
		vaild();
	}
		
	</script>
	
	
<%@ include file="/layout/lower.jspf" %>