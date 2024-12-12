<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/employeeAdd" method="POST">
이름<input type="text" name="empl_name"/>
아이디<input type="text" name="empl_id"/>
비번<input type="text" name="empl_pw"/>
<label>
    <input type="radio" name="empl_gender" value="male" />
    남성
  </label>
  <label>
    <input type="radio" name="empl_gender" value="female" />
    여성
  </label>
  
</form>
</body>
</html>