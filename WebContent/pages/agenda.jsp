<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agenda</title>
<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootstrap/css/sticky-footer-navbar.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=request.getContextPath()%>/">UniMed</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Cadastro <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath()%>/pages/agenda.jsp">Agenda</a></li>
							<li><a href="<%=request.getContextPath()%>/pages/medico.jsp">Médico</a></li>
							<li><a
								href="<%=request.getContextPath()%>/pages/paciente.jsp">Paciente</a></li>
							<li><a
								href="<%=request.getContextPath()%>/pages/usuario.jsp">Usuário</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Início da página -->
	<div class="container">
		<div class="page-header">
			<h2>Agenda</h2>
		</div>
		<form action="PacienteController" method="post">
			<div class="form-group" style="margin-top: 30px;">
				<label for="nome" class="col-sm-2">Paciente: </label>
				<div class="col-sm-10">
					<select name="slPaciente" class="form-control" required>
						<option value="">[Selecione]</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="nome" class="col-sm-2">Médico: </label>
				<div class="col-sm-10">
					<select name="slMedico" class="form-control" required>
						<option value="">[Selecione]</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="nome" class="col-sm-2">Data: </label>
				<div class="col-sm-10">
					<input type="date" name="data" class="form-control"
						value="<c:out value="${agenda.data}" />" required />
				</div>
			</div>
			<div class="form-group">
				<label for="nome" class="col-sm-2">Hora: </label>
				<div class="col-sm-10">
					<input type="time" name="hora" class="form-control"
						value="<c:out value="${agenda.hora}" />" required />
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="form-group" style="margin-top: 10px;">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="Salvar" class="btn btn-primary" /> <input
						type="reset" value="Cancelar" class="btn btn-primary" />
				</div>
			</div>
		</form>
	</div>

	<footer class="footer">
		<div class="container">
			<p class="text-muted">Sistema UniMed - UCSal_2017.1</p>
		</div>
	</footer>

	<!-- Core JS -->
	<script src="<%=request.getContextPath()%>/bootstrap/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>