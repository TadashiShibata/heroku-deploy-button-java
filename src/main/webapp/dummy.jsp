<%@ page contentType="text/html"
import="java.util.*,java.io.*"
%>
<%
String result = "";
String h_s = "";
FileReader h_fr = new FileReader(application.getRealPath("dummy.txt"));
BufferedReader h_br = new BufferedReader(h_fr);
while(true){
h_s = h_br.readLine();
if (h_s == null){
break;
}
result = result + h_s;
}
%>

<%= result %>
