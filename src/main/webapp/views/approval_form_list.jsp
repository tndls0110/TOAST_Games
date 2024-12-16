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

        //화면 단에 보이는 값 넣기
        $('#html_rendering').html(content);
        console.log("content",content);

        //form으로 보낼 값들 넣기
        $('#form_content').val(content);
        $('#form_idx').val(idx);

        $('#button_wrapper').html('<div class="choose_form_button">문서 선택</div>');

        // 이벤트 위임을 사용하여 클릭 이벤트 처리
        $('#button_wrapper').on('click', '.choose_form_button', function() {
            $('form').submit();
        });
    }







    //+버튼 누르면 열 추가
    //append
    var i = 2;
    $('#plus1').on('click',function(){

        console.log("추가버튼");
        var content = '<tr class="copyRow"><td class="BCel center copyRowNo1 dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"><p>'+i+'</p></td><td class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" contenteditable="false"></td><td class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" contenteditable="false"></td><td class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" contenteditable="false"></td><td class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" contenteditable="false"></td><td class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" contenteditable="false"></td></tr>';
        console.log(content);
        $('.copyRow').last().after(content);
        i++;

    });


    //-버튼 누르면 열 삭제

    $('#minus1').on('click',function(){
        console.log("삭제버튼");
        if(i>2){
            $('.copyRow').last().remove();
            i--;
        }
    });





</script>
</html>
