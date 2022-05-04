<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
<style>
	
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
	
	div#tab {
		margin-left: 200px;
	}
	
	table {
		background-color: #ffffff;
		border-radius: 10px;
	}
	
	input.envia {
		background-color: aqua;
		width: 200px;
		height: 50px;
		border-radius: 10px;
		margin-top: 20px;
	}
	
	button {
		margin-top: 20px;
		background-color: green;
		width: 200px;
		height: 50px;
		border-radius: 10px;
	}
	
	table.porcen {
		background-color: red;
	}
	
</style>
</head>
<body>
	<%!public int getValue() {
		int value = 0;
		int[] daus = {0,0,0,0};
		for (int i=0; i<4; i++) {
			daus[i] = (int) (Math.random() * 6 + 1);
		}
		;
		Arrays.sort(daus);
		
		for (int i=0; i<daus.length; i++) {
			value = daus[i] + value;
		}
		return value;
	}
	
	
	
	public int modFUE(int a) {
		int mod=0;
		switch (a) {
		case 0:
		case 1:break;
		case 2: mod=-2;break;
		case 3: mod=-2;break;
		case 4: mod=+2;break;
			default: break;
		}
		return mod;
	}
	
	public int modDES(int a) {
		int mod=0;
		switch (a) {
		case 0:mod=+2;break;
		case 1:
		case 2: break;
		case 3: mod=+2;break;
		case 4: break;
			default: break;
		}
		return mod;
	}
	
	public int modCON(int a) {
		int mod=0;
		switch (a) {
		case 0:mod=-2;break;
		case 1:mod=+2;break;
		case 2:mod=+2;break;
		case 3:
		case 4:break;
			default:break;
		}
		return mod;
	}
	
	public int modINT(int a) {
		int mod=0;
		switch (a) {
		case 0:mod=+2;break;
		case 1:
		case 2:
		case 3:break;
		case 4:mod=-2;break;
			default:break;
		}
		return mod;
	}
	
	public int modSAB(int a) {
		int mod=0;
		switch (a) {
		case 0:break;
		case 1:mod=+2;break;
		case 2:
		case 3:
		case 4:break;
			default:break;
		}
		return mod;
	}
	
	public int modCAR(int a) {
		int mod=0;
		switch (a) {
		case 0:break;
		case 1:mod=-2;break;
		case 2:mod=+2;break;
		case 3:break;
		case 4:mod=+2;break;
			default:break;
		}
		return mod;
	}
	
	%>
	
	<%
	String[] race={"Elfs","Nans","Gnoms","Mitjans","Semiorcs","Humans"};
	String[] race_picture={"0","1","2","3","4","5"};
	int race_random=(int) (Math.random()*race.length);
	//int racepic_random=(int) (Math.random()*race_picture.length);
	/*int a = (int) (Math.random()*race.length);
	int b = (int) (Math.random()*race.length);
	int c = (int) (Math.random()*race.length);
	int d = (int) (Math.random()*race.length);*/
	%>
	
	<div id="container">
		<h1>Formulari creació carta</h1>
		<form method="post" action="insert_bd.jsp">
			<label>Nom:</label>
			<input type="text" name="nom">
			<div id="tab">
				<table border="1" width="400">
				<caption>
					<b>
						Raça: <% out.print(race[race_random]); %>
					</b>
				</caption>
				<tr>
					<th rowspan='9'><img
						src='img/<% out.print(race_picture[race_random]); %>.png'
						alt='<% out.print(race[race_random]); %>' height='100' width='80'
						title='Nans'></th>
					<th>Carac.</th>
					<th>Valor Base</th>
					<th>Mod.</th>
					<th>Valor Final</th>
				</tr>
				<tr>
					<td><i>FUE:</i></td>
					<td>
						<%
					int fue=getValue();
					out.print(fue);
					%>
					</td>
					<td>
						<%
				int mfue=modFUE(race_random);
				out.print(modFUE(race_random));
				%>
					</td>
					<td>
						<% out.print(fue+mfue); %>
					</td>
				</tr>
				<tr>
					<td><i>DES:</i></td>
					<td>
						<%int des=getValue();
					out.print(des);%>
					</td>
					<td>
						<%
				int mdes=modDES(race_random);
				out.print(modDES(race_random));
				%>
					</td>
					<td>
						<%out.print(des+mdes); %>
					</td>
				</tr>
				<tr>
					<td><i>CON:</i></td>
					<td>
						<%int con=getValue();
					out.print(con);%>
					</td>
					<td>
						<%
				int mcon=modCON(race_random);
				out.print(modCON(race_random));
				%>
					</td>
					<td>
						<%
						int a=con+mcon;
						out.print(con+mcon); %>
					</td>
				</tr>
				<tr>
					<td><i>INT:</i></td>
					<td>
						<%int inte=getValue();
					out.print(inte);%>
					</td>
					<td>
						<%
				int mint=modINT(race_random);
				out.print(modINT(race_random));
				%>
					</td>
					<td>
						<%
						int b=inte+mint;
						out.print(inte+mint); %>
					</td>
				</tr>
				<tr>
					<td><i>SAB:</i></td>
					<td>
						<%int sab=getValue();
					out.print(sab);%>
					</td>
					<td>
						<%
				int msab=modSAB(race_random);
				out.print(modSAB(race_random));
				%>
					</td>
					<td>
						<%
						int c=sab+msab;
						out.print(sab+msab); %>
					</td>
				</tr>
				<tr>
					<td><i>CAR:</i></td>
					<td>
						<%int car=getValue();
					out.print(car);%>
					</td>
					<td>
						<%
				int mcar=modCAR(race_random);
				out.print(modCAR(race_random));
				%>
					</td>
					<td>
						<%out.print(car+mcar); %>
					</td>
				</tr>
				<tr>
				<td><i>P.V (<%
						int pv=(int) (((int) a * (int) (Math.random() * 8 + 1)) * 100) / 160;
				out.print(pv);
				%>)
				</i></td>
				<td colspan="3"><table
						width="<%out.print(pv);%>%"
						bgcolor="red" class="porcen">
						<tr>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>P.M (<%
						int pm=(int) ((int) ((b + c) / 2) * ((int) (Math.random() * 4 + 1)) * 100) / 80;
				out.print(pm);
				%>)
				</td>
				<td colspan="3"><table
						width="<%out.print(pm);%>%"
						bgcolor="blue" class="porcen">
						<tr>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
			</div>
		<input type="hidden" name="race" value="<%out.print(race[race_random]); %>">
		<input type="hidden" name="picture" value="<%out.print(race_picture[race_random]); %>">
		<input type="hidden" name="fue" value="<%out.print(fue+mfue); %>">
		<input type="hidden" name="des" value="<%out.print(des+mdes); %>">
		<input type="hidden" name="con" value="<%out.print(con+mcon); %>">
		<input type="hidden" name="int" value="<%out.print(inte+mint); %>">
		<input type="hidden" name="sab" value="<%out.print(sab+msab); %>">
		<input type="hidden" name="car" value="<%out.print(car+mcar); %>">
		<input type="hidden" name="pv" value="<%out.print((int) (((int) a * (int) (Math.random() * 8 + 1)) * 100) / 160); %>">
		<input type="hidden" name="pm" value="<%out.print(((int) ((int) ((b + c) / 2) * (int) (Math.random() * 4 + 1)) * 100) / 80); %>">
		<input type="submit" value="Enviar Guardar Carta" class="envia">
		</form>
		
		<a href="index.jsp"><button type="button">Volver al inicio</button></a>
		
	</div>

</body>
</html>