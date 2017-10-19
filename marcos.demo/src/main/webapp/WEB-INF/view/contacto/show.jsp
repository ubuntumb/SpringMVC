<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<spring:message code="default.show.view.head" var="list"
	arguments="Contacto" />
<spring:url value="/" var="urlHome" />

<title>${list}</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap.min.css" />"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap.min.css" />"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/dataTables.bootstrap.min.css" />"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap-theme.min.css" />"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/responsive.bootstrap.min.css" />"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/font-awesome/css/font-awesome.min.css" />"
	type="text/css" />
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
		</div>

		<div class='navigation' role='navigation'>
			<spring:url value="/contacto/index" var="urlIndex" />
			<a href="${urlIndex}" class="btn btn-default"> <span
				class="fa fa-home fa-fw"></span> <spring:message
					code="default.home.label" />
			</a>

			<spring:url value="/contacto/create" var="urlCreate" />
			<a class="btn btn-success" href="${urlCreate}"> <span
				class="fa fa-plus fa-fw"></span> <spring:message
					code="default.add.label" arguments="Contacto" />
			</a>

		</div>
		<br />
		<div class="row">

			<div id="show-contacto" role="main">

				<c:if test="${message != null}">
					<div class="alert ${alert} alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<strong>${message}</strong>
					</div>
				</c:if>

				<div class="panel panel-default">
					<div class="panel-heading">
						<spring:message code="default.show.view.head" arguments="Contacto" />
					</div>
					<div class="panel-body">
					
					  <c:if test="${contacto.getId() != null}">
						<div class="row">
							<label class="col-sm-2">ID</label>
							<div class="col-sm-10">${contacto.id}</div>
						</div>
					  </c:if>
					  
					  <c:if test="${contacto.getNombre() != null }">
						<div class="row">
							<label class="col-sm-2"><spring:message code="contacto.label.nombre" var="nombre" /> ${nombre.toUpperCase()}</label>
							<div class="col-sm-10">${contacto.nombre}</div>
						</div>
					  </c:if>
					  
					  <c:if test="${contacto.getApellido() != null}">
						<div class="row">
							<label class="col-sm-2"><spring:message code="contacto.label.apellido" var="apellido" /> ${apellido.toUpperCase()}</label>
							<div class="col-sm-10">${contacto.apellido}</div>
						</div>
					  </c:if>
					  
					  <c:if test="${contacto.getEmail() != null}">
						<div class="row">
							<label class="col-sm-2"> <spring:message code="contacto.label.email" var="email" /> ${email.toUpperCase()}</label>
							<div class="col-sm-10">${contacto.email}</div>
						</div>
					  </c:if>
					  <c:if test="${contacto.getTelefono() != null}">
						<div class="row">
							<label class="col-sm-2"><spring:message code="contacto.label.telefono" var="telefono" />${telefono.toUpperCase()}</label>
							<div class="col-sm-10">${contacto.telefono}</div>
						</div>
					  </c:if>
					</div>
					<div class="panel-footer">
						<div style='text-align:right'> 
						
							<spring:url value="/contacto/edit/${contacto.id}" var="editUrl"></spring:url>
							<a class="btn btn-primary " href="${editUrl}" ><span class="fa fa-edit fa-fw"></span> <spring:message code="default.button.edit.label" /> </a>
							
							<button class="btn btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="deleteInstance('${contacto.id}','${contacto.getClass().getSimpleName()}: ${contacto.nombre}');">
							    <span class="fa fa-trash-o fa-fw"></span> 
							    <spring:message code="default.button.delete.label" />
							</button>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Delete Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						<spring:message code="default.button.delete.label" />
					</h4>
				</div>
				<div class="modal-body">
					<p>
						<spring:message code="default.delete.confirm.part1.message" />
					</p>
					<p>
						<span id="deleteInstanceString"></span>
					</p>
					<p>
						<spring:message code="default.delete.confirm.part2.message" />
					</p>
				</div>
				<div class="modal-footer">
					<form id='deleteform' action="" method="post">
						<input type="hidden" name="_method" value="DELETE" id="_method" />
						<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						<button type="submit" class="btn btn-danger">
							<span class="fa fa-trash-o fa-fw"></span>
							<spring:message code="default.button.delete.label" />
						</button>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->

	</div>

	<script type="text/javascript" src="<spring:url value="/resources/js/jquery-1.12.3.min.js" />"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>

	<script type="text/javascript">

		function deleteInstance(id, instanceStr) {
			var formurl = "${urlHome}contacto/delete/"+id;
			$('#_id').val(id);
			$('#deleteform').attr('action', formurl)
			$('#deleteInstanceString').text(instanceStr)
		}
	</script>

</body>
</html>
