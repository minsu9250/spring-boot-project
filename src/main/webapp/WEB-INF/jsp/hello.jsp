<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="/webjars/jquery-ui/1.11.4/jquery-ui.min.css" />
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.11.4/jquery-ui.min.js"></script>
<script> 
$(function() { 
	$('button').button().on('click', function() { 
		alert('Hello WebJars!!'); 
	}); 
}); 
</script>
</head>
<body>
	<h2>Hello! ${name}</h2>
	<div>JSP version</div>
	
	<button>Hello</button>
</body>
</html>