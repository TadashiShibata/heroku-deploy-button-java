<!doctype html>
<html lang="ja">

<head>
</head>

<body>
<%
	BufferedReader bufFileData =
		new BufferedReader(new FileReader("c:\\dummy.txt"));
	while(bufFileData.ready()){
		out.println(bufFileData.readLine() + "<BR>");
	}
	bufFileData.close();
%>
</body>
</html>
