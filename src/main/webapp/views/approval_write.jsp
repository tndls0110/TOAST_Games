
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="/resources/richtexteditor/res/style.css" />
  <link rel="stylesheet" href="/resources/richtexteditor/rte_theme_default.css" />
  <script type="text/javascript" src="/resources/richtexteditor/rte.js"></script>
  <script type="text/javascript" src="/resources/richtexteditor/plugins/all_plugins.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
<form action="form_write.do" method="POST">
  <table>
    <tr>
      <td><input type="text" name="subject" placeholder="제목을 입력 하세요!"/></td>
    </tr>
    <tr>
      <td><input type="text" name="user_name" placeholder="작성자 이름"/></td>
    </tr>
    <tr>
      <td><input type="text" name="work_content" placeholder="내용"/></td>
    </tr>
    <tr>
      <td><input type="text" name="user_name" placeholder="첨부파일"/></td>
    </tr>
    <tr>
      <td>
        <div id="div_editor"></div>
        <input type="hidden" name="content" class ="content"/>


      </td>
    </tr>
    <tr>
      <th><input type="button" value="저장" onclick="save()"/><input type="button" value="결재선 선택" onclick="choose_approval()"/></th>
    </tr>
  </table>
</form>
</body>

<script>
  var editor = new RichTextEditor("#div_editor", config);
  window.onload = function initialize(){


    console.log("${form_idx}");
    console.log("${doc_idx}");


    //var doc_idx = "${doc_idx}";
    var form_idx = "${form_idx}";

      $.ajax({
        type : 'get',
        url : 'approval_form.ajax',
        data : {'form_idx': form_idx},
        dataType : 'JSON',
        success : function(data){
          console.log(data);
          console.log(data.form_content);
          editor.setHTMLCode(data.form_content);//편집기 안의 HTML code 설정
          content_edit();
        },
        error : function(e){
          console.log(e);
        }
      });


  }



  //contenteditable = true처리
  function content_edit(){
    console.log('content_edit 함수 실행');
    $('td').attr("contenteditable","true");
  }


  //richtexteditor 상세
  //변수명을 바꾸려고 보니까 3군데에서 사용하고 있음
  var config = {}
  config.toolbar = "default"; //basic은 뭐가 적음, default는 뭐가 많음

  config.editorResizeMode="none";//이런 설정도 해줄 수 있음
  //editor 크기 조절을 안하겠다라는 의미


  //data :image - 이미지를 base64 형태로 문자열화 한 것임
  //장점 : 별도의 파일 처리 없이 파일을 다룰 수 있다(사용이 간단하다.)
  //단점 : 용량 제어가 안되며, 기존 파일보다 용량이 커진다. //일반 파일은 binary라서 01로 이뤄지지만 base64는 16진수기 때문에 16바이트씩 먹을 거임
  //안 써도 비어있는채로 남아있는 것이 있어서 공간 차지가 크다..?
  //DB 저장이 되는 애임 -> 원래는 서버에 저장하고 파일은 그 위치를 저장시킴 -> 근데 이거는 이미지가 DB에 그대로 저장됨
  //이 파일은 용량채로 그냥 넣어버릴 수 있음(기존에는 어떤 경로에 파일이 있어였다면)
  //대신 DB 용량이 너무 커서 감당하기가 어려움

  //editor도 1 뺄 것임

  //파일 업로드 시 설정
  config.file_upload_handler = function(file,pathReplace){ //파일객체, 경로변경 함수
    //js는 모든 변수가 object니까 파일이던 다 담아서 보낼 수 있다?
    console.log(file);

    if(file.size>(2*1024*1024)){
      alert('2MB 이상의 파일은 올릴 수 없습니다.');
      pathReplace('/img/no_image.png');
    }
  }



</script>
</html>
