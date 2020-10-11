<?php 
  include_once("diseño.php");
 ?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title> Login</title>
	<link rel="stylesheet"  href="css_inde/estilos_seccion.css">
</head>
<body>
 

                 <section class="form-login">
     <h5> </h5>
      <form name="FrmAutenticar"action="autenticacion.php" method="post" enctype="application/x-www-form-urlencoded">
        <?php 
    
      error_reporting(E_ALL ^ E_NOTICE); //EVITAR MENSAJES DE NOTIFICACION
      //AL EXISTIR UN ERROR EN VALIDACION DE DATOS
      if ($_GET["error"]=="si") {
        echo "<span> Verifica Datos</span>";
      }else{
        echo "Iniciar Sesión";
      }
     
     ?>
      <input class="controls" type="text" name="txtusuario" value="" placeholder="Usuario">
      <input class="controls" type="password" name="txtcontrasena" value="" placeholder="Contraseña">
      <input class="buttons" type="submit" name="btnInicio" value="Ingresar">
  </form>
    </section>
      <br>
      <br>
      <br>
      <br>
 <footer>
    <div class="footer-copy-redes">
      <div class="main-copy-redes">
        <div class="footer-copy">
                              &copy; 2020, Todos los derechos reservados - | Rocio Urbina | | Guillermo Perez |.
                        </div>
        <div class="footer-redes">
          <a href="#" class="fa fa-facebook"></a>
          <a href="#" class="fa fa-twitter"></a>
          <a href="#" class="fa fa-youtube-play"></a>
          <a href="#" class="fa fa-github"></a>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>


 


