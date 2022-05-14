<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fomulari Git</title>
</head>
<body>

<h1>Formulari Git</h1>
<h3>Versió 0.2 Beta</h3>

<form action="validate.php" method="POST">

<?php
          require_once('recaptchalib.php');
          $publickey = "6LcNpeAfAAAAAN65-o9xNBGBRSmRnq6l5q4m4nPU"; // you got this from the signup page
          echo recaptcha_get_html($publickey);
?>

<table>
<tr><td>Contraseña antigua</td><td><input id="old_pass" type="password"></td></tr>
<tr><td>Contraseña nueva:</td><td><input id="new_pass1" type="password"></td></tr>
<tr><td>Repetir contraseña nueva:</td><td><input id="new_pass2" type="password"></td></tr>
<tr><td>Marca si eres un humano:</td><td><input id="human" type="checkbox"></td></tr>
<tr><td>Marca si eres un robot:</td><td><input id="robot" type="checkbox"></td></tr>
</table>
<br />
<input type="button" name="login" value="Login">
</form>

</body>
</html>