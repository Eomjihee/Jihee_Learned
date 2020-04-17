<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//JAVA 코드 (back 단 코드 : 서버에서 동작(컴파일) 되는 코드)
	//목적지 주소 (Form action = "Ex14_Login.jsp")
	//클라이언트가 가지고있는 데이터를 받아서 처리할거야
	//아이디랑 패스워드를 받아서.
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("userpwd");
	
	//실제 로그인 처리
	//JDBC 사용 >> DB연결 >> select ...? >>회원인지, 아닌지 판단 >> 클라이언트 응답
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h3>당신이 입력한 데이터</h3>
	ID : <%=userid %> <br /> 
	PWD : <%=pwd %> <br />
</body>
</html>