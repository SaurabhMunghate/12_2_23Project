<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.example._2_23Project.TextFileReader" %>
<%@ page import="com.util.JsonParser" %>
<%@ page import="com.util.JsonReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Text File Data</title>
</head>
<body>
    <ul>
        <%
            try {
            	//JsonParser.call();
            	//JsonReader.JsonDatacall();
                String filePath = "src/main/webapp/textfile.txt";
                List<String> lines = TextFileReader.readTextFile(filePath);

                for (String line : lines) {
                    out.println("<li>" + line + "</li>");
                }
            } catch (IOException e) {
                out.println("Error reading text file: " + e.getMessage());
            }
        %>
    </ul>
</body>
</html>
