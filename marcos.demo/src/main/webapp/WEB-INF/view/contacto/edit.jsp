<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<spring:message code="default.edit.label" var="list"
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

			<div id="edit-contacto" role="main">

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
						<spring:message code="default.create.label" arguments="Contacto" />
					</div>
					<div class="panel-body">
					<spring:url value="/contacto/update" var="updateUrl"  />
					<form:form modelAttribute="contacto" action="${updateUrl}" cssClass="form-horizontal">
						<fieldset class="form">
							<jsp:include page="./form.jsp"></jsp:include>
						</fieldset>
						<hr/>					
						<div style='text-align:right'> 

							<button type='submit' name="create" class="btn btn-success">
								<span class="fa fa-download fa-fw"></span>
								<spring:message code="default.button.save.label" arguments="Contacto" />
							</button>
						</div>
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="<spring:url value="/resources/js/jquery-1.12.3.min.js" />"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>

</body>
</html>
