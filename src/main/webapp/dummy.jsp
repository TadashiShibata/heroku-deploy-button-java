<%@ page contentType="text/html;charset=utf-8" import="java.io.*"  %>
<!doctype html>
<html lang="ja">

<head>
	<title>Hello World!</title>
</head>
<body>
<h1>Hello Dummy!</h1>
<%
	BufferedReader bufFileData = new BufferedReader(new FileReader("c:\\dummy.txt"));
	while(bufFileData.ready()){out.println(bufFileData.readLine() + "");
	}
	bufFileData.close();
%>
</body>
</html>
