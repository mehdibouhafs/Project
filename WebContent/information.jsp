
	<jsp:include page="header.jsp" />
	<jsp:include page="leftSide.jsp" />
		<%@ page import="java.sql.*, java.util.*" %> 
 	<%@ page import="com.esisa.stage.dao.Utilitaire" %>
 		<%@ page import="javax.servlet.http.HttpSession" %> 
<%
HttpSession session1=request.getSession();
String admin1=(String)session1.getAttribute("login");

%>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Information utilisateur
          </h1>
          <form id="form">
          <table width="100%">
          <% 
          	Connection con=Utilitaire.getConnection();
          	try{
          	PreparedStatement ps=con.prepareStatement("select * from utilisateur u ,compte c where u.idcompte=c.id and login=?");
          	ps.setString(1,admin1 );
          	ResultSet rs=ps.executeQuery();
          	while(rs.next()){
          		

          %>
          	<tr>
          		<td>Nom</td>
          		<td><input type="text" name="nom" id="nom" disabled value="<%= rs.getString("nom") %>" class="form-control" style="margin-bottom:1em"> </td>
          	</tr>
          	
          	          	<tr>
          		<td>Prenom</td>
          		<td><input type="text" name="prenom" id="prenom" disabled value="<%= rs.getString("prenom") %>"  class="form-control" style="margin-bottom:1em"> </td>
          	</tr>
          	          	<tr>
          		<td>Email</td>
          		<td><input type="text" name="email" id="email" disabled value="<%= rs.getString("email") %>"  class="form-control" style="margin-bottom:1em"> </td>
          	</tr>
          	          	<tr>
          		<td>Tel</td>
          		<td><input type="text" name="tel" id="tel" disabled value="<%= rs.getString("tel") %>"  class="form-control" style="margin-bottom:1em"> </td>
          	</tr>
			<tr>
				<td colspan=2 align="center"><input type="button"  id="md" value="modifier" class="btn btn-warning" style="margin-bottom:1em"></td>
			</tr>
          	<%          	}
          	}catch(SQLException e){
          		e.printStackTrace();
          	} %>
          </table>
          </form>
        </section>

        
      </div><!-- /.content-wrapper -->
      <jsp:include page="footer.jsp" />
      
      
      <script>
      	$("#md").click(function(){
      		if($(this).val()=="modifier"){
		      		$(this).val("Enregistre");
		      		$(this).removeClass('btn btn-warning');
		      		$(this).addClass("btn btn-success");
		      		$('#tel').prop('disabled',false);
		      		$('#email').prop('disabled',false);
		      		$('#nom').prop('disabled',false);
		      		$('#prenom').prop('disabled',false);

      		}else{
	    		  $.ajax({
						type : "post",
						url : "modifinfo", //process to mail
						data : $("#form").serialize(),
						success : function(response) {
					    	 alert("mdofication effectuer avec succes");
						},
						error : function() {
							console.log("erreur");
						}
				  });
	      		$(this).val("modifier");
	      		$(this).removeClass('btn btn-success');
	      		$(this).addClass("btn btn-warning");
	      		$('#tel').prop('disabled',true);
	      		$('#email').prop('disabled',true);
	      		$('#nom').prop('disabled',true);
	      		$('#prenom').prop('disabled',true);
	      		
      		}
      	});
      </script>