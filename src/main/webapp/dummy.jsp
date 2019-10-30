<%@ page contentType="text/html" import="java.util.*,java.io.*" %>
<%
	BufferedReader bufFileData =new BufferedReader(new FileReader("C:\\Users\\ShibataT\\Documents\\GitHub\\dummy.txt"));
	while(bufFileData.ready()){
		out.println(bufFileData.readLine() + "<BR>");
	}
	bufFileData.close();
%>