<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RPG Card Generator</title>
<style type="text/css">
	
	* {
		margin: 0px;
    	padding: 0px;
	}
	
	body {
		background-image: url(img/background.jpeg);
	}
	
	h1 {
		text-decoration: underline;
		font-size: 50px;
		color: #ffffff;
		padding-bottom: 20px;
	}
	
	div {
		margin: 0 auto;
	}
	
	.w50 {
    	width: 50%;
	}
	
	.row {
    	display: flex;
    	margin: 0 auto;
    	flex-wrap: wrap;
    	width: 100%;
	}
	
	div#container {
		margin: 0 auto;
		width: 800px;
		height: auto;
		background-color: #cf8e00;
		text-align: center;
		border: 5px solid #000000;
		border-radius: 20px;
		padding: 20px 0px;
	}
	
	div#but1 {
		text-align: center;
		width: 50%;
	}
	
	button.but1 {
		background-color: aqua;
		width: 200px;
		height: 50px;
		border-radius: 10px;
	}
	
	div#but2 {
		text-align: center;
		width: 50%;
	}
	
	button.but2 {
		background-color: green;
		width: 200px;
		height: 50px;
		border-radius: 10px;
	}
	
	div#imgb img {
		padding-top: 20px;
		border-radius: 20px;
		height: 300px;
	}
	
</style>
</head>
<body>

	<div id="container">
		<h1>RPG Card Generator</h1>
		
		<div class="row">
			<div class="but1">
				<a href="paginacio.jsp?pagina=1"><button type="button" class="but1">Ver todas las cartas</button></a>	
			</div>
			<div class="but2">
				<a href="CartaRPG.jsp"><button type="button" class="but2">Generar una nueva carta</button></a>
			</div>
		</div>
		<div id="imgb">
			<img src="img/3.png" title="RPG Card" alt="RPG Card" />
		</div>
	</div>

</body>
</html>