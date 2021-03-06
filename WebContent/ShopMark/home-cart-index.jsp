<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./public/home/style.css" />
<script src="./public/common/jquery.min.js"></script>
<script src="./public/common/ajaxForm.js"></script>
</head>
<body>
<div class="top">
	<div class="top-nav">
	<ul><li>收藏本站</li><li>关注本站</li></ul>
	<ul class="right">
				<li>测试用户，欢迎来到传智商城！[<a href="/?c=user&a=logout">退出</a>]<li>
				<li class="line">|</li><li><a href="/?c=order">我的订单</a></li>
		<li class="line">|</li><li><a href="/?c=user">会员中心</a></li>
		<li class="line">|</li><li><a href="/?c=cart">我的购物车</a></li>
		<li class="line">|</li><li>联系客服</li>
	</ul>
	</div>
</div>
<div class="box">
	<div class="header">
		<a class="left" href="/"><div class="logo"></div></a>
		<div class="search left">
			<input type="text" class="left" />
			<input class="search-btn" type="button" value="搜索" />
			<p class="search-hot">热门搜索：PHP培训　专业教材　智能手机　平板电脑</p>
		</div>
		<div class="info left">
			<input type="button" value="会员中心" onclick="location.href='?c=user'" />
			<input type="button" value="去购物车结算" onclick="location.href='?c=cart'" />
		</div>
	</div>
	<div class="nav">
		<ul><li id="index_find"><a class="category" href="/?a=find">全部商品分类</a></li><li id="index_index"><a href="/">首页</a></li>
			<li><a href="#">特色购物</a></li><li><a href="#">优惠促销</a></li><li><a href="#">限时秒杀</a></li>
			<li><a href="#">品牌专区</a></li><li><a href="#">服务中心</a></li>
		</ul>
	</div><div class="usercenter">
	<div class="menu">
	<div class="menu-photo">
		<img src="./public/home/images/avatar.png" alt="用户头像" />
	</div>
	<dl><dt>我的交易</dt>
		<dd><a href="/?c=cart">我的购物车</a></dd>
		<dd><a href="/?c=order">我的订单</a></dd>
		<dd>评价管理</dd>
	</dl>
	<dl><dt>我的账户</dt>
		<dd><a href="/?c=user">个人资料</a></dd>
		<dd>密码修改</dd>
		<dd><a href="/?c=user&a=addr">收货地址</a></dd>
	</dl>
</div>	<div class="content">
		<div class="title">我的购物车</div>
		<table class="shopcart">
			<tr><th width="60"><a href="#" class="checkAll">全选</a></th>
			<th>商品</th><th width="150">单价(元)</th><th width="95">数量</th><th width="120">操作</th></tr>
						<tr class="item">
				<td class="center"><input type="checkbox" class="check" value="9" /></td>
				<td><a href="/?a=goods&id=9" target="_blank" class="bold">PHP网站开发实例教程</a></td>
				<td class="center"><span class="item-price">45.00</span></td>
				<td class="center">
					<button class="setNum">-</button><input class="item-num" type="text" value="1" /><button class="setNum">+</button>
				</td>
				<td class="center"><a href="#" data-id="4" class="del" />删除</a></td>
			</tr>
						<tr class="item">
				<td class="center"><input type="checkbox" class="check" value="3" /></td>
				<td><a href="/?a=goods&id=3" target="_blank" class="bold">MySQL数据库入门</a></td>
				<td class="center"><span class="item-price">39.50</span></td>
				<td class="center">
					<button class="setNum">-</button><input class="item-num" type="text" value="2" /><button class="setNum">+</button>
				</td>
				<td class="center"><a href="#" data-id="5" class="del" />删除</a></td>
			</tr>
						<tr class="item">
				<td class="center"><input type="checkbox" class="check" value="5" /></td>
				<td><a href="/?a=goods&id=5" target="_blank" class="bold">HTML+CSS+JavaScript网页制作案例教程</a></td>
				<td class="center"><span class="item-price">49.80</span></td>
				<td class="center">
					<button class="setNum">-</button><input class="item-num" type="text" value="1" /><button class="setNum">+</button>
				</td>
				<td class="center"><a href="#" data-id="6" class="del" />删除</a></td>
			</tr>
						<tr class="act"><td class="center"><a href="#" class="checkAll">全选</a></td>
			<td colspan="4">
				共<span id="num"></span>件商品 总计：<span class="price">￥<span id="monery"></span></span>
				<input type="submit" value="提交订单" class="order-btn" />
			</td></tr>
		</table>
	</div>
</div>
<script>
(function(){
	var $check = $(".check");  //获取复选框对象
	var isCheckAll = false;    //当前是否全选
	$check.click(total);	   //单击复选框时更新总价格
	checkAll();				   //默认设为全选
	//全选、全不选
	$(".checkAll").click(checkAll);
	function checkAll(){
		isCheckAll = isCheckAll ? false : true;
		$check.prop("checked", isCheckAll);
		$check.attr("checked", isCheckAll);
		total();  //更新价格
	}
	//单击修改数量
	$(".setNum").click(function(){
		var $item = $(this).parent().find(".item-num");
		var act = $(this).text();
		var num = parseInt($item.val());
		var stock = 100;
		if (act === '-') {
			if (num === 1) return false;
			$item.val(num-1);
		}else if (act === '+') {
			if (num === stock) return false;
			$item.val(num+1);
		}
		total();
		return false;
	});
	//键盘修改数量
	$(".item-num").keyup(function(){
		var num = parseInt($(this).val());
		var stock = 100;
		if(num < 1){
			$(this).val(1);
		}else if(num > stock){
			$(this).val(stock);
		}
		total();
	});
	//计算总价
	function total() {
		var count = 0; //总数量
		var total = 0; //总价格
		//遍历勾选的商品
		$(".check:checked").each(function(){
			var $item = $(this).parents(".item");
			var price = parseFloat($item.find(".item-price").text());
			var num = parseInt($item.find(".item-num").val());
			count += num;
			total += price * num;
		});
		$("#monery").text(total.toFixed(2));
		$("#num").text(count);
	}
	//从购物车删除
	$(".del").ajaxButton("/?c=cart&a=delExec",function(){
		return {"id":$(this).attr('data-id')};
	},function(data){
		data.ok && location.reload();
	});
	//提交订单
	$(".order-btn").ajaxButton("/?c=order&a=addExec",function(){
		//通过JSON保存用户选择的商品和购买数量
		var data = [];
		//遍历勾选的商品
		$(".check:checked").each(function(){
			var $item = $(this).parents(".item");
			data.push({
				"id" : $(this).val(),
				"num" : parseInt($item.find(".item-num").val())
			});
		});
		return {"buy":data};
	});
})();
</script>
	<div class="service">
		<ul><li>购物指南</li><li>配送方式</li><li>支付方式</li>
			<li>售后服务</li><li>特色服务</li><li>网络服务</li>
		</ul>
	</div>
	<div class="footer">传智商城·本项目仅供学习使用</div>
</div>
<script>
//激活链接
$("#cart_index").addClass("curr");
</script>
</body>
</html>