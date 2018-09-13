/**
 * 
 */
var Joinjs = function() {
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
		var check = /^[a-zA-Z]\w{4,12}$/.test(c);
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
		
}