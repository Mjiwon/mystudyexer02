<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="beans.AccountDTO" scope="page"/>
<jsp:setProperty name="dto"  property="*"/>
<%

System.out.println(dto.getName());
System.out.println(dto.getId());
System.out.println(dto.getPass());
System.out.println(dto.getGender());

	/*AccountDao adao = new AccountDao();
	MultipartParser parser = new MultipartParser(request, 1024*1024*100, true, true, "UTF-8");	
	Map data = new HashMap();
	
	
	Part part;
	while((part=parser.readNextPart())!=null){
		if(part.isParam()){
			ParamPart param = (ParamPart)part;
			data.put(param.getName(), param.getValue());
		}
	}
	
	String name = (String)data.get("name");
	String id = (String)data.get("id");
	String pass = (String)data.get("pass");
	
	String ment;
	if(name.contains(" ")||!name.matches("[가-힣]+")||!id.matches("\\w{4,12}")||!pass.matches("\\w{4}")){
		ment = "실패";
	}else{
		if(adao.selectId(id)){
			int n = adao.addNewMember(data);
			if(n==1){
				ment = "성공";
			}else{
				ment ="DB실패";
			}
		}else{
			ment = "중복";
		}
	}*/
	
%>
