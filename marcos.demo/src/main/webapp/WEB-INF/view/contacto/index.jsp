<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<spring:message code="default.list.label" var="list"
	arguments="Contactos" />
<spring:url value="/" var="urlHome" />

<title>${list}</title>
<link rel="stylesheet" 	href="<spring:url value="/resources/css/bootstrap.min.css" />" type="text/css" />
<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css" />" type="text/css" />
<link rel="stylesheet" href="<spring:url value="/resources/css/dataTables.bootstrap.min.css" />" type="text/css" />
<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap-theme.min.css" />" type="text/css" />
<link rel="stylesheet" href="<spring:url value="/resources/css/responsive.bootstrap.min.css" />" type="text/css" />
<link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome/css/font-awesome.min.css" />" type="text/css" />
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
				class="fa fa-plus fa-fw"></span> <spring:message code="default.add.label" arguments="Contacto" />
			</a>

		</div>
		<br />
		<div class="row">

			<div id="list-contacto" role="main">

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
						<spring:message code="default.list.label" arguments="Contactos" />
					</div>
					<div class="panel-body">
							<table class=" table-responsive table table-striped table-bordered table-hover"
								id="data-table-list">
								<thead>
									<tr>
										<th><spring:message code="contacto.label.nombre" /></th>
										<th><spring:message code="contacto.label.apellido" /></th>
										<th><spring:message code="contacto.label.email" /></th>
										<th><spring:message code="contacto.label.telefono" /></th>
										<th><spring:message code="default.list.actions.label" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${contactos}" var="contacto" varStatus="i">
										<c:choose>
											<c:when test="${i.index  % 2 == 0 }">
												<tr class="even">
											</c:when>
											<c:otherwise>
												<tr class="odd">
											</c:otherwise>
										</c:choose>
										<td>${contacto.getNombre()}</td>
										<td>${contacto.getApellido()}</td>
										<td>${contacto.getEmail()}</td>
										<td>${contacto.getTelefono()}</td>
										<td>
											<div class="btn-group">
												<spring:url value="/contacto/show/${contacto.id}" var="showUrl" />
												<a class="btn btn-default btn-xs" href="${showUrl}">
													<spring:message code="default.show.view.label" /> 
												</a>
												<button type="button"
													class="btn btn-default dropdown-toggle btn-xs"
													data-toggle="dropdown">
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu pull-right" role="menu">
													<li><a class="link"
														href="${showUrl}"><span
															class="fa fa-angle-double-right fa-fw"></span> <spring:message
																code="default.show.view.label"></spring:message> </a>
													</li>
													<li><spring:url value="/contacto/edit/${contacto.id}" var="editUrl" />
														<a class="link" href="${editUrl}"><span class="fa fa-edit fa-fw"></span>
															<spring:message code="default.button.edit.label" /> 
														</a>
													</li>
													<li>
														<a href="#" class="link"
															onClick="deleteInstance('${contacto.id}','${contacto.getClass().getSimpleName()}: ${contacto.nombre}');"
															data-toggle="modal" data-target="#deleteModal" > <span
															class="fa fa-trash-o fa-fw"></span> Eliminar
													</a></li>
												</ul>
											</div>
										</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
						<input type="hidden" name="_id" value="" id="_id" />
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
	<script type="text/javascript" src="<spring:url value="/resources/js/dataTables.bootstrap.min.js" />"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/responsive.bootstrap.min.js" /> "></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#data-table-list')
									.DataTable(
											{
												"language" : {
													"url" : "<spring:url value="resources/js/dataTables.spanish.lang" />"
												},
												scrollY: 400
											});
						});

		function deleteInstance(id, instanceStr) {
			var formurl = "${urlHome}contacto/delete/"+id;
			$('#deleteform').attr('action', formurl)
			$('#deleteInstanceString').text(instanceStr)
		}
	</script>

</body>
</html>
