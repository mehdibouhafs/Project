	<%@ page import="javax.servlet.http.HttpSession" %> 
<%
HttpSession session1=request.getSession();
String admin1=(String)session1.getAttribute("login");

%>
<style>
<!--

-->
.hide-row { display:none; }
.show-row { display:block; }
</style>
	<jsp:include page="header.jsp" />
	<jsp:include page="leftSide.jsp" />
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Tableau de bord
          </h1>
          
                   <% if(!admin1.equals("admin")){ %>
				<div class="row">
					<div class="col-md-3">
					</div>
					<div class="col-md-6">
						<table width=100%>
							<tr>
								<td width=35%>Dossier</td>
								<td>
									<select class="dossier" id="dossier" class="form-control">
										<option value="0">--- Selectionnez un dossier ---</option>
									</select>
								</td>
							</tr>
							<tr class="hide-row" id="1">
								<td style="
    width: 45em;
">Etat</td>
								<td id="etat"></td>
							</tr>
							<tr class="hide-row" id="2">
								<td style="
    width: 45em;
">Certificat</td>
								<td><button class='btn btn-info' tooltip='valide'><span class='glyphicon glyphicon-save'></span></button></td>
							</tr>
						</table>
					</div>
					<div class="col-md-3">
					</div>
				</div>
         <%} %> 
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
<script type="text/javascript">

jQuery(document).ready(function($) {
	  // Code using $ as usual goes here.
	  console.log("hello world");
	
	  $.ajax({
			type : "post",
			url : "getalldossierEntreprise", //process to mail
			success : function(response) {
				console.log(response[0]);
				for(i=0;i<response.length;i++){
						$("#dossier").append("<option value='"+response[i].id+"'>Dossier "+response[i].id+"</option>");
				}
			},
			error : function() {
				console.log("erreur");
			}
	  });
	});
$( "#dossier" ).change(function() {
	  var id=$(this).val();	 
		$("#1").addClass("hide-row");
		$("#2").addClass("hide-row");
	  $.ajax({
			type : "post",
			url : "getinfoDossier", //process to mail
			data : {
				id:id
			},
			success : function(response) {
				
				for(i=0;i<response.length;i++){
					if(response[0].etat==1){
						$("#1").removeClass("hide-row");
						$("#2").removeClass("hide-row");
						$("#etat").html("valide");
						$("#1").addClass("show-row");
						$("#2").addClass("show-row");
				
					}else{
						$("#1").removeClass("hide-row");
						$("#etat").html("encore de traitement");
						$("#1").addClass("show-row");
					}
				}
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
</script>
      <jsp:include page="footer.jsp" />

      