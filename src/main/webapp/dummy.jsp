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
    <%
      File file = new File("/app/tmp\\test.txt");
      BufferedWriter bw = new BufferedWriter(new FileWriter(file));
      bw.write("AAA ?");
      bw.newLine();
      bw.write("BBB !");
      bw.newLine();
      bw.close();

			String path = "/app/tmp";
			File dir = new File(path);
			File file = dir.listFiles();
      String filename = file.toString();
			System.out.println(filename);
		%>
	</body>
</html>
