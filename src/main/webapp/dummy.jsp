<%@ page contentType="text/html" import="java.util.*,java.io.*" %>
<%
	String inputFile = "C:\\Users\\ShibataT\\Documents\\GitHub\\dummy.txt";
	BufferedReader bufFileData =new BufferedReader(new FileReader(inputfile));
	while(bufFileData.ready()){
		out.println(bufFileData.readLine() + "<br>");
	}
	bufFileData.close();
%>