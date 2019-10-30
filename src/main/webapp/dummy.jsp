<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>テストタイトル</title>
	</head>
	<body>
		<%
			String inputFile = "C:\\Users\\ShibataT\\Documents\\GitHub\\dummy.txt";
			BufferedReader bufFileData =new BufferedReader(new FileReader(inputFile));
			while(bufFileData.ready()){
				out.println(bufFileData.readLine() + "<br>");
			}
			bufFileData.close();
		%>
	</body>
</html>