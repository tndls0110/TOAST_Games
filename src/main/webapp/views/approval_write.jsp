
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">

  <title></title>
  <link rel="stylesheet" href="/resources/css/approval_form.css" />
  <link rel="stylesheet" href="/resources/richtexteditor/res/style.css" />
  <link rel="stylesheet" href="/resources/richtexteditor/rte_theme_default.css" />

  <script src="/resources/js/approval_form_row.js"></script>
  <script type="text/javascript" src="/resources/richtexteditor/rte.js"></script>
  <script type="text/javascript" src="/resources/richtexteditor/plugins/all_plugins.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <!-- Underscore CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.13.1/underscore-min.js"></script>
  <!-- Backbone CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.4.0/backbone-min.js"></script>
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
        <div id = "form_content"></div>
      </td>
    </tr>
    <tr>
      <th><input type="button" value="저장" onclick="save()"/><input type="button" value="결재선 선택" onclick="choose_approval()"/></th>
    </tr>
  </table>
</form>
</body>
<script src="/resources/js/approval_form_row.js"></script>
<script src="/resources/js/approval_form_editable.js"></script>


<script>
  var editor = new RichTextEditor("#div_editor", config);
  window.onload = function initialize(){


    console.log("${form_idx}");
    console.log("${doc_idx}");


    var doc_idx = "${doc_idx}";
    var form_idx = "${form_idx}";

      $.ajax({
        type : 'get',
        url : 'doc_get.ajax',
        data : {'doc_idx': doc_idx},
        dataType : 'JSON',
        success : function(data){
          console.log(data);
          console.log(data.doc_content);
          //editor.setHTMLCode(data.form_content);//편집기 안의 HTML code 설정

          $('#form_content').html(data.doc_content);
          content_edit();
        },
        error : function(e){
          console.log(e);
        }
      });


  }





  //richtexteditor 상세 설정
  var config = {}
  config.toolbar = "default";

  config.editorResizeMode="none";

  //파일 업로드 시 설정
  config.file_upload_handler = function(file,pathReplace){ //파일객체, 경로변경 함수

    console.log(file);

    if(file.size>(2*1024*1024)){
      alert('2MB 이상의 파일은 올릴 수 없습니다.');
      pathReplace('/img/no_image.png');
    }
  }



</script>
</html>
