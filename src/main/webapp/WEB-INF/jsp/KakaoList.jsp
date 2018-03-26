<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KAKAO COUPON LIST</title>
<link rel="stylesheet" href="/webjars/jquery-ui/1.11.4/jquery-ui.min.css" />
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.11.4/jquery-ui.min.js"></script>
<script> 
	$(function() { 
        $(".btn").click(function(){
            var email = $("#email").val();
 
            if(email == ""){
                alert("이메일을 입력해주시기 바랍니다.");
                return;
            }
            
            var jsonData = new Object();
            jsonData.email = email;

            var param = JSON.stringify(jsonData);
            
            $.ajax({
                type:"post",
                url:"http://localhost:8080/kakao/list",
                data: param,
                dataType:"json",
                contentType:"application/json",
                success: function(kakaoData){
                    $("#status_tr").eq(0).find("td").eq(0).text(kakaoData.id);
                    $("#status_tr").eq(0).find("td").eq(1).text(kakaoData.email);
                    $("#status_tr").eq(0).find("td").eq(2).text(kakaoData.coupon);
                    $("#status_tr").eq(0).find("td").eq(3).text(kakaoData.regDate);
                },
                error:function(request, error){
                    alert("실패 : " + error);
                    //console.log(error);
                    $("#layer").fadeOut();
                }
            });
        });
        
        $(".btn2").click(function(){
	        $.ajax({
	            type:"get",
	            url:"http://localhost:8080/kakao/list",
	            data: "",
	            dataType:"json",
	            contentType:"application/json",
	            success: function(kakaoData){
	                var k=0;
	                $( "#list > tbody").empty();
	                for(k;k<10;k++){
	                    $("#list > tbody:last").append("<tr id='list_"+k+"'><td></td><td></td><td></td><td></td></tr>");
	                }
	                $.each(kakaoData, function(i, val){
	                    $("#list_"+i).eq(0).find("td").eq(0).text(val.id);
	                    $("#list_"+i).eq(0).find("td").eq(1).text(val.email);
	                    $("#list_"+i).eq(0).find("td").eq(2).text(val.coupon);
	                    $("#list_"+i).eq(0).find("td").eq(3).text(val.regDate);
	                    k=++i;
	                    console.log(val.id);
	                    console.log(val.email);
	                    console.log(val.coupon);
	                    console.log(val.regDate);
	                });        
	
	                if(kakaoData.length > 0){
	                    for(k;k<10;k++){
	                        $("#list_"+k).remove();
	                    }
	                }else{
	                    $("#list > tbody tr").remove();
	                    $("#list > tbody:last").append("<tr><td colspan=4>발급된 정보가 없습니다.</td></tr>");
	                }
	            },
	            error:function(request, error){
	                alert("실패 : " + error);
	                //console.log(error);
	                $("#layer").fadeOut();
	            }
	        });
        });
    });
</script>
</head>
<body>
<input type="text" id="email" value=""/><button class="btn">생성</button><button class="btn2">목록</button>

<div>
    <h2>발급정보</h2>
    <table id="status">
        <colgroup>
            <col width="10%">
            <col width="35%">
            <col width="35%">
            <col width="20%">
        </colgroup>
        <thead>
            <tr>
                <th>순번</th>
                <th>이메일</th>
                <th>쿠폰</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
        	<tr id='status_tr'><td></td><td></td><td></td><td></td></tr>
        </tbody>
    </table>
</div>

<div>
    <h2>발급목록</h2>
    <table id="list">
        <colgroup>
            <col width="10%">
            <col width="35%">
            <col width="35%">
            <col width="20%">
        </colgroup>
        <thead>
            <tr>
                <th>순번</th>
                <th>이메일</th>
                <th>쿠폰</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
</body>
</html>