<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<spring:message code="reporte.label.nombre" arguments="${reporte.nombre}" var="nombre" /> 
<title>${nombre}</title>
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
		
			<spring:url value="/" var="urlIndex" />
			<a href="${urlIndex}" class="btn btn-default"> <span
				class="fa fa-home fa-fw"></span> <spring:message
					code="default.home.label" />
			</a>
			
		</div>
		<br />
		<div class="row">

			<div id="reporte-params" role="main">

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
						${nombre}
					</div>
					<div class="panel-body">
					<spring:url value="/reporte/create" var="saveUrl"  />
					<form:form modelAttribute="reporte" action="${saveUrl}" cssClass="form-horizontal">
						<input type="hidden" name="nombreReporte" value="${reporte.nombreReporte}">
<!-- 						<fieldset class="form"> -->
<%-- 							<jsp:include page="./form.jsp"></jsp:include> --%>
<!-- 						</fieldset> -->
<!-- 						<hr/>					 -->
						<div style='text-align:right'> 
							<button type='submit' name="create" class="btn btn-success">
								<span class="fa fa-download fa-fw"></span>
								<spring:message code="default.show.view.head" arguments="Reporte" />
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
