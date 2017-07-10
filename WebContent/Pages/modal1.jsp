<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset='utf-8'>
<head>
<title>Ventana Modal con solo CSS</title>
<style type="text/css">

	#popup {
		visibility: hidden;
		opacity: 0;
		margin-top: -100px;
	}
	#popup:target {
		visibility:visible;
		opacity: 1;
		background-color: rgba(0,0,0,0.8);
		position: fixed;
		top:0;
		left:0;
		right:0;
		bottom:0;
		margin:0;
		z-index: 999;
		-webkit-transition:all 1s;
		-moz-transition:all 1s;
		transition:all 1s;
	}
	.popup-contenedor {
		position: relative;
		margin:7% auto;
		padding:30px 50px;
		background-color: #fafafa;
		color:#333;
		border-radius: 3px;
		width:70%;
		height:70%;
	}
	a.popup-cerrar {
		position: absolute;
		top:3px;
		right:3px;
		background-color: #333;
		padding:7px 10px;
		font-size: 20px;
		text-decoration: none;
		line-height: 1;
		color:#fff;
	}
 
    /* estilos para el enlace */
    
	a.popup-link {
	    text-align: center;
	    display: block;
	    margin: 30px 0;
	}

</style>
</head>
<body>

    <a href="#popup" class="popup-link">Ver modal</a>

	<div class="modal-wrapper" id="popup">
		<div class="popup-contenedor">
			
			<h2>Acabat - Hibernate - Servlet - CRUD</h2>
			<p>

			<div class="w3-container w3-red">
			  <h1>Projecte 1</h1>
			</div>
			
			<img src="../img/logos.png" alt="eeeee" style="width:100%">
			
			<div class="w3-container">
			  <p>Projecte que gestiona l'informació de les persones/usuaris que tenim a la base de dades.</p>
			</div>
			
			<div class="w3-container w3-red">
			  <h5>Peu moda</h5>
			</div>
			
			
			
			
			
			</p>
			
			<a class="popup-cerrar" href="#">-X-</a>
			
		</div>
	</div>
</body>
</html>