	<%@ page import="javax.servlet.http.HttpSession" %> 
<%
HttpSession session1=request.getSession();
String admin1=(String)session1.getAttribute("login");

%>
	<jsp:include page="header.jsp" />
	<jsp:include page="leftSide.jsp" />
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
     
          
                   <div class="container">
  <h2>    Liste des dossiers</h2>
        <% if(admin1.equals("admin")){ %>   
          <table width=100% class="table table-bordered">
          	<thead>
          		<tr class="info">
          			<th>id</th>
          			<th>Nom Entreprise</th>
          			<th>Type</th>
          			<th>Visualise</th>
          			<th>Validation</th>
          		</tr>
          	</thead>
          	<tbody id="tableaucontenus">
          		
          	</tbody>
          </table>
         <%}else{ %>

          <table width=100% class="table table-bordered">
          	<thead>
          		<tr class="info">
          			<th>id</th>
          			<th>Nom Entreprise</th>
          			<th>Type</th>
          			<th>Visualise</th>
          			<th>Telecharger</th>
          		</tr>
          	</thead>
          	<tbody id="tableaucontenus1">
          		
          	</tbody>
          </table>
         <%} %> 
         </div>
        </section>

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
      </div><!-- /.content-wrapper -->
            
          <script type="text/javascript" src="js/jquery.js"> </script>
      <script >
      jQuery(document).ready(function($) {
    	  // Code using $ as usual goes here.
    	  console.log("hello world");
    	  $.ajax({
				type : "post",
				url : "getalldossier", //process to mail
				success : function(response) {
					console.log(response[0]);
					for(i=0;i<response.length;i++){
						console.log("aze"+response[i].etat);
						if(response[i].etat==0)
						$("#tableaucontenus").append("<tr class='danger'><td>"+response[i].id+"</td><td>"+response[i].nom+"</td><td>"+response[i].type+"</td><td><button class='btn btn-default' id='a' tooltip='consulter'><span class='fa fa-eye' idd='"+response[i].identreprise+"'></span></button></td><td><button class='btn btn-info' tooltip='valide'><span class='glyphicon glyphicon-ok' idda='"+response[i].id+"'></span></button></td></tr>");
						else{
							$("#tableaucontenus").append("<tr class='success'><td>"+response[i].id+"</td><td>"+response[i].nom+"</td><td>"+response[i].type+"</td><td><button class='btn btn-default' id='a' tooltip='consulter'><span class='fa fa-eye' idd='"+response[i].identreprise+"'></span></button></td><td>deja valide</td></tr>");

						}
					}
				},
				error : function() {
					console.log("erreur");
				}
		  });
    	  
    	  $.ajax({
				type : "post",
				url : "getalldossierEntreprise", //process to mail
				success : function(response) {
					console.log(response[0]);
					for(i=0;i<response.length;i++){
						console.log("aze"+response[i].etat);
						if(response[i].etat==1)
							$("#tableaucontenus1").append("<tr class='success'><td>"+response[i].id+"</td><td>"+response[i].nom+"</td><td>"+response[i].type+"</td><td><button class='btn btn-default' id='a' tooltip='consulter'><span class='fa fa-eye' idd='"+response[i].identreprise+"'></span></button></td><td><button class='btn btn-info' tooltip='valide' ><span class='glyphicon glyphicon-save'></span></button></td></tr>");
						else
							$("#tableaucontenus1").append("<tr class='danger'><td>"+response[i].id+"</td><td>"+response[i].nom+"</td><td>"+response[i].type+"</td><td><button class='btn btn-default' id='a' tooltip='consulter'><span class='fa fa-eye' idd='"+response[i].identreprise+"'></span></button></td><td></td></tr>");

					}
				},
				error : function() {
					console.log("erreur");
				}
		  });
    	});

      $('body').on('click', '.glyphicon-ok', function(){
    	  var id=$(this).attr("idda");
    	  $.ajax({
				type : "post",
				url : "valideDossier", //process to mail
				data :{
					id:id
				},
				success : function(response) {
					window.location.href="ListeDossier.jsp";
				},
				error : function() {
					console.log("erreur");
				}
		  });
      });
      $('body').on('click', '.glyphicon-save', function(){
    	  console.log("azeaaa");
    	  window.open('a.pdf','_blank');
      });
      $('body').on('click', '.fa-eye', function(){
    	  var id=$(this).attr("idd");
    	  $.ajax({
				type : "post",
				url : "getInfoEntreprise", //process to mail
				data :{
					id:id
				},
				success : function(response) {
					console.log(response);
					$("#titreModal").html("Information sur l'entreprise");
					var contenu="";
					for(i=0;i<response.length;i++){
						contenu+="<fieldset>"+
									"<table width='100%'>"+
										"<tr><td><b>Nom ou RS : </b></td><td>"+response[i].nom+"</td></tr>"+
										"<tr><td><b>Signe usuel : </b></td><td>"+response[i].su+"</td></tr>"+
										"<tr><td><b>Forme Juridique : </b></td><td>"+response[i].fj+"</td></tr>"+
										"<tr><td><b>Capital : </b></td><td>"+response[i].capital+"</td></tr>"+
										"<tr><td><b>Part Mar : </b></td><td>"+response[i].part+"</td></tr>"+
										"<tr><td><b>Email : </b></td><td><a href='mailto:"+response[i].email+"'>"+response[i].email+"</a></td></tr>"+
										"<tr><td><b>Telephone : </b></td><td><a href='tel:"+response[i].tel+"'>"+response[i].tel+"</a></td></tr>"+
									"</table>"+
						"</fieldset>";
						contenu+="<fieldset>"+
						"<legend>Materiels</legend>"+
						"<table width='100%'>"+
						"<thead><tr><th><b>Designation</th>  <th><b>nombre</th> <th><b>Prix U</th> <th><b>Description </th> <th><b> Annee </th></tr></thead><tbody>";
						
						for(j=0;j<response[i].Materiel.length;j++){

							contenu+="<tr> <td>"+response[i].Materiel[j].catmat+"</td> <td>"+response[i].Materiel[j].nombre+"</td> <td>"+response[i].Materiel[j].pu+"</td> <td>"+response[i].Materiel[j].description+"</td> <td>"+response[i].Materiel[j].annee+"</td> </tr>";

						}
						contenu+="</tbody></table>"+
							"</fieldset>";
							
						contenu+="<fieldset>"+
						"<legend>Personnelles</legend>"+
						"<table width='100%'>"+
						"<thead><tr><th><b>Nom & Prenom</th>  <th><b>diplome</th> <th><b>Fonction</th> <th><b>Specialite </th></tr></thead><tbody>";
						
						for(j=0;j<response[i].humain.length;j++){

							contenu+="<tr> <td>"+response[i].humain[j].nom+"</td> <td>"+response[i].humain[j].diplome+"</td> <td>"+response[i].humain[j].fonction+"</td> <td>"+response[i].humain[j].specialite+"</td> </tr>";

						}
						contenu+="</tbody></table>"+
							"</fieldset>";
						
					}
					$("#contenu").html(contenu);
				},
				error : function() {
					console.log("erreur");
				}
		  });
    	  console.log(id);
    	  $('#Modalx').modal("show");
      });
   
    	 
    	 
		</script>
      <jsp:include page="footer.jsp" />


      