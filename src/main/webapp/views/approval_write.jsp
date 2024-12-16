
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">

  <link rel="stylesheet" href="/richtexteditor/res/style.css" />
  <link rel="stylesheet" href="/richtexteditor/rte_theme_default.css" />
  <link rel="stylesheet" href="/richtexteditor/runtime/richtexteditor_content.css">

  <script type="text/javascript" src="/richtexteditor/rte.js"></script>
  <script type="text/javascript" src="/richtexteditor/plugins/all_plugins.js"></script>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<form action="write.do" method="POST">
  <table>
    <tr>
      <td><input type="text" name="subject" placeholder="제목을 입력 하세요!"/></td>
    </tr>
    <tr>
      <td><input type="text" name="user_name" placeholder="작성자 이름"/></td>
    </tr>
    <tr>
      <td>
        <div id="div_editor"></div>
        <input type="text" name="content"/> <!-- hidden -->
      </td>
    </tr>
    <tr>
      <th><input type="button" value="저장" onclick="save()"/></th>
    </tr>
  </table>
</form>
</body>

<script>
  var editor = new RichTextEditor("#div_editor", config);
  window.onload = function initialize(){


    $.ajax({
      type : 'get',
      url : 'form_get.ajax',
      data : {'idx': 1},
      dataType : 'JSON',
      success : function(data){
        console.log(data);
        for (var d of Object.keys(data)){
          console.log(d);
          console.log(data[d]);

          editor.setHTMLCode(data[d]);//편집기 안의 HTML code 설정

        }

      },
      error : function(e){
        console.log(e);
      }


    });


  }

  var config = {}
  config.toolbar = "default";

  config.editorResizeMode="none";
  //editor 크기 조절을 안하겠다라는 의미

  config.file_upload_handler = function(file,pathReplace){
    console.log(file);

    if(file.size>(2*1024*1024)){
      alert('2MB 이상의 파일은 올릴 수 없습니다.');
      pathReplace('/img/no_image.png');
    }
  }




</script>
</html>
