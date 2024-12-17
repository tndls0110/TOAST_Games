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
    <link rel="stylesheet" href="/resources/css/approval_form.css" />


    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Underscore CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.13.1/underscore-min.js"></script>
    <!-- Backbone CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.4.0/backbone-min.js"></script>
</head>
<body>
<div id = "content_box">
    <div class="form_subject" onclick=""></div>
</div>


<div class = "form_wrapper">
    <form action="approval_write.go" method="POST">
        <input type="hidden" name = "form_idx" id = "form_idx"/>
        <div id = "html_rendering">
        </div>
        <input type="hidden" name = "form_content" id = "form_content"/>
    </form>
    <div id = "button_wrapper">
    </div>
</div>
</body>
<script src="/resources/js/approval_form_row.js"></script>




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
                approval_list_form(data.list);

            },
            error : function (e){
                console.log(e);
            }
        });

    }

    function approval_list_form(datas){
        console.log(datas);

        for(var data of datas){
            console.log(data.form_subject); //분리한 이름 목록에 넣어주기
            console.log(data.form_idx);

            $('#content_box').append('<div class = "form_subject" onclick = "approval_data_form_preview('+ data.form_idx+')">'+data.form_subject+'</div>');
        }
    }

    function approval_data_form_preview(idx){
        console.log("form_idx",idx);
        if(idx!=0){
            $.ajax({
                type : 'GET',
                url : 'approval_form.ajax',
                data : {'form_idx': idx},
                dataType : 'JSON',
                success : function(data){
                    console.log("form의 정보들",data);

                    approval_draw_form_preview(data.form_content,data.form_idx);
                }, error : function (e){
                    console.log(e);
                }

            });
        }else{
            approval_draw_form_preview('',0);
        }
    }

    function approval_draw_form_preview(content,idx){
        var final_form = '';
        //화면 단에 보이는 값 넣기
        $('#html_rendering').html(content);
        console.log("content",content);
        console.log("draw_html",idx);


        //form으로 보낼 값들 넣기

        $('#form_idx').val(idx);

        $('#button_wrapper').html('<div class="choose_form_button">문서 선택</div>');

        // 이벤트 위임을 사용하여 클릭 이벤트 처리
        $('#button_wrapper').on('click', '.choose_form_button', function() {
            final_form = $('#html_rendering').html()

            $('#form_content').val(content);
            $('form').submit();
        });
    }

</script>
</html>