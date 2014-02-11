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
	<c:forEach items="${contacto}" var="contact">
				<tr>
					<td>${contact.nombre},${contact.apellido}</td>
					<td>${contact.email}</td>
					<td>${contact.telefono}</td>
					<td><a href="delete/${contact.id}">Eliminar</a></td>
					<td><a href="update/${contact.id}">Actualizar</a></td>
				</tr>
	</c:forEach>
	
</body>
</html>