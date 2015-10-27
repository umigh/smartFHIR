<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head></head>
<body>
<h1>Patient Health Portal</h1>

<s:form action="register">
	<s:textfield name="email" label="email" value="email2umi@gmail.com"/>
	<s:password name="pwd" label="Password" value="pwd"/>
	<s:password name="pwdRepeat" label="Repeat Password" value="pwd"/>
	<s:textfield name="firstName" label="First Name" value="Umashankar"/>
	<s:textfield name="lastName" label="Last Name" value="Gaddameedi"/>	
	<s:textfield name="birthDate" label="Birthdate (mm/dd/yyyy)" value="02/11/1974"/>
	<s:radio label="Account type" name="role" list="{'Patient','Health Care Provider'}" value="Patient"/>
	<s:submit align="center"/>
</s:form>

</body>
</html>