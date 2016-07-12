<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="font-awesome-4.0.3/css/font-awesome.min.css">
<!-- Datepicker -->
<link href="css/datepicker.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/styles.css">

<title>Login ...</title>


</head>
<body style="background:white">
	<p align="center">
		<img alt="tt" src="img/Equipement.png" style="width:300px;margin-top:10px">
	</p>
	<div class="image" style='background: url(img/avatar.png) no-repeat;' id="mg">
	</div>
	<div id="form1">
		<form id="sign_in" name="sign_in"  method="post">
			<div align="center">
				<div class="input-group">
					<span class="input-group-addon"> <i class="fa fa-user"></i>
					</span> <input type="text" class="form-control" id="login" name="login"
						placeholder="Nom d'utilisateur" required="required">
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-addon"> <i class="fa fa-lock"></i>
					</span> <input type="password" class="form-control" id="password"
						name="password" placeholder="Mot de passe" required="required">
				</div>
				<br />

				<br />

				<input style="width: 300px; margin: 0px auto 10px auto;background:#337ab7"
					class="btn btn-lg btn-primary" type="button" value="S'authentifier" id="submit" >
				<br />
				<div align="center">
					<a href="" onclick="show_form2();return false;" style="color:#337ab7"> besoin d'un
						compte? <strong>inscrivez-vous</strong> <i
						class="fa fa-arrow-right"></i>
					</a> <br /> <a href="#" onclick="show_form3();return false;" style="color:#337ab7"> <small>mot
							de passe oublié ?</small>
					</a>

				</div>
			</div>
		</form>
	</div>


	<div id="form2" style="display: none;" align="center">
		<form id="sign_up" name="sign_up" action="" method="post">
			<div class="input-group">
				<span class="input-group-addon"> <i class="fa fa-user"></i></span> <input
					type="text" class="form-control" id="nom" name="nom"
					placeholder="Nom" required="required">
			</div>
	
			<div class="input-group">
				<span class="input-group-addon"> <i class="fa fa-envelope"></i></span>
				<input type="email" class="form-control" id="email" name="email"
					placeholder="Email" required="required">
			</div>
			<div class="input-group">
				<span class="input-group-addon"> <i class="fa fa-calendar"></i></span>
				<input type="text" class="form-control" id="date" name="date"
					placeholder="Date de creation" required="required">
			</div>
			<div class="input-group">
				<span class="input-group-addon"> <i class="fa fa-phone"></i></span>
				<input type="tel" class="form-control" id="tel" name="tel"
					placeholder="N° de telephone" required="required">
			</div>

			<div class="input-group">
				<span class="input-group-addon"> <i class="fa fa-briefcase"></i></span>
				<input type="text" name="fonction" id="fonction" placeholder="domaine d'activite" class="form-control">
			</div>
			<br>
			<button style="width: 300px; margin: 0px auto 10px auto;background:#337ab7"
				class="btn btn-lg btn-primary " type="button" id="submitDA">Envoyer</button>
			<div align="center">
				<a href="#" onclick="show_form1(); return false;" style="color:#337ab7"><i
					class="fa fa-arrow-left"></i> <small> Retour à la page
						connexion</small></a>
			</div>
		</form>
	</div>

	<div id="form3" style="display: none;" align="center">
		<form id="sign_up" name="sign_up" action="GetPassword" method="post">
			<div class="input-group">
				<span class="input-group-addon"> <i class="fa fa-envelope"></i></span>
				<input type="email" class="form-control" id="email" name="email"
					placeholder="Email" required="required">
			</div>
			<br>
			<button style="width: 300px; margin: 0px auto 10px auto;background:#337ab7"
				class="btn btn-lg btn-primary " type="button" id="">Réinitialiser</button>
			<div align="center">
				<a href="#" onclick="show_form1(); return false;" style="color:#337ab7"><i
					class="fa fa-arrow-left"></i> <small> Retour à la page
						connexion</small></a>
			</div>
		</form>
	</div>
	<!-- JQUERY -->
	
	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/formulaire.js" type="text/javascript"></script>
	<script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datepicker.fr.js" charset="utf-8"></script>

<!-- Modal pour les messages -->
			<div id="Modalx" class="modal fade" tabindex="1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id='titreModal'></h4>
					</div>
					<div class="modal-body" id="contenus">
						<div class="row">
							<div class="col-md-2"  id="images"></div>
							<div class="col-md-10"  id="contenu"></div>
						</div>
					</div>
					      <div class="modal-footer" style='height:45px' id="vi">
				        		<button type="button" id='ok' class="btn btn-warning" style='margin-top:-18px;color:black'>ok</button>
				      		</div>
				</div>
				<!-- End of Modal content -->
			</div>
			<!-- End of Modal dialog -->
		</div>
	<!-- Fin du modal -->
	<script >
	$(document).ready(function(){
				$("#date").datepicker({

					format : 'yyyy-mm-dd',
					startDate : '1955-01-01',
					endDate : '1993-01-01',
					language : 'fr'
				//autoclose: true
				});
			});
			$('#ok').click(function(){
				$('#Modalx').modal("hide");
			});
		//evenement clique sur le bouton ayant l'id submit
		$("#submit").click(	
		function() {
			//envoyer les donnees avec ajax
			$.ajax({
						type : "POST",//la method à utiliser soit POST ou GET
						url : "Login", //lien de la servlet qui exerce le traitement sur les données
						data : $('#sign_in').serialize(),// sign_in c'est l'id du form qui contient le bouton submit et toutes les champs à envoyer
						success : function(msg) {// le cas ou la requete est bien execute en reçoi les données serialiser par JSON dans la variable msg
							//recuperation de la valeur stock dans l'attribut desactive
							if(msg.desactive=="Compte existe"){
								 window.location.href = "Accueil.jsp";
							}
							else{//le cas ou les données sont envoyés mais le compte est desactiver on affiche un message qui indique l'erreur
								$("#titreModal").html("Erreur d'authentification");
								$("#images").html("<img src='img/warning2.png' alt='tt' style='width:50px'>");
								//recuperation de la valeur stock dans l'attribut desactive
								$("#contenu").html(msg.desactive);
								$('#Modalx').modal("show");
							}
						},
						error : function() { //erreur dans le cas les données ne sont pas envoyer on affiche un message qui indique l'erreur
							$("#titreModal").html("Erreur ");
							$("#images").html("<img src='img/warning2.png' alt='tt' style='width:50px'>");
							$("#contenus").html("Oups, les informations saisies sont incorrectes.Essayez à nouveau.");
							$('#Modalx').modal("show");
						}
					});
			
		});
		$("#submitDA").click(	
				function() {
					//envoyer les donnees avec ajax
					$.ajax({
								type : "POST",//la method à utiliser soit POST ou GET
								url : "DemandeCompte", //lien de la servlet qui exerce le traitement sur les données
								data : $('#sign_up').serialize(),// sign_in c'est l'id du form qui contient le bouton submit et toutes les champs à envoyer
								success : function(msg) {// le cas ou la requete est bien execute en reçoi les données serialiser par JSON dans la variable msg

										$("#titreModal").html("Message de succès");
										$("#images").html("<img src='img/ok.png' alt='tt' style='width:50px'>");
										//recuperation de la valeur stock dans l'attribut desactive
										$("#contenu").html("Votre demande a été bien prise en compte");
										$("#vi").html("<button type='button' id='ok1' class='btn btn-success' style='margin-top:-18px;color:black'>ok</button>");
										$('#Modalx').modal("show");
										

								},
								error : function() { //erreur dans le cas les données ne sont pas envoyer on affiche un message qui indique l'erreur
									$("#titreModal").html("Erreur ");
									$("#images").html("<img src='img/warning2.png' alt='tt' style='width:50px'>");
									$("#contenus").html("Oups, les informations saisies sont incorrectes.Essayez à nouveau.");
									$("#vi").html("<button type='button' id='ok1' class='btn btn-warning' style='margin-top:-18px;color:black'>ok</button>");
									$('#Modalx').modal("show");
								}
							});
					$('body').on('click', "#ok1",function() {
						$('#Modalx').modal("hide");
						location.reload();
					});
				});
	</script>


</body>
</html>