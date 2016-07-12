
	<jsp:include page="header.jsp" />
	<jsp:include page="leftSide.jsp" />
	<style>

#tabs ul
{
    font: normal 14px arial, sans, sans-serif;
    -list-style-type: none;
    border-bottom: 1px solid gray;
    margin: 0;
    padding-left:0;
    padding-right:0;
    padding-bottom: 26px;
}

#tabs ul li 
{
    display: inline;
    float: left;
    height: 24px;
    min-width:80px;
    text-align:center;
    padding:0;
    margin: 1px 0px 0px 0px;
    border: 1px solid gray;
}

#tabs ul li.selected 
{
    border-bottom: 1px solid #fff;
    background-color: #fff;
}


#tabs ul li a 
{
    float: left;
    color: #666;
    text-decoration: none;
    padding: 4px;
    text-align:center;
    background-color:#eee;
    min-width:80px;
    border-bottom: 1px solid gray;
}

#tabs ul li a.selected
{
    color: #000;
    font-weight:bold;
    background-color: #fff;
    border-bottom: 1px solid #fff;
}

#tabs ul li a:hover
{
    color: #000;
    font-weight:bold;
    background-color: #fff;
}

#container 
{
    background: white;
    border:1px solid gray;
    border-top: none;
    height:350px;
    width:100%;
    padding:0;
    margin:0;
    left:0;
    top:0;	
}

iframe
{
    border:none;
    margin:0;
    padding:0;
}
.form-group{
	margin-bottom:14px;
}
.input-group{
	width:100%;
}
</style>
	<%@ page import="java.sql.*, java.util.*" %> 
 	<%@ page import="com.esisa.stage.dao.Utilitaire" %>
    
	 <%   Connection con=Utilitaire.getConnection(); %>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Ajouter un dossier
          </h1>
          <div class="row">
          	<div class="col-md-12">
          		<div id="content">
    				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
				        <li class="active" id="tab0"><a >Type demande</a></li>
				        <li id="tab1"><a >Entreprise</a></li>
				        <li id="tab2"><a >Moyens matériels</a></li>
				        <li id="tab3"><a >Moyens humaine</a></li>
				        <li id="tab4" ><a >Capacite financiere</a></li>
				        <li id="tab5"><a >Qualifications demandées</a></li>
				
    			</ul>
    <div id="my-tab-content" class="tab-content">
        <div class="tab-pane active" id="td">
            <h1></h1>
            <div class="row">
            
            	<div class="col-row-10">
            	<form name="form1" id="form1">
            		<p style=" text-align: justify;margin-left:1em;margin-right:4em">Choissez ici le type de votre demande en sélectionnanat 
            		l'option approprée parmi les options. En cas de réexamen ou de renouvellement vous avez la possibilité de créer votre 
            		nouveau doosier à partir d'un dossier existant dans la base de données.</p><br>
            		<div style="margin-left:50px">
	            		<div class='form-group'>
									<div class='input-group'><input type="radio" name="type" value="Examen" ><b> Examen</b></div></div>
	            		<p style=" text-align: justify;margin-left:3em;margin-right:4em">choissez cette option s'il s'agit de votre premiére demande de qualification et de classification</p>
	            		<div class='form-group'>
									<div class='input-group'><input type="radio" name="type" value="Réexamen"><b> Réexamen</b></div></div>
	            		<p style=" text-align: justify;margin-left:3em;margin-right:4em">choissez cette option si vous souhaitez faire la demande pour de nouvelles qualifications et classifications ou pour les changements de qualificaitons et classifications. Vous ne pouvez choisir cette option que si vous avez deja un certificat valide</p>
	            		<div class='form-group'>
									<div class='input-group'><input type="radio" name="type" value="3"><b> Renouvellement</b></div></div>
	            		<p style=" text-align: justify;margin-left:3em;margin-right:4em">choissez cette option si vous souhaitez demande un renouvellement de votre certificat à l'identique. Vous ne puvez choisir cette option que si votre certificat expiera dans moins d'un mois ou si votre certificat est deja expiré</p>
            			<div class="row">
            				<div class="col-md-6">
            					<div class='form-group'>
									<div class='input-group'><input type="radio" name="type" value="Dossier vierge" ><b> Dossier vierge</b></div></div>
	            				<p style=" text-align: justify;margin-left:3em;margin-right:4em">sélectionnez cette option pour cr"er un dossier vierge </p>
            				</div>
            				<div class="col-md-6">
            						<div class='form-group'>
									<div class='input-group'><input type="radio" name="type" value="Dupliquer dossier" ><b> Dupliquer dossier</b></div></div>
	            				<p style=" text-align: justify;margin-left:3em;margin-right:4em">sélectionnez cette option pour créer un dossier à partir d'un dossier existant. Cette option permet d'économiser l'effort de saisie </p>
            				</div>
            			</div>
            			
            			<input type="button" id="next" name="next"class="btn btn-success pull-right" value="Continuer" style="margin-right: 50px;">
            			
            		</div>
            		</form>
            	</div>
            	
            </div>
        </div>
        <div class="tab-pane" id="entreprise">
            <h1></h1>
            <div class="row">
            <form name="form2" id="form2">
            	<h3>Identification de l'entreprise</h3>
            	<div class="col-md-3">
            		<table>
            			<tr>
            				<td>Nom ou RS</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            							<input type="text" name="nom" id="nom" class="form-control">
            						</div>
            					</div>
            					</td>
            			</tr>
            			<tr>
            				<td>N° Tel</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-phone"></i></span>
										<input type="tel" name="tel" id="tel" class="form-control">
								</div>
								</div>
							</td>
            			</tr>
            			<tr>
            				<td>RC</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<input type="text" name="rc" id="rc" class="form-control">
            					</div>
            					</div>	
            				</td>
            			</tr>
            			<tr>
            				<td>Forme juridique</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<select name="fj" id="fj"  class="form-control">
            						<%
            							try{
	            							PreparedStatement ps=con.prepareStatement("Select * FROM FormeJuridique");
	            							ResultSet rs=ps.executeQuery();
	            							while(rs.next()){
            						%>
            						<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
            						<% }
            							}catch(SQLException e ){
            								e.printStackTrace();
            							}%>
            					</select>
            					</div>
            					</div>
            				</td>
            			</tr>
            		</table>
            	</div>
            	<div class="col-md-3">
            		 <table>
            			<tr>
            				<td>Signe usuel</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            				<input type="text" name="su" id="su" class="form-control">
            					</div>
            					</div>
            				</td>
            			</tr>
            			<tr>
            				<td>N° Fax</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-phone"></i></span>
            					<input type="tel" name="fax" id="fax" class="form-control">
            					</div></div></td>
            			</tr>
            			<tr>
            				<td>CNSS</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            				<input type="text" name="cnss" id="cnss" class="form-control"></div></div></td>
            			</tr>
            			<tr>
            				<td>Capital Social</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-money"></i></span>
            				<input type="number" step="0.01" value="0.00" min=0 name="cs" id="cs" class="form-control">
            				</div></div></td>
            			</tr>
            		</table>
            	</div>
            	<div class="col-md-3">
            		  <table>
            			<tr>
            				<td>Adresse</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<input type="text" name="adresse" id="adresse" class="form-control">
									</div></div></td>
            			</tr>
            			<tr>
            				<td>Email</td>
            				<td>
            				<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-envelope"></i></span>
            				<input type="email" name="email" id="email" class="form-control"></div></div></td>
            			</tr>
            			<tr>
            				<td>IF</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<input type="text" name="ifa" id="ifa" class="form-control">
								</div></div>
								</td>
            			</tr>
            			<tr>
            				<td>Part. Mar.</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-money"></i></span>
										<input type="number" step="0.01" value=0 min=0 name="pm" id="pm" class="form-control"></div></div>
							</td>
            			</tr>
            		</table>
            	</div>
            	<div class="col-md-3">
            		<table>
            			<tr>
            				<td>Ville</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<select name="ville" id="ville" class="form-control">
            						<%
            							try{
	            							PreparedStatement ps=con.prepareStatement("Select * FROM Ville");
	            							ResultSet rs=ps.executeQuery();
	            							while(rs.next()){
            						%>
            						<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
            						<% }
            							}catch(SQLException e ){
            								e.printStackTrace();
            						}%>
            						
            					</select></div></div>
            				</td>
            			</tr>
            			<tr>
            				<td>Taxe prof.</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<input type="number" step="0,01" min=0 name="tp" id="tp" class="form-control">
										</div></div></td>
            			</tr>
            			<tr>
            				<td>Date de creation</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-calendar"></i></span>
										<input type="text" name="dateCreation" id="dateCreation" class="form-control">
            					</div>
            					</div>
            				</td>
            			</tr>
            		</table>
            	</div>
            	</form>
            </div>
            <div class="row">
            		<h3>Activites de l'entreprise</h3>
            			<div class="col-md-12">
            			<table width="100%">
            					<tr >
            						<td width="30%" style="padding-right:1%">
            						<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            							<select name="secteur" id="secteur" class="form-control">
            							<option value="0">Secteur</option>
            								<% PreparedStatement ps1=con.prepareStatement("Select * from Secteur");
            									ResultSet rs1=ps1.executeQuery();
            									while(rs1.next()){
            								%>
            									<option value="<%=rs1.getInt(1) %>"><%=rs1.getString(2) %></option>
            								<% } %>
            							</select></div></div>
            						</td >
            						            						<td width="30%" style="padding-right:1%">
            							<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<select name="soussecteur" id="soussecteur" class="form-control">
            								<option value="0">Sous-Secteur</option>
            							</select></div></div>
            						</td>
            						            						<td width="20%" style="padding-right:1%">
            							<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<select name="branche" id="branche" class="form-control">
            								<option value="0">Branche</option>
            							</select></div></div>
            						</td>
            						  <td style="padding-right:1%">
            						  
            						   <input type="button" class="btn btn-primary" value="Ajouter à la liste" id="add" nbr="0">
            						</td>
            					</tr>
            				</table>
            				<table width=100% border=1 class="table table-striped table-bordered" cellspacing="0" id="tableauEntreprise">
            					<thead>
            						<tr>
            							<th width="30%">Secteur</th>
            							<th width="30%">Sous-Secteur</th>
            							<th width="20%">Branche</th>
            							<th width="20%"></th>
            						</tr>
            					</thead>
            					<tbody id="addSecteur">
            					</tbody>
            				</table>
            			</div>
            		</div>

           
           <input type="button" value="Enregistrer et Continuer" id="save2" class="btn btn-success pull-right"> <input type="button" value="Precedent" id="precedent1" class="btn btn-danger pull-right"  style=" margin-right: 1em;">
        </div>
        <div class="tab-pane" id="mh">
        	
            <h1></h1>
            <div class="row">
            	<form name="form31" id="form31">
            	<h3>Personnel d'encadrement</h3>
            	<div class="col-md-4">
            	
            		<table>
            			<tr>
            				<td width=35%>Nom</td>
            				<td>
            				<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            				<input type="text" name="nompe" id="nompe" class="form-control"></div></div></td>
            			</tr>
            			           			<tr>
            				<td>N° Pièce d'identité</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            				<input type="text" name="numpe"  id="numpe" class="form-control"></div></div></td>
            			</tr>
            			           			<tr>
            				<td>Date Diplome</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-calendar"></i></span>
            				<input type="text" name="dateDiplome" id="dateDiplome" class="form-control"></div></div></td>
            			</tr>
            			           			<tr>
            				<td>Fonction</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
								<select id="fonction" name="fonction" class="form-control">
														<%
            							try{
	            							PreparedStatement ps=con.prepareStatement("Select * FROM Fonction");
	            							ResultSet rs=ps.executeQuery();
	            							while(rs.next()){
            						%>
            						<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
            						<% }
            							}catch(SQLException e ){
            								e.printStackTrace();
            						}%>
								</select></div></div>
							</td>
            			</tr>
            			           			<tr>
            				<td>Date Recrutement</td>
            				<td>
            				<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-calendar"></i></span>
										<input type="text" name="dateRecrutement" id="dateRecrutement" class="form-control">
							
							</div></div></td>
            			</tr>
            			           			<tr>
            				<td>CV</td>
            				<td > 
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
            				 <input type="file" name="cv" id="cv" class="form-control">
            				 </div></div>
            				 </td>
            			</tr>
            		</table>
            		
            	</div>
            	<div class="col-md-4">
            		<table>
            			<tr>
            				<td>Prenom</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            				<input type="text" name="prenompe" id="prenompe" class="form-control">
            				</div></div>
            				</td>
            			</tr>
            			<tr>
            				<td>Diplome</td>
            				<td>
            				<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<select name="diplome" id="diplome" class="form-control">
            						<%
            							try{
	            							PreparedStatement ps=con.prepareStatement("Select * FROM diplome");
	            							ResultSet rs=ps.executeQuery();
	            							while(rs.next()){
            						%>
            						<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
            						<% }
            							}catch(SQLException e ){
            								e.printStackTrace();
            						}%>
            					</select></div></div>
            				</td>
            			</tr>
            			<tr>
            				<td>Spécialite</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<select name="specialite" id="specialite" class="form-control">
            						<%
            							try{
	            							PreparedStatement ps=con.prepareStatement("Select * FROM specialite");
	            							ResultSet rs=ps.executeQuery();
	            							while(rs.next()){
            						%>
            						<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
            						<% }
            							}catch(SQLException e ){
            								e.printStackTrace();
            						}%>
            					</select></div></div>
            				</td>
            			</tr>
            			<tr>
            				<td>Dirigeant</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            				<input type="checkbox" name="dirigeant" id="dirigeant" >
            					</div></div>
            				</td>
            			</tr>
            			<tr>
            				<td>Diplome</td>
            				<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
            				<input type="file" name="filediplome" id="filediplome" class="form-control">
            				</div></div>
            				</td>
            			</tr>
            		</table>
            	</div>
            	<div class="col-md-4">
            		<table>
            			<tr>
            				<td>CNSS</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<input type="text" name="cnsspe" id="cnsspe" class="form-control">
									</div>
									</div>	
									</td>
            			</tr>
            	
            		</table>
            	</div><br>
            	</form>
            	<input type="button" id="addpe" value="Ajouter à la liste" class="btn btn-primary" style="margin-top: 284px;margin-left: -750px;margin-bottom: 2em;">
            	<div class="row">
            		<div class="col-md-12">
            			<table width=100%>
            				<thead>
            					<tr>
            						<th>Nom et Prenom</th>
            						<th>Diplome</th>
            						<th>Specialite</th>
            						<th>N° pièce d'identite</th>
            						<th>Fonction</th>
            						<th>CNSS</th>
            						<th>Options</th>
            					</tr>
            				</thead>
            				<tbody id="tabpe">
            				</tbody>
            			</table>
            		</div>
            	</div>
            	<hr>
            	<div class="row" style="margin-left:auto">
            		<h3 >Masse Salariale Annuelle</h3>
            		<div class="col-md-8">
            		<form name="form32" id="form32">
            			<table width=100%>
            				<tr>
            					<td   width= "43%">Annee</td>
            					<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-calendar"></i></span>
            						<select name="Annee" id="Annee" class="form-control">
            							<% 
            								int year = Calendar.getInstance().get(Calendar.YEAR);
            								for(int i=0;i<4;i++){
            							%>
            								<option value="<%=year-i %>"><%=year-i %></option>
            							<% } %>
            						</select></div></div>
            					</td>
            				</tr>
            				<tr>
            					<td>Nombre moyen annuelle des salaries declares</td>
            					<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<input type="number" min=0 name="nbmasd" id="nbmasd" value="0" class="form-control">
            					</div></div>
            					</td>
            				</tr>	
            				<tr>	<td>Masse salarielle annuelle en DH</td>
            					<td>
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-money"></i></span>
            					<input type="number" step="0.01" value="0.00" min=0 name="msadh" id="msadh" class="form-control">
            					</div></div>
            					</td>
            				</tr>
            				<tr>
            					<td>Attestation de la masse salariale</td>
            					<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
										<input type="file" name="ams" id="ams" class="form-control">
										</div></div>
										</td>
            				</tr>
            				<tr>
            					<td colspan="2" align="center"><input type="button" id="addmsa" value="AJouter à la liste" class="btn btn-primary" style="margin-top:1em;margin-bottom:1em"></td>
            				</tr>
            			</table></form>
            		</div>
            		<div class="row">
            			<div class="col-md-12">
            			<table width=100% id="tableaumsa">
            				<thead>
            					<tr>
            						<th>Année</th>
            						<th>Nombre moyen annuel des salariées déclarées</th>
            						<th>Masse salariales annuelle</th>
            						<th>Attestation de la masse salariale</th>
            						<th>Options</th>
            					</tr>
            				</thead>
            				<tbody id="tabmsa">
            				</tbody>
            			</table>
            		</div>
            		</div>
            		
            	</div>
            	          
            	
            </div>
            <hr>
            <form name="form33" id="form33">
			<div class="row">
			
				<h3>Bordereaux de la CNSS</h3>
				<div class="col-md-9">
					<table width=100%>
						<%
							int mois = Calendar.getInstance().get(Calendar.MONTH);
							for(int i=0;i<3;i++){
								String monthString;
						        switch (mois-i) {
						            case 1:  monthString = "Janvier";       break;
						            case 2:  monthString = "Fevrier";      break;
						            case 3:  monthString = "Mars";         break;
						            case 4:  monthString = "Avril";         break;
						            case 5:  monthString = "Mai";           break;
						            case 6:  monthString = "Juin";          break;
						            case 7:  monthString = "Juillet";          break;
						            case 8:  monthString = "Aout";        break;
						            case 9:  monthString = "Sptembre";     break;
						            case 10: monthString = "Octobre";       break;
						            case 11: monthString = "Nouvemebre";      break;
						            case 12: monthString = "Decembre";      break;
						            default: monthString = "Invalid month"; break;
						        }
						%>
						<tr>
							<td width=30%><%=(monthString)+"\t\t"+year %> </td>
							<td width=30%><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
										<input type="file" name="mois<%=i %>" class="form-control"></div></div></td>
							<td align="center" width=40%><a href="">Consulter</a></td>
						</tr>
						<% } %>
					</table>
				</div>
			</div>
			<br>
			           <input type="button"  value="Enregistrer et Continuer" id="save3" class="btn btn-success pull-right"> <input type="button" value="Precedent" id="precedent2" class="btn btn-danger pull-right"  style=" margin-right: 1em;">
			</form>
        </div>
        <div class="tab-pane" id="mm">
            <h1></h1>
            <div class="row">
            	<h3>Materiel Appartenant à l'entreprise</h3>
            	<div class="col-md-12">
            	<form name="form4" id="form4">
            		<table style="width:80%" >
            		
            			<tr>
            				<td width=30%><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<select class="form-control" name="catmat" id="catmat">
            					<option value="0" disabled>Categorie materiel</option>
            						<% PreparedStatement ps=con.prepareStatement("Select * FROM CategorieMateriel");
            							ResultSet rs=ps.executeQuery();
            							while(rs.next()){
            						%>
            						<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
            						<% } %>
            					</select></div></div>
            				</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            					<select class="form-control" name="typemat" id="typemat">
            						<option value="0">Type materiel</option>
            					</select></div></div>
            				</td></tr>
            				<tr><td>Nombre
            				</td>
            				<td>
            				<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
            				<input type="number" name="q" id="q" min=0 value="0" class="form-control">
            				</div></div></td></tr>
            				<tr><td width=10%>Prix Unitaire
            				</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-money"></i></span>
						<input type="number" name="pu" min="0" value="0.12" id="pu" class="form-control" step="0.01">
						
						</div></div></td></tr>
            			<tr><td width=10%>Annee d'acquisition
            				</td>
            				<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-money"></i></span>
						<input type="number" min=0 value="2015" name="anneeAcquisition" id="anneeAcquisition" class="form-control">
						
						</div></div></td></tr>
            			<tr>
            				<td >Caracteristiques techniques</td>
            				<td >
            					<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
										<textarea cols="50" rows=3 class="form-control" name="desc" id="desc"></textarea></div></div>
            				</td>
            			</tr>
            			<tr>
            				<td >Piece justificative de l'achat</td>
            				<td ><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
										<input type="file" class="form-control" name="pja" id="pja">
										</div></div></td>
            			</tr>
            			<tr>
            				<td colspan="2" align=center><input type="button" id="btnaddmat" name="btnaddmat" class="btn btn-primary" value="Ajoute à la liste" style="margin-top:1em;margin-bottom:1em"></td>
            			</tr>
            		
            		</table>
					</form>
					<fieldset>
						<legend>Liste des achats</legend>
						<table width=100% id="tableaumat">
							<thead>
								<tr>
									<th>Désignation</th>
									<th>Caractéritique techniques</th>
									<th>Nombre</th>
									<th>Année dacquisition</th>
									<th>Prix Unitaire</th>
									<th>Piece justificative de l'achat</th>
									<th>options</th>
								</tr>
							</thead>
							<tbody id="addmat">
							</tbody>
						</table>
						
					</fieldset>
					
            	</div>
            </div>
          	<input type="button" value="Enregistrer et Continuer" id="save4" class="btn btn-success pull-right"> <input type="button" value="Precedent" id="precedent3" class="btn btn-danger pull-right"  style=" margin-right: 1em;">
            
        </div>
        <div class="tab-pane" id="cf">
            <h1></h1>
           	<div class="row">
           		<div class="col-md-12">
           			<fieldset>
           				<legend>Chiffre d'affaires</legend>
           				<form name="form5" id="form5">
           				<table width=100%>
           				
           					<tr>
           						<td width=20%>Annee</td>
           						<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-calendar"></i></span>
           							<select name="AnneeCA" id="AnneeCA" class="form-control">
           								<% 
            								//int year = Calendar.getInstance().get(Calendar.YEAR);
            								for(int i=0;i<4;i++){
            							%>
            								<option value="<%=year-i %>"><%=year-i %></option>
            							<% } %>
           							</select></div></div>
           						</td></tr>
           						<tr><td>Montant du chiffre d'affaires TTC</td>
           						<td>
           						<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-money"></i></span>
           						<input type="number" step="0.01" value="0.00" min=0 name="MCATTC" id="MCATTC" class="form-control">
           						</div></div>
           						</td></tr><tr>
           						<td>Attestation du CA</td>
           						<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
										<input type="file" class="form-control" id="atca" name="atca"></div></div></td>
           					</tr>
           				</table>
           				</form>
           				<input type="button"  id="btnaddCA" class="btn btn-primary" value="Ajouter à la liste" style="margin-top:1em;margin-bottom:1em;  margin-left: 34em;">
           				<fieldset>
           					<legend>Chiffre d'affaires par année</legend>
           					<table width=100% id="tableauCA">
           						<thead>
           							<tr>
           								<th>Année</th>
           								<th>Montant du chiffre d'affaires TTC</th>
           								<th>Attestation du CA</th>
           								<th>options</th>
           							</tr>
           						</thead>
           						<tbody id="addCA">
           						</tbody>
           					</table>
           				</fieldset>
           			</fieldset>
           			<hr>
           			
           			<fieldset>
           				<legend>Reparation du chiffre d'affaires</legend>
           				<form name="form51" id="form51">
           				<table width=80% align=center>
           					<tr>
           						<td width=20%>Secteur</td>
           						<td colspan=3><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-user"></i></span>
           							<select class="form-control" name="secteurrca" id="secteurrca">
           								<%  ps1=con.prepareStatement("Select * from Secteur");
            									 rs1=ps1.executeQuery();
            									while(rs1.next()){
            								%>
            									<option value="<%=rs1.getInt(1) %>"><%=rs1.getString(2) %></option>
            								<% } %>
           								
           							</select></div></div>
           						</td>
           					</tr>
           					<tr>
           						<td>Meilleur annee</td>
           						<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-calendar"></i></span>
           							<select name="MeilleurAnnee" id="MeilleurAnnee" class="form-control">
           										<% 
            								//int year = Calendar.getInstance().get(Calendar.YEAR);
            								for(int i=0;i<4;i++){
            							%>
            								<option value="<%=year-i %>"><%=year-i %></option>
            							<% } %>
           							</select></div></div>
           						</td>
           						<td width="10%">Montant CA</td><td> 
           						<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-money"></i></span>
										<input type="number" value="0.00" min=0 step="0.00" name="MCA" id="MCA" class="form-control"></div></div>
           						</td>
           					</tr>
           					<tr>
           						<td>Tableau justificatif</td>
           						<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
										<input type="file" class="form-control"></div></div></td>
           					</tr>
           				</table>
           				<input type="button" id="btnaddrca" class="btn btn-primary" value="Ajouter à la liste" style="margin-top:1em;margin-bottom:1em;  margin-left: 34em;">
           				  </form> <fieldset>
           					<legend></legend>
           					<table width=100% id="tableaurca">
           						<thead>
           							<tr>
           								<th>Secteur</th>
           								<th>Meilleure année</th>
           								<th>Montant CA</th>
           								<th>Tableau justificatif</th>
           								<th>Options </th>
           							</tr>
           						</thead>
           						<tbody id="addrca">
           						</tbody>
           					</table>
           				</fieldset>
           			</fieldset>
           		</div>
           	</div>
           <input type="button" value="Enregistrer et Continuer" id="save5" class="btn btn-success pull-right"> <input type="button" value="Precedent" id="precedent4" class="btn btn-danger pull-right"  style=" margin-right: 1em;">
           	
        </div>
        <div class="tab-pane" id="qd">
            <h1></h1>
            <div class="row">
            	<div class="col-md-12">
            		<fieldset>
            			<legend>Qualifications demandées par l'entreprise</legend>
            			<table>
            				<tr>
            					<td>Secteur</td>
            					<td><div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
											<select class="form-control" name="secteurQualification" id="secteurQualification">
												<option value="0">---- Secteur----</option>
            							<% ps1=con.prepareStatement("Select * from secteur");
            								rs1=ps1.executeQuery();
            								while(rs1.next()){
            							%>
            							<option value="<%=rs1.getInt(1) %>"><%=rs1.getInt(1)+"- "+rs1.getString(2) %></option>
            							<% } %>
            						</select></div></div>
            					
            					</td>
            				</tr>
            				<tr>
            					<td>Classe</td>
            					<td>
            						<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
											<select class="form-control" name="classe" id="classe">
            							<% ps1=con.prepareStatement("Select * from classe");
            								rs1=ps1.executeQuery();
            								while(rs1.next()){
            							%>
            							<option value="<%=rs1.getInt(1) %>"><%=rs1.getString(2) %></option>
            							<% } %>
            						</select></div></div>
            					</td>
            				</tr>
            				            				<tr>
            					<td>Basé sur</td>
            					<td>
            						<div class='form-group'>
									<div class='input-group'>
										<span class='input-group-addon'> <i class="fa fa-file"></i></span>
											<select class="form-control" name="baseQ" id="baseQ">
            							<option value="0">Capital</option>
            							<option value="1">C.A</option>
            						</select></div></div>
            					</td>
            				</tr>
            			</table>
            			
            		</fieldset>
            		<form name="form6" id="form6">
            		<fieldset>
            			<legend>Qualifaications demandées</legend>
            			<table id="tableauQualifaication" class="table table-striped table-bordered">
            				
            			</table>
            			<input type="button" id="btnAjouterQ" class="btn btn-primary" value="Ajoute à la liste">
            		</fieldset>
            		</form>
            		<br>
            		<table style="width:100%" id="tableauQualifaicationD">
            			<thead>
            				<tr>
            					<th>Secteur</th>
            					<th>Q. Definitive</th>
            					<th>Q. Provisoire</th>
            					<th>Classe</th>
            					<th>Basé sur</th>
            					<th>Action</th>
            				</tr>
            			</thead>
            		</table>
            	</div>
            </div>
            <input type="button" value="Enregistrer et Continuer" id="save6" class="btn btn-success pull-right"> <input type="button" value="Precedent" id="precedent5" class="btn btn-danger pull-right"  style=" margin-right: 1em;">
            
        </div>
        
        <!-- Modal pour les messages -->
        <div id="modalo" class="modal fade" tabindex="1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" name="signin1" id="signin1">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Message de confirmation</h4>
                    </div>
                    <div class="modal-body" >
                        <div class="row">
                            <div class="col-md-2"  ></div>
                            <div class="col-md-10" id="ecrit">
                                   <p>
                                   	Votre dossier a été ajoute avec succès.
                                   </p>
                            </div>
                        </div>
                    </div>
                          <div class="modal-footer" style='height:45px' >
                                <button type="button" id='ok' class="btn btn-success" style='margin-top:-10px;color:white' data-dismiss="modal">ok</button>
                            </div>
                            </form>
                </div>
                <!-- End of Modal content -->
            </div>
            </div>
            <!-- End of Modal dialog -->
        </div>
    <!-- Fin du modal -->
          	</div>
          </div>

        </section>

        
      </div><!-- /.content-wrapper -->
      <jsp:include page="footer.jsp" />
   
      	<script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datepicker.fr.js" charset="utf-8"></script>
		<script src="js/jquery.validate.js" type="text/javascript"></script>
      <script>
      
  		jQuery.validator.addMethod("phone", function (phone_number, element) {
              phone_number = phone_number.replace(/\s+/g, "");
              return this.optional(element) || phone_number.length > 9 && phone_number.match(/^[0-9-+]+$/);
          }, "Veuillez saisir un numéro de téléphone valide.");
  		jQuery.validator.setDefaults({
  		  debug: true,
  		  success: "valid"
  		});
  	    $('#form1').validate({ // initialize the plugin
  	        rules: {
  	        	type: {
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
  	    $('#form33').validate({ // initialize the plugin
  	        rules: {
  	        	mois0: {
                      required: true
                  },  	        	mois1: {
                      required: true
                  }
                  ,  	        	mois2: {
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
  	  $('#form4').validate({ // initialize the plugin
	        rules: {
	        	q: {
                    required: true,
                    min:1
                },
                pu:{
                	required: true,
                    min:1
                },
                desc:{
                	required: true,
                	minlength:8
                },
                pja:{
                	required:true
                },
                anneeAcquisition:{
                	required:true,
                	min:2000,
                	max:2015
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
  	    $('#form32').validate({ // initialize the plugin
  	        rules: {
  	        	nbmasd: {
                      required: true,
                      min:1
                  }
  	    		,msadh:{
  	    			 required: true,
                     min:1
  	    		},
  	    		ams:{
  	    			required:true
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
  	    $('#form5').validate({ // initialize the plugin
  	        rules: {
  	        	AnneeCA: {
                      required: true,
                     
                  }
  	    		,MCATTC:{
  	    			 required: true,
                     min:1
  	    		},
  	    		atca:{
  	    			required:true
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
  	    $('#form31').validate({ // initialize the plugin
  	        rules: {
  	        	nompe: {
                      required: true,
                      minlength:3
                  },
                  prenompe : {
                      required: true,
                      minlength:3
                  },
                  cnsspe: {
                      required: true,
                      
                  },numpe:{
                	  required: true,
                  },dateDiplome :{
                	  required: true,
                  },dateRecrutement :{
                	  required: true,
                  },cv :{
                	  required: true,
                  },filediplome:{
                	  required: true,
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
  	    $('#form2').validate({ // initialize the plugin
  	        rules: {
  	        	nom: {
                      required: true,
                      minlength:3
                  },
  	    		tel:{
  	    			 phone: true,
                     required: true
  	    		},
  	    	   email: {
                   required: true
               },
  	    		fax:{
  	    			 phone: true,
                     required: true
  	    		},
  	    		su:{
  	    			 required: true
  	    		},
  	    		adresse:{
  	    			required: true,
  	    			 minlength:10
  	    		},
  	    		tp:{
  	    			required:true,
  	    			min:0
  	    		},
  	    		rc:{
  	    			required:true,
  	    		},
  	    		cnss:{
  	    			required:true,
  	    		},
  	    		ifa:{
  	    			required:true,
  	    		},
  	    		cs:{
  	    			required:true,
  	    			min:100,
  	    		},
  	    		pm:{
  	    			required:true,
  	    			min:10,
  	    		},
  	    		dateCreation:{
  	    			required:true,
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
      
			$("#dateCreation").datepicker({

				format : 'yyyy-mm-dd',
				endDate : '2015-01-01',
				language : 'fr'
			//autoclose: true
			});
			$("#dateDiplome").datepicker({

				format : 'yyyy-mm-dd',
				endDate : '2013-01-01',
				language : 'fr'
			//autoclose: true
			});
			$("#dateRecrutement").datepicker({

				format : 'yyyy-mm-dd',
				startDate : '1965-01-01',
				language : 'fr'
			//autoclose: true
			});
			
			
			$( "#secteurQualification" ).change(function() {
				  var id=$(this).val();	 
				  $.ajax({
						type : "post",
						url : "getqualification", //process to mail
						data : {
							idd:id
						},
						success : function(response) {
							
							for(i=0;i<response.length;i++)
								$("#tableauQualifaication").append("<tr><td> "+$('#secteurQualification').val() +"."+response[i].id+" "+response[i].nom+"</td><td><input type='radio' name='Q"+response[i].id+"' required checked>  Provisoire</td><td><input type='radio' name='Q"+response[i].id+"' required  >  Définitive</td></tr>");
						},
						error : function() {
							console.log("erreur");
						}
				  });
			});
			$( "#secteur" ).change(function() {
				//alert($(this).val());
				$("#soussecteur").html("");
				$("#soussecteur").append("<option value='0'>Sous-Secteur</option>");
				$("#branche").html("");
				$("#branche").append("<option value='0'>Branche</option>");
				  var id=$(this).val();	 
				  $.ajax({
						type : "post",
						url : "getsoussecteur", //process to mail
						data : {
							idd:id
						},
						success : function(response) {
							
							for(i=0;i<response.length;i++)
								$("#soussecteur").append("<option value='"+response[i].id+"'>"+response[i].nom+"</option>");
						},
						error : function() {
							console.log("erreur");
						}
				  });
	
			});	
			$( "#soussecteur" ).change(function() {
				//alert($(this).val());
				$("#branche").html("");
				$("#branche").append("<option value='0'>Branche</option>");
				  var id=$(this).val();	 
				  $.ajax({
						type : "post",
						url : "getbranche", //process to mail
						data : {
							idd:id
						},
						success : function(response) {
							
							for(i=0;i<response.length;i++)
								$("#branche").append("<option value='"+response[i].id+"'>"+response[i].nom+"</option>");
						},
						error : function() {
							console.log("erreur");
						}
				  });
	
			});	
		    $('#addmsa').click(function () {
		    	 if ($("#form32").valid()) {
		    		 var annee=$("#Annee").val();
		    		 var nbmasd=$("#nbmasd").val();
		    		 var msadh=$("#msadh").val();
		    		 
		        	 var t="<tr ><td>"+annee+"</td><td>"+nbmasd+"</td><td>"+msadh+"</td><td></td><td><button class='btn btn-danger'><span class='glyphicon glyphicon-remove-sign'></span></button><button class='btn btn-warning'><span class='glyphicon glyphicon-edit'></span></button></td></tr>";
		        	// if(secteur!="Secteur" )
		        	
		        		 $("#tabmsa").append(t);
		       		  $.ajax({
							type : "post",
							url : "addMasseEntreprise", //process to mail
							data : $("#form32").serialize(),
							success : function(response) {
						    	 console.log("ok");
							},
							error : function() {
								console.log("erreur");
							}
					  });
		    	 }
		    });
		    $('#addpe').click(function () {
		    	 if ($("#form31").valid()) {
		    		 var nom=$( "#nompe" ).val();
		        	 var prenom=$( "#prenompe" ).val();
		        	 var diplome =$( "#diplome option:selected" ).text();
		        	 var specialite=$( "#specialite option:selected" ).text();
		        	var num=$( "#numpe" ).val();
		        	var fonction=$( "#fonction option:selected" ).text();
		        	var cnss=$("#cnsspe").val();
		        	 var t="<tr ><td>"+nom+" "+prenom+"</td><td>"+diplome+"</td><td>"+specialite+"</td><td>"+num+"</td><td>"+fonction+"</td><td>"+cnss+"</td><td><button class='btn btn-danger'><span class='glyphicon glyphicon-remove-sign'></span></button><button class='btn btn-warning'><span class='glyphicon glyphicon-edit'></span></button></td></tr>";
		        	// if(secteur!="Secteur" )
		        	
		        		 $("#tabpe").append(t);
			    		  $.ajax({
								type : "post",
								url : "addEmployeEntrepr", //process to mail
								data : $("#form31").serialize(),
								success : function(response) {
							    	 console.log("ok");
								},
								error : function() {
									console.log("erreur");
								}
						  });
		    	 }
		    });
		    $('#btnaddmat').click(function () {
		    	console.log()
		    	 if ($("#form4").valid() && $("#catmat option:selected").text()!="Categorie materiel") {
		    		var catmat=$("#catmat option:selected").text();
		    		
		    		 var t="<tr><td>"+catmat+"</td><td>"+$("#desc").val()+"</td><td>"+$("#q").val()+"</td><td></td><td>"+$("#pu").val()+"</td><td>"+$("#anneeAcquisition").val()+"</td><td><button class='btn btn-danger'><span class='glyphicon glyphicon-remove-sign'></span></button></td></tr>";
		    		 $("#addmat").append(t);
		    		 
		    		  $.ajax({
							type : "post",
							url : "addMaterielEntreprise", //process to mail
							data : $("#form4").serialize(),
							success : function(response) {
						    	 console.log("ok");
							},
							error : function() {
								console.log("erreur");
							}
					  });
		    	 }else{
		    		 alert("Veuillez choissir une categorie");
		    	 }
		    		 
		    });
		    $('#btnaddCA').click(function () {
		    	 if ($("#form5").valid()) {
		    		var annee=$("#AnneeCA option:selected").text();
		    		
		    		 var t="<tr><td>"+annee+"</td><td>"+$("#MCATTC").val()+"</td><td></td><td><button class='btn btn-danger'><span class='glyphicon glyphicon-remove-sign'></span></button></td></tr>";
		    		 $("#addCA").append(t);
		    		  $.ajax({
							type : "post",
							url : "addCAEntreprise", //process to mail
							data : $("#form5").serialize(),
							success : function(response) {
						    	 console.log("ok");
							},
							error : function() {
								console.log("erreur");
							}
					  });
		    	 }
		    		 
		    });
		    $('#btnaddrca').click(function () {
		    	
		    	
		    		 var t="<tr><td>"+$("#secteurrca option:selected").text()+"</td><td>"+$("#MeilleurAnnee option:selected").text()+"</td><td>"+$("#MCA").val()+"</td><td></td><td><button class='btn btn-danger'><span class='glyphicon glyphicon-remove-sign'></span></button></td></tr>";
		    		 $("#addrca").append(t);
		    		 
		    		  $.ajax({
							type : "post",
							url : "addRepCAEntreprise", //process to mail
							data : $("#form51").serialize(),
							success : function(response) {
						    	 console.log("ok");
							},
							error : function() {
								console.log("erreur");
							}
					  });
		    	 
		    		 
		    });
		    $("#btnAjouterQ").click(function(){
		    	var rows = document.getElementById("tableauQualifaication").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
		    	//alert(""+rows);
		    	var i=0;
		    	var dev="";
		    	var prov="";
		    	console.log($("#secteurQualification").val());
		    	$('#tableauQualifaication tbody tr input[type=radio]').each(function() { 
		    		i++;
		    		if(i==1){
		    			if($(this).prop("checked")==true){
		    				var t=$(this).attr("name");
		    				dev+=$("#secteurQualification").val()+"."+t.split("Q")[1]+" ";
		    				
		    			}
		    		}
		    		if(i==2){
		    			
		    			if($(this).prop("checked")==true){
		    				var t=$(this).attr("name");
		    				prov+=$("#secteurQualification").val()+"."+t.split("Q")[1]+" ";
		    			}
		    			i=0;
		    		}
		    	});
		    	console.log("definitive : "+dev+" provaisoire : "+prov);
		    	$('#tableauQualifaicationD').append("<tr><td>"+$("#secteurQualification option:selected").text()+"</td><td>"+dev+"</td><td>"+prov+"</td><td>"+$("#classe option:selected").text()+"</td><td>"+$("#baseQ option:selected").text()+"</td></tr>");
		     	
		    	var x = document.getElementById("secteurQualification");
		    	x.remove(x.selectedIndex);
		    	
		    	var Parent = document.getElementById("tableauQualifaication");
		    	while(Parent.hasChildNodes())
		    	{
		    	   Parent.removeChild(Parent.firstChild);
		    	}
		    });
		    
		    $("#save4").click(function(){
		    	 var tbody = $("#tableaumat tbody");
		    	if( tbody.children().length == 0){
		    		alert("Veuillez Ajouter un materiel svp");
		    	}else{
		    		 $("#tab2").removeClass("active");
			    	 $("#mm").removeClass("active");
			    	 $("#tab3").addClass("active");
			    	 $("#mh").addClass("active");
		    	}
		    });
     $('#next').click(function () {
    	 if ($("#form1").valid()) {
	    	 $("#tab0").removeClass("active");
	    	 $("#td").removeClass("active");
	    	 $("#tab1").addClass("active");
	    	 $("#entreprise").addClass("active");
    	 }
     });
     $('#save2').click(function () {
    	 var tbody = $("#tableauEntreprise tbody");
    	 
    	 if ($("#form2").valid() && tbody.children().length>0) {
			  $.ajax({
					type : "post",
					url : "addEntreprise", //process to mail
					data : $("#form2").serialize(),
					success : function(response) {
				    	 $("#tab1").removeClass("active");
				    	 $("#entreprise").removeClass("active");
				    	 $("#tab2").addClass("active");
				    	 $("#mm").addClass("active");
					},
					error : function() {
						console.log("erreur");
					}
			  });

    	 }
     });
     $('#save3').click(function () {
    	 var tbody = $("#tableaumsa tbody");

    	
    	 if ($("#form33").valid() && tbody.children().length != 0) {
    		 $("#tab3").removeClass("active");
	    	 $("#mh").removeClass("active");
	    	 $("#tab4").addClass("active");
	    	 $("#cf").addClass("active");
    	 }
     });
     $('#save5').click(function () {
    	 var tbody = $("#tableauCA tbody");
		var tbody2=$("#tableaurca tbody");
    	
    	 if (tbody.children().length == 0 || tbody2.children().length == 0) {
    		 alert("Veuillez remplir les tableaux");
    	 }else{
    		 $("#tab4").removeClass("active");
	    	 $("#cf").removeClass("active");
	    	 $("#tab5").addClass("active");
	    	 $("#qd").addClass("active");
    	 }
     });
     $('#save6').click(function () {
    	 var tbody = $("#tableauQualifaicationD tbody");
    	
    	 if (tbody.children().length == 0) {
    		 alert("Veuillez remplir les tableaux");
    	 }else{
	    	 $("#tab5").removeClass("active");
	    	 $("#qd").removeClass("active");
	    //	 $("#tab6").addClass("active");
	    //	 $("#recap").addClass("active");
	    	  $.ajax({
					type : "post",
					url : "addDossier", //process to mail
					success : function(response) {
						console.log(response.ok);
						$("#ecrit").html("<p>    	Votre dossier a été ajoute avec succès. "+response.ok+"</p>");
				    	 $("#modalo").modal("show");
					},
					error : function() {
						console.log("erreur");
					}
			  });
    	 }
     });
     $('#precedent1').click(function () {
    	 $("#tab1").removeClass("active");
    	 $("#entreprise").removeClass("active");
    	 $("#tab0").addClass("active");
    	 $("#td").addClass("active");
     });
     $('#precedent2').click(function () {
    	 $("#tab2").removeClass("active");
    	 $("#mh").removeClass("active");
    	 $("#tab1").addClass("active");
    	 $("#entreprise").addClass("active");
     });
     $('#precedent3').click(function () {
    	 $("#tab3").removeClass("active");
    	 $("#mm").removeClass("active");
    	 $("#tab2").addClass("active");
    	 $("#mh").addClass("active");
     });
     $('#precedent4').click(function () {
    	 $("#tab4").removeClass("active");
    	 $("#cf").removeClass("active");
    	 $("#tab3").addClass("active");
    	 $("#mm").addClass("active");
     });
     $('#precedent5').click(function () {
    	 $("#tab5").removeClass("active");
    	 $("#qd").removeClass("active");
    	 $("#tab4").addClass("active");
    	 $("#cf").addClass("active");
     });
	

     $('#add').click(function () {
    	 var secteur=$( "#secteur option:selected" ).text();
    	 var Ssecteur=$( "#soussecteur option:selected" ).text();
    	 var branche=$( "#branche option:selected" ).text();
    	
    	 var t="<tr ><td>"+secteur+"</td><td>"+Ssecteur+"</td><td>"+branche+"</td><td> <button class='btn btn-danger'><span class='glyphicon glyphicon-remove-sign'></span></button></td></tr>";
     	if(secteur!="Secteur" && Ssecteur!="Sous-Secteur" && branche!="Branche")
    		 $("#addSecteur").append(t);
     });
	
     $('table').on('click', '.glyphicon-remove-sign', function(e){
    	 	
    	 	var r = confirm("Voulez vous vraiement supprimer ?");
    	 	if (r == true) {
    	 		 $(this).closest('tr').remove();
    	 	} else {
    	 	    console.log("ss");
    	 	}
     });

      </script>