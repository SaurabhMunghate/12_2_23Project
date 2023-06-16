<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Information Form</title>
</head>
<body>
  <h2>Employee Information Form</h2>
  <form action="submit.jsp" method="post">
    <table>
      <tr>
        <td>First Name:</td>
        <td><input type="text" name="firstName" required></td>
      </tr>
      <tr>
        <td>Last Name:</td>
        <td><input type="text" name="lastName" required></td>
      </tr>
      <tr>
        <td>Email:</td>
        <td><input type="email" name="email" required></td>
      </tr>
      <tr>
        <td>Department:</td>
        <td><input type="text" name="department" required></td>
      </tr>
      <tr>
        <td>Job Title:</td>
        <td><input type="text" name="jobTitle" required></td>
      </tr>
      <tr>
        <td>Employment Type:</td>
        <td>
          <input type="radio" name="employmentType" value="Full-time" required>Full-time
          <input type="radio" name="employmentType" value="Part-time">Part-time
        </td>
      </tr>
      <tr>
        <td>Salary:</td>
        <td><input type="number" name="salary" required></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Submit"></td>
      </tr>
    </table>
  </form>
</body>
</html>
