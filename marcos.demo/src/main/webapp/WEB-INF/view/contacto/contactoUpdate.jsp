<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Spring 3 MVC Series - Contacto</title>
<style type="text/css">
* {
    margin: 0;
    padding: 1;
}
body {
	font-family: sans-serif;
	margin-top: 20px;
    min-width: 900px;
}

.data,.data td {
	border-collapse: collapse;
	width: 80%;
	border: 1px solid #aaa;
	margin: 2px;
	padding: 2px;
}

.data th {
	font-weight: bold;
	background-color: #5C82FF;
	color: white;
}
</style>
</head>
<body bgcolor="lightblue">
	<h2>
		<spring:message code="label.title" />
	</h2>
	<form:form method="post" action="/update/" commandName="lista">
		<table style="border-collapse: collapse;" align="center"  border="1" bordercolor="#006699" width="40" >
			<tr>
				<td><form:label path="id">
						ID
					</form:label></td>
				<td><form:input path="id" readonly="true"/></td>
			</tr>
			<tr>
				<td><form:label path="nombre">
						<spring:message code="label.nombre" />
					</form:label></td>
				<td><form:input path="nombre"/></td>
			</tr>
			<tr>
				<td><form:label path="apellido">
						<spring:message code="label.apellido" />
					</form:label></td>
				<td><form:input path="apellido" /></td>
			</tr>
			<tr>
				<td><form:label path="email">
						<spring:message code="label.email" />
					</form:label></td>
				<td width="100"><form:input path="email" /></td>
			</tr>
			<tr>
				<td><form:label path="telefono">
						<spring:message code="label.telefono" />
					</form:label></td>
				<td><form:input path="telefono" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Guardar" />
				</td>
				<td>
					<a href="/marcos.demo/">Volver</a>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>