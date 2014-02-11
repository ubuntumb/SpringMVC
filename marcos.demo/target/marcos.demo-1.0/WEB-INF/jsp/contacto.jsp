<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Spring 3 MVC Series - Contacto</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
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
<body>
	<h2>
		<spring:message code="label.title" />
	</h2>
	<form:form method="post" action="add.html" commandName="contacto">
		<table>
			<tr>
				<td><form:label path="nombre">
						<spring:message code="label.nombre" />
					</form:label></td>
				<td><form:input path="nombre" /></td>
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
				<td><form:input path="email" /></td>
			</tr>
			<tr>
				<td><form:label path="telefono">
						<spring:message code="label.telefono" />
					</form:label></td>
				<td><form:input path="telefono" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					value="<spring:message code="label.addcontact"/>" /></td>
			</tr>
		</table>
	</form:form>
	<h3>Contactos</h3>
	<c:if test="${!empty contactoList}">
		<table class="data">
			<tr>
				<th><spring:message code="label.nombre" /></th>
				<th><spring:message code="label.email" /></th>
				<th><spring:message code="label.telefono" /></th>
				<th>&nbsp;</th>
			</tr>
			<c:forEach items="${contactoList}" var="contacto">
				<tr>
					<td>${contacto.nombre},${contacto.apellido}</td>
					<td>${contacto.email}</td>
					<td>${contacto.telefono}</td>
					<td><a href="delete/${contacto.id}">Eliminar</a></td>
					<td><a href="update/${contacto.id}">Actualizar</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>