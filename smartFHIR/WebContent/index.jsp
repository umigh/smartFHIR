<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head></head>
<body>
<h1>Patient Health Portal</h1>

<s:form action="login">
	<s:textfield name="email" label="Email"/>
	<s:password name="pwd" label="Password"/>
	<s:submit/>
</s:form>
New User? <a href="user/register.jsp">Register!</a>
</body>
</html>