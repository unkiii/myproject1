<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Fran Projects</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>$(function () {$('.navbar-toggler').on('click', function(event) {event.preventDefault();$(this).closest('.navbar-minimal').toggleClass('open');})});</script>
	<!-- TOP -->
		<header id="header">
			<div id="logo">
				 <!-- USER MENU LOGIN/REGISTER -->
	      <ul class="list-inline user-menu pull-right">
			 <a href="register.jsp" ><button type="button" class="btn btn-primary">Register</button></a>
	        <a href="login.jsp" ><button type="button" class="btn btn-primary">Login</button></a>
	      </ul>
	 		<br>
			</div>
		</header>
  </head>
  
  
  
<nav class="navbar navbar-fixed-left navbar-minimal animate" role="navigation">
		<div class="navbar-toggler animate">
			<span class="menu-icon"></span>
		</div>
		<ul class="navbar-menu animate">
			<li>
				<a href="#about-us" class="animate">
					<span class="desc animate"> Who We Are </span>
					<span class="glyphicon glyphicon-user"></span>
				</a>
			</li>
			<li>
				<a href="#blog" class="animate">
					<span class="desc animate"> What We Say </span>
					<span class="glyphicon glyphicon-info-sign"></span>
				</a>
			</li>
			<li>
				<a href="#contact-us" class="animate">
					<span class="desc animate"> How To Reach Us </span>
					<span class="glyphicon glyphicon-comment"></span>
				</a>
			</li>
		</ul>
	</nav>
<body>
<!-- Permetre acces nomes si hi ha una sessio -->
<%
	HttpSession sesion=request.getSession(); 
	String nif;
	int permis=0;
	if(sesion.getAttribute("nif") == null){	
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	
	String usuNif = sesion.getAttribute("nif").toString();
	String usuNom = sesion.getAttribute("nomLogin").toString();
	String usuPass = sesion.getAttribute("pass").toString();
	String usuMail = sesion.getAttribute("mail").toString();
	String usuEdad = sesion.getAttribute("edad").toString();
	String usuPoblacion = sesion.getAttribute("poblacion").toString();
	String usuPais = sesion.getAttribute("pais").toString();
	
	
	String sessionID = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();			
		}
	}	
%>