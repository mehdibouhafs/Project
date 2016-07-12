
	<jsp:include page="header.jsp" />
	<jsp:include page="leftSide.jsp" />
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           Modifier Mot de passe
          </h1>
               <form method="post" id="form">
          <table align="center">
     
          	<tr>
          		<td>Ancien Mot de passe : </td>
          		<td ><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<input type="password" name="pass1" id="pass1" class="form-control" >
										</div></div></td>
          	</tr>
          	<tr>
          		<td>Nouveau Mot de passe : </td>
          		<td>
          		<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<input type="password" name="pass2" id="pass2" class="form-control" >
										</div></div></td>
          	</tr>
          	<tr>	
          		<td>Confirmer le  Mot de passe : </td>
          		<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
			<input type="password" name="pass3" id="pass3" class="form-control">
			</div></div></td>
          	</tr>
          	<tr>
          		<td colspan=2 align="center"><input type="button" id="btn" class="btn btn-primary" value="Enregistrer"  style="margin-bottom: 1em;"></td>
          	</tr>
          
          </table>	</form>
        </section>

        
      </div><!-- /.content-wrapper -->
      <jsp:include page="footer.jsp" />
           	<script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datepicker.fr.js" charset="utf-8"></script>
		<script src="js/jquery.validate.js" type="text/javascript"></script>
      <script>
      $('#form').validate({ // initialize the plugin
	        rules: {
	        	pass1: {
                    required: true
                },
                pass2: {
                    required: true
                },
                pass3: {
                    required: true
                }
	        },
            highlight: function (element) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorElement: 'span',
            errorClass: 'help-block',
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
	    });
	    $('#btn').click(function () {
	    	
	    	 if ($("#form").valid()) {
	    		 if(document.getElementById("pass2").value==document.getElementById("pass3").value){
	    		  $.ajax({
						type : "post",
						url : "passwordreset", //process to mail
						data : $("#form").serialize(),
						success : function(response) {
					    	 alert("Votre mot de passe a ete valide avec success");
						},
						error : function() {
							console.log("erreur");
						}
				  });
	    	 	}else{
	    	 		alert("votre nouveau mot de passe n'est pas le meme dans le deuxime champs");
	    	 	}
	    	 }
	    		 
	    });
      </script>