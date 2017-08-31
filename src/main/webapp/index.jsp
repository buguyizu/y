<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script src='./dwr/engine.js'></script>
<script src='./dwr/util.js'></script>
<script src='./dwr/interface/DWRUserAccess.js'></script>
</head>
<body>
	<B>用户注册1122</B>
	<br>
	<form name="regForm">
		登陆ID：<input type="text" name="id"><br>
		口 令：<input type="password" name="password"><br>
		姓 名：<input	type="text" name="name"><br>
		电子邮件：<input type="text" name="email"><br>
		<input type="button" name="submitBtn" value="提交" onclick="OnSave()"><br>
	</form>
	<br>
	<B>用户查询</B>
	<Br>
	<form name="queryForm">
		登陆ID：<input type="text" name="id"><br>
		<input type="button" name="submitBtn" value="提交" onclick="OnFind()"><br>
	</form>
	<br>
</body>
</html>

<%
//System.out.println(request.getSession().getId());
Date date = new Date();
SimpleDateFormat df = new SimpleDateFormat("mm:ss.SSS");
String s = df.format(date) + ":  " + request.getSession().getId();


System.out.println(s);
//Logger.getGlobal().info(s);
%>

<SCRIPT LANGUAGE="JavaScript">
	function saveFun(data) {
		if (data) {
			alert("注册成功！");
		} else {
			alert("登陆ID已经存在！");
		}
	}

	function OnSave() {
		var userMap = {};
		userMap.id = regForm.id.value;
		userMap.password = regForm.password.value;
		userMap.name = regForm.name.value;
		userMap.email = regForm.email.value;
		DWRUserAccess.save(userMap, saveFun);
	}

	function findFun(data) {
		if (data == null) {
			alert("无法找到用户：" + queryForm.id.value);
			return;
		}

		alert("找到用户，nid：" + data.id + "，npassword：" + data.password + "，nname："
				+ data.name + "，nemail：" + data.email);

	}

	function OnFind() {
		DWRUserAccess.find(queryForm.id.value, findFun);


	}
</SCRIPT>