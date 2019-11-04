<%@ page contentType="text/html"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<!doctype html>
<html lang="ja">

	<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, intial-scale=1, mininum-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Read Text</title>
  </head>
  <body>
		<h1>QRコード読み取りデモ</h1>
		//データベースに接続
		<%
			java.net.URI dbUri = new java.net.URI(System.getenv("DATABASE_URL"));
			String username = dbUri.getUserInfo().split(":")[0];
			String password = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + dbUri.getPath() + ":" + dbUri.getPort();
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
		/%>
	</body>
</html>
