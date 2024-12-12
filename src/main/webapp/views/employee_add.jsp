<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="./employeeAdd.do" method="POST">
  <h2>사원 등록</h2>
  
  <!-- 기본 정보 -->
  <label>이름</label>
  <input type="text" name="empl_name" required /><br />
  
  <label>아이디</label>
  <input type="text" name="empl_id" required /><br />
  
  <label>비밀번호</label>
  <input type="password" name="empl_pw" required /><br />
  
  <label>성별</label>
  <input type="radio" name="empl_gender" value="0" /> 남성
  <input type="radio" name="empl_gender" value="1" /> 여성<br />
  
  <label>생년월일</label>
  <input type="date" name="empl_birth" /><br />

  <label>주민등록번호 앞자리</label>
  <input type="text" name="empl_ssn1" maxlength="6" required /><br />

  <label>주민등록번호 뒷자리</label>
  <input type="text" name="empl_ssn2" maxlength="7" required /><br />

  <label>연락처</label><br />
  <label>회사 번호</label>
  <input type="tel" name="empl_cmp_phone" placeholder="예: 010-1234-5678" /><br />
  <label>사원 폰번호</label>
  <input type="tel" name="empl_per_phone" placeholder="예: 010-1234-5678" /><br />
  <label>개인 이메일</label>
  <input type="email" name="empl_per_email" placeholder="예: example@mail.com" /><br />

  <label>회사 이메일</label>
  <input type="email" name="empl_cmp_email" placeholder="예: company@mail.com" /><br />

  <label>입사일</label>
  <input type="date" name="empl_join_date" /><br />

  <label>은행 정보</label><br />
  <label>은행 선택</label>
  <select name="bank_idx">
    <option value="1">은행 A</option>
    <option value="2">은행 B</option>
    <option value="3">은행 C</option>
  </select><br />
  
  <label>계좌번호</label>
  <input type="text" name="empl_account" /><br />

  <label>주소</label>
  <input type="text" name="empl_addr" placeholder="예: 서울시 강남구 삼성동" /><br />

  <button type="submit">제출</button>
</form>
</body>
</html>