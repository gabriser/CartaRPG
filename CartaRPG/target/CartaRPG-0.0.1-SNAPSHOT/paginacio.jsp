<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
<style type="text/css">
	
	h1 {
		text-decoration: underline;
		font-size: 50px;
		color: #ffffff;
		padding-bottom: 20px;
	}
	
	h2 {
		font-family: 'Courgette', cursive;
		font-color: black;
		font-size:50px;
	}
	
	p {
		font-size: 20px;
		font-weight: bold;
	}
	
	* {
	    margin: 0px;
	    padding: 0px;
	}
	
	
	body {
		background-image: url(img/background.jpeg);
	}
	
	.m0a {
	  width: 100%;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  overflow: hidden;
	}
	
	div#container {
		margin: 0 auto;
		width: 800px;
		height: 100%;
		background-color: #cf8e00;
		text-align: center;
		border: 5px solid #000000;
		border-radius: 20px;
		padding: 20px 0px;
	}
	
	#contain {
		display: flex;
		flex-wrap: wrap;
		margin: 0 auto;
	}
	
	
	header {
	    padding: 30px 20px;
	    background-color: white;
	    color:black;
	    overflow: auto;
	}
	
	header h1 {
	    float:left;
	    margin-left: 30px;
	}
	
	main {
	    background-color: white;
	    overflow: auto;
	}
	
	footer {
	    background-color: white;
	    color:white;
	    text-align: center;
	    padding: 30px;    
	}
	
	.w50 {
		width: 50%;
	}
	
	.row {
		flex-wrap: flex;
	}
	
	.button {
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  cursor: pointer;
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
	
	a {
		decoration: none;
	}
	
	.card {
	  display: grid;
	  grid-template-columns: 300px;
	  grid-template-rows: 210px 150px 80px;
	  grid-template-areas: "image" "text" "stats";
	  background: white;
	  border: 5px solid black;
	  font-family: roboto;
	  text-align: center;
	}
	
	.card-image {
	  grid-area: image;
	  border-top-left-radius: 15px;
	  border-top-right-radius: 15px;
	  background-size: cover;
	}
	.card-text {
	  grid-area: text;
	  margin: 25px;
	}
	.card-text .date {
	  color: rgb(255, 7, 110);
	  font-size:13px;
	}
	.card-text p {
	  color: grey;
	  font-size:15px;
	  font-weight: 300;
	}
	.card-text h2 {
	  margin-top:0px;
	  font-size:28px;
	}
	.card-stats {
	  grid-area: stats; 
	  display: grid;
	  grid-template-columns: 1fr 1fr 1fr;
	  grid-template-rows: 1fr;
	  background:gray;
	 
	}
	.card-stats .stat {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  flex-direction: column;
	  color: white;
	  padding:10px;
	}
	.card:hover {
	  transform: scale(1.15);
	}
	.card {
	  transition: 0.5s ease;
	  cursor: pointer;
	  margin:30px;
	}

</style>
</head>

<div id="container"><h1 class="titol">Visualitzar cartes</h1>
<br>
<%//  variables per fer la connexio:
	String user="root";
	String password="1234";
	String host="localhost";
	String db = "cartarpg";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	Statement num_registres=null;
	ResultSet rs = null;
	ResultSet num_reg=null;
	int inicio;
	
	//Limito la busqueda
	int TAMANO_PAGINA = 4;

	//examino la página a mostrar y el inicio del registro a mostrar
	String pag = request.getParameter("pagina");
	int pagina=Integer.parseInt(pag);
	if (pagina==0) {
	   	inicio = 0;
	    pagina=1;
	}
	else {
	    inicio = (pagina - 1) * TAMANO_PAGINA;
	}

	/**
	//miro a ver el número total de campos que hay en la tabla con esa búsqueda
**/
Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(url, user, password);
num_registres = conn.createStatement();
//inmediatamente hacemos una consulta sencilla
//creamos la consulta
num_reg = num_registres.executeQuery("SELECT * FROM Carta");
int num_total_registros=0;
while(num_reg.next()) {
	num_total_registros++;
}

//calculo el total de páginas
int total_paginas = (int)Math.ceil(((double)num_total_registros/ TAMANO_PAGINA));

//pongo el número de registros total, el tamaño de página y la página que se muestra

out.print("Nombre de registres trobats:"+num_total_registros+"<br>");
out.print("Es mostren pàgines de "+TAMANO_PAGINA+" registres cadascuna<br>");
out.print("Mostrant la pàgina "+pagina+" de "+total_paginas+"<p><br>");




//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
if (total_paginas > 1){
    for (int i=1;i<=total_paginas;i++){
       if (pagina == i)
          //si muestro el índice de la página actual, no coloco enlace
          out.print(pagina);
       else
          //si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
          out.print(" <a href=paginacio.jsp?pagina="+i+">"+i+"</a> ");
    }
}
out.print("<br><br>");
%> 
	<div class="but1">
		<a href="index.jsp"><button type="button" class="but1">Volver al inicio</button></a>
	</div>
<%
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence="SELECT * from Carta limit "+inicio+","+TAMANO_PAGINA;
	rs = statement.executeQuery(sentence);
	//leemos la consulta
	while(rs.next()) {
	//mostramos los resultados obtenidos
	//out.println(rs.getString("ID_carta"));
	//String nom=request.getParameter("nom");
	out.print(rs.getString("NOM_carta"));%>
	
	<!--
	<br>
	race:<%out.print(rs.getString("RACE_carta")); %><br>
	FUE:<%out.print(rs.getString("FUE_carta")); %><br>
	DES:<%out.print(rs.getString("DES_carta")); %><br>
	CON:<%out.print(rs.getString("CON_carta")); %><br>
	INT:<%out.print(rs.getString("INT_carta")); %><br>
	SAB:<%out.print(rs.getString("SAB_carta")); %><br>
	CAR:<%out.print(rs.getString("CAR_carta")); %><br>
	PV:<%out.print(rs.getString("PV_carta")); %><br>
	<table width="<%out.print(rs.getString("PV_carta")); %>" bgcolor="red"><tr><td></td></tr></table>
	PM:<%out.print(rs.getString("PM_carta")); %><br>
	<table width="<%out.print(rs.getString("PM_carta")); %>" bgcolor="blue"><tr><td></td></tr></table>
	<br>
	<img src="img/<%out.print(rs.getString("PIC_carta")); %>.png" height="100" width="80">
	<br>
	-->

	</div>
	
	<div id="contain">
		<div class="m0a">
		<div class="card">
		  <div class="card-image">
		  	<img src="img/<%out.print(rs.getString("PIC_carta")); %>.png" width="165" height="250">
		  </div>
		  <div class="card-text">
		    <span class="date"><%out.print(rs.getString("RACE_carta")); %></span>
		    <h2><%out.print(rs.getString("NOM_carta")); %></h2>
		    <p>PV:<%out.print(rs.getString("PV_carta")); %><br></p>
		    	<table width="<%out.print(rs.getString("PV_carta")); %>%" bgcolor="green"><tr><td></td></tr></table>
		    	<br>
			<p>PM:<%out.print(rs.getString("PM_carta")); %><br>
			<table width="<%out.print(rs.getString("PM_carta")); %>%" bgcolor="orange"><tr><td></td></tr></table>
			<br>
		    </p>
		  </div>
		  <div class="card-stats">
		    <div class="stat">
		      <div class="value">FUE:<%out.print(rs.getString("FUE_carta")); %></sup></div>
		      <div class="value">DES:<%out.print(rs.getString("DES_carta")); %></sup></div>
		     <!--   <div class="type">read</div>-->
		    </div>
		    <div class="stat border">
		      <div class="value">CON:<%out.print(rs.getString("CON_carta")); %></div>
		       <div class="value">INT:<%out.print(rs.getString("INT_carta")); %></div>
		     <!--  <div class="type">views</div>-->
		    </div>
		    <div class="stat">
		      <div class="value">SAB:<%out.print(rs.getString("SAB_carta")); %></div>
		       <div class="value">CAR:<%out.print(rs.getString("CAR_carta")); %></div></div>
		      <!-- <div class="type">comments</div>-->
		    </div>
		  </div>
		</div>
	</div>
	
<% 
	}
	//cerramos la conexión
	rs.close();
	}catch(SQLException error) {
	out.print("Error de Conexión : "+error.toString());
	}  


	
	%>
