<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KAKAO COUPON LIST</title>
<link rel="stylesheet" href="/webjars/jquery-ui/1.11.4/jquery-ui.min.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.11.4/jquery-ui.min.js"></script>
<script src="/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script> 
	$(function() { 
		// 쿠폰 생성
	    $("#k_btn").click(function(){
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
	            	//console.log(kakaoData);
	            	
	            	$("#status > tbody tr").remove();
	            	$("#status > tbody:last").append("<tr id='status_tr'><td></td><td></td><td></td><td></td></tr>");
	            	
	                $("#status_tr").eq(0).find("td").eq(0).text(kakaoData.id);
	                $("#status_tr").eq(0).find("td").eq(1).text(kakaoData.email);
	                $("#status_tr").eq(0).find("td").eq(2).text(kakaoData.coupon.substr(0,4)+"-"+kakaoData.coupon.substr(4,4)+"-"+kakaoData.coupon.substr(8,4)+"-"+kakaoData.coupon.substr(12,4));
	                $("#status_tr").eq(0).find("td").eq(3).text(kakaoData.regDate);
	                
	                kakaoList();
	            },
	            error:function(request){
	            	if(request.status == "400"){
						alert(request.responseJSON.message);
					}
					//console.log(request);
	            }
	        });
	    });
	});
	
	// 쿠폰 목록
	function kakaoList(i){
		var param = "?page="+i;
		
		$.ajax({
			type:"get",
			url:"http://localhost:8080/kakao/list" + param,
			dataType:"json",
			contentType:"application/json",
			success: function(kakaoData){
				console.log(kakaoData);
				
				var html;
			    var k=0;
			    $( "#list > tbody").empty();
			    for(k; k<10; k++){
			        $("#list > tbody:last").append("<tr id='list_"+k+"'><td></td><td></td><td></td><td></td></tr>");
			    }
			    $.each(kakaoData.content, function(i, val){
			    	
			        $("#list_"+i).eq(0).find("td").eq(0).text(val.id);
			        $("#list_"+i).eq(0).find("td").eq(1).text(val.email);
			        $("#list_"+i).eq(0).find("td").eq(2).text(val.coupon.substr(0,4)+"-"+val.coupon.substr(4,4)+"-"+val.coupon.substr(8,4)+"-"+val.coupon.substr(12,4));
			        $("#list_"+i).eq(0).find("td").eq(3).text(val.regDate);
			        k=++i;
			    });        
			
			    if(kakaoData.content.length > 0){
			        for(k; k<10; k++){
			            $("#list_"+k).remove();
			        }
			    }else{
			        $("#list > tbody tr").remove();
			        $("#list > tbody:last").append("<tr><td colspan=4>쿠폰 정보가 없습니다.</td></tr>");
			    }
			    
			    $("#page > ul").remove();
			    
				html = "<ul class='pager'>";
			    for(var i=0; i<kakaoData.totalPages; i++){
			    	html += "<li class='next'><button class='btn btn-sm btn-default' onClick='kakaoList("+i+")'>"+(i+1)+"</button></li>"
			    }
			    html += "</ul>";
			    
			    $("#page").append(html);
			},
			error:function(request){
            	if(request.status == "400"){
					alert(request.responseJSON.message);
				}
				//console.log(request);
            }
		});
	}
</script>
</head>
<body>
<div class="container">
	<div class="form-inline">
		<label for="exampleFormControlInput1">Email address</label>
		<input type="text" id="email" class="form-control" placeholder="name@example.com"/>
		<button type="button" id="k_btn" class="btn btn-mb-2 btn-default">확인</button>
	</div>

    <table id="status" class="table table-striped table-bordered table-hover">
    <caption>쿠폰 정보</caption>
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

<div class="container">
    <table id="list" class="table table-striped table-bordered table-hover">
    <caption>쿠폰 목록</caption>
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
    <div class="container">
    	<div id="page"></div>
    </div>
</div>
</body>
</html>