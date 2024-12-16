<%--
  Created by IntelliJ IDEA.
  User: ryust
  Date: 24. 12. 15.
  Time: 오후 6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<div id = "content_box">

</div>

<div class = "form_wrapper">
    <div id = "html_rendering">
    </div>
    <div id = "button_wrapper">
    </div>
</div>
</body>
<script>
    window.onload = function initialize(){
        $.ajax({
            type : 'GET',
            url : 'approval_form_list.ajax',
            data : {},
            dataType : 'JSON',
            success : function (data){
                console.log(data);
                console.log(data.list);
                draw_list(data.list);

            },
            error : function (e){
                console.log(e);
            }
        });

    }

    function draw_list(datas){

        for(var data of datas){
            console.log(data.form_subject); //분리한 이름 목록에 넣어주기
            $('#content_box').append('<div class = "form_item" onclick = "form_draw(\''+ data.form_subject+'\')">'+data.form_subject+'</div>');
        }
    }

    function form_draw(subject){
        $.ajax({
            type : 'GET',
            url : 'approval_form.ajax',
            data : {'subject': subject},
            dataType : 'JSON',
            success : function(data){
                console.log("form의 정보들",data);

                draw_html(data.form_content,data.form_idx);
            }, error : function (e){
                console.log(e);
            }

        });
    }

    function draw_html(content,idx){

        $('#html_rendering').html(content);
        $('#button_wrapper').html('<div class="choose_form_button">문서 선택</div>');

        // 이벤트 위임을 사용하여 클릭 이벤트 처리
        $('#button_wrapper').on('click', '.choose_form_button', function() {
            form_load(idx);
        });
    }





    function form_load(idx){
        var content = $('#html_rendering').html;
        console.log(content);
        $.ajax({
            type : 'POST',
            url : 'approval_doc_write.ajax',
            data : {'content':content},
            dataType : 'JSON',
            success : function(data){
                console.log(data);

                //다른 페이지로 넘기는 법
                //window.location.href = '/approval_doc_write.go?idx='+idx;
            }, error : function(e){
                console.log(e);
            }
        });
    }

</script>
</html>
