<%@ page contentType="text/html"
import="java.util.*,java.io.*"
%>
<%
String result = "";
String h_s = "";
FileReader h_fr = new FileReader("https://cornes1861logistics-dev-ed.my.salesforce.com/sfc/p/7F000005D6tk/a/7F0000000nJP/4kB8678dhvtKIr2JtCjqAJ4Szpz8.1vtQUDubN6Fd9g");
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
