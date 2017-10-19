<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form:hidden path="id"/>

<spring:bind path="nombre">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<spring:message code="contacto.label.nombre" var="nombre" />
		<label class="col-sm-2 control-label">${nombre}</label>
		<div class="col-sm-10">
			<form:input path="nombre" type="text" class="form-control" id="nombre"
				placeholder="${nombre}" />
			<form:errors path="nombre" class="control-label" />
		</div>
	</div>
</spring:bind>

<spring:bind path="apellido">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<spring:message code="contacto.label.apellido" var="apellido" />
		<label class="col-sm-2 control-label">${apellido}</label>
		<div class="col-sm-10">
			<form:input path="apellido" type="text" class="form-control" id="apellido"
				placeholder="${apellido}" />
			<form:errors path="apellido" class="control-label" />
		</div>
	</div>
</spring:bind>

<spring:bind path="email">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<spring:message code="contacto.label.email" var="email" />
		<label class="col-sm-2 control-label">${email}</label>
		<div class="col-sm-10">
			<form:input path="email" type="email" class="form-control" id="email"
				placeholder="${email}" />
			<form:errors path="email" class="control-label" />
		</div>
	</div>
</spring:bind>

<spring:bind path="telefono">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<spring:message code="contacto.label.telefono" var="telefono" />
		<label class="col-sm-2 control-label">${telefono}</label>
		<div class="col-sm-10">
			<form:input path="telefono" type="text" class="form-control" id="telefono"
				placeholder="${telefono}" />
			<form:errors path="telefono" class="control-label" />
		</div>
	</div>
</spring:bind>