<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./public/home/user.css" rel="stylesheet" />
<script src="./public/common/jquery.min.js"></script>
<script src="./public/common/ajaxForm.js"></script>
</head>
<body>
	<div class="box">
	<h1>传智商城 - 欢迎注册</h1>
	<div class="main">
		<div class="register-ad left"><!--广告位--></div>
		<form method="post" action="/?c=user&a=registerExec" id="regForm">
		<table class="register right">
			<tr><th>用户名：</th><td><input type="text" name="username" required /></td></tr>
			<tr><th>密码：</th><td><input type="password" name="password" id="pwd" required /></td></tr>
			<tr><th>确认密码：</th><td><input type="password" id="pwd2" required /></td></tr>
			<tr><th>验证码：</th><td><input type="text" name="captcha" required /></td></tr>
			<tr><td> </td><td><img src="./public/common/captcha.png" id="captcha" title="点击刷新验证码" /></td></tr>
			<tr><td> </td><td><input class="button" type="submit" value="注　册" id="regBtn" /></td></tr>
			<tr><td colspan="2" class="center"><a href="/?c=user&a=login">返回登录</a><a href="/">返回首页</a></td></tr>
		</table>
		</form>
	</div>
</div>
<script>
//验证码点击刷新
$(function(){
	var $img = $("#captcha");
	var src = $img.attr("src")+"&_=";
	$img.click(function(){
		$img.attr("src",src+Math.random());
	});
});
//失去焦点时验证表单
$("#pwd2").blur(function(){
	if($(this).val() !== $("#pwd").val()){
		$(this).addClass('error');
	}else{
		$(this).removeClass('error');
	}
});
//Ajax表单提交
$("#regForm").ajaxForm(function(data){
	//注册失败，刷新验证码
	data.ok || $("#captcha").click();
});
//表单提交时验证表单
$("#regBtn").click(function(){
	if($("#pwd2").val() !== $("#pwd").val()){
		$.showTip("两次输入密码不一致！");
		return false;
	}
});
</script>
</body>
</html>