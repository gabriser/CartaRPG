<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
<style type="text/css">
	
	h1 {
		text-decoration: underline;
		font-size: 50px;
		color: #ffffff;
		margin-bottom: 20px;
	}
	
	h2 {
		font-family: 'Courgette', cursive;
		font-color: black;
		font-size:50px;
	}
	
	* {
	    margin: 0px;
	    padding: 0px;
	}
	
	body {
		background-image: url(img/background.jpeg);
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
	
	.m0a {
	  width: 100vw;
	  height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  overflow: hidden;
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
	
	.titol{
		font-size:90px;
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
<body>
<%// variables per fer la connexio:
	 String user="root";
	String password="1234";
	String host="localhost";
	String db = "cartarpg";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	
	// recollim valors formulari:
	String nom=request.getParameter("nom");
	String race=request.getParameter("race");
	String picture=request.getParameter("picture");
	String fue=request.getParameter("fue");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("des");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("con");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("int");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("sab");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("car");
	int ncar=Integer.parseInt(car);
	String pv=request.getParameter("pv");
	int npv=Integer.parseInt(pv);
	String pm=request.getParameter("pm");
	int npm=Integer.parseInt(pm);

try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
int i=statement.executeUpdate("insert into Carta(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"+nom+"','"+picture+"','"+race+"',"+nfue+","+ndes+","+ncon+","+nint+","+sab+","+car+","+pv+","+pm+")");
out.println("Data is successfully inserted!");
}catch(SQLException error) {
out.print("Error de Conexión : "+error.toString());
} %>

	<div id="container">
		<h1>Dades enviades</h1>
		<div class="but1">
			<a href="index.jsp"><button type="button" class="but1">Volver al inicio</button></a>
		</div>
	</div>
	
	<div class="m0a">
		<div class="card">
		  <div class="card-image">
		  	<img src="img/<%out.print(request.getParameter("picture")); %>.png" width="165" height="250">
		  </div>
		  <div class="card-text">
		    <span class="date"><%out.print(request.getParameter("race")); %></span>
		    <h2><%out.print(request.getParameter("nom")); %></h2>
		    <p>PV:<%out.print(request.getParameter("pv")); %><br></p>
		    	<table width="<%out.print(request.getParameter("pv")); %>%" bgcolor="green"><tr><td></td></tr></table>
		    	<br>
			<p>PM:<%out.print(request.getParameter("pm")); %><br>
			<table width="<%out.print(request.getParameter("pm")); %>%" bgcolor="orange"><tr><td></td></tr></table>
			<br>
		    </p>
		  </div>
		  <div class="card-stats">
		    <div class="stat">
		      <div class="value">FUE:<%out.print(request.getParameter("fue")); %></sup></div>
		      <div class="value">DES:<%out.print(request.getParameter("des")); %></sup></div>
		     <!--   <div class="type">read</div>-->
		    </div>
		    <div class="stat border">
		      <div class="value">CON:<%out.print(request.getParameter("con")); %></div>
		       <div class="value">INT:<%out.print(request.getParameter("int")); %></div>
		     <!--  <div class="type">views</div>-->
		    </div>
		    <div class="stat">
		      <div class="value">SAB:<%out.print(request.getParameter("sab")); %></div>
		       <div class="value">CAR:<%out.print(request.getParameter("car")); %></div></div>
		      <!-- <div class="type">comments</div>-->
		    </div>
		  </div>
		</div>
	</div>

</body>
</html>