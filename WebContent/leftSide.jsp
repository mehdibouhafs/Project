	<%@ page import="javax.servlet.http.HttpSession" %> 
<%
HttpSession session1=request.getSession();
String admin=(String)session1.getAttribute("login");

%>
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
            	<% if(admin.equals("admin")){ %>
              <img src="dist/img/user1-128x128.jpg" class="img-circle" alt="User Image" />
              <%}else{ %>
              <img src="dist/img/avatar-homme-150x150.jpg" class="img-circle" alt="User Image" />
              <%} %>
            </div>
            <div class="pull-left info">
            <% if(admin.equals("admin")){ %>
              <p>Cher Administrateur</p>
			<% }else{ %>
				
				<p>Espace Entreprise</p>
			<%} %>
              <a href="#"><i class="fa fa-circle text-success"></i> Disponible </a><a href="index.jsp"><font color="red">Deconnexion</font></a>
            </div>
          </div>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">Menu Principale</li>
            <li class="active treeview">
    
              <a href="Accueil.jsp">
                <i class="fa fa-dashboard"></i> <span>Accueil</span>
              </a>
           
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-folder-open"></i>
                <span>Mes Dossiers</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
              <% if(!admin.equals("admin")){ %>
              
                <li><a href="addDossier.jsp"><i class="fa fa-circle-o"></i> Preparer dossier</a></li>
                <% }
              		if(!admin.equals("root")){ %>
                <li><a href="ListeDossier.jsp"><i class="fa fa-circle-o"></i> Suivre dossier</a></li>
                <% }if(!admin.equals("admin") && !admin.equals("root")){ %>
                <li><a href="telechargerCertificat.jsp"><i class="fa fa-circle-o"></i>  Telecharger le certificat</a></li>
              	<%} %>
              </ul>
            </li>
            <li class="treeview">
              
              <a href="#">
                <i class="fa fa-user-md"></i>
                <span>Mon compte</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              
              <ul class="treeview-menu">
                <li><a href="information.jsp"><i class="fa fa-circle-o"></i> Gerer Mon compte</a></li>
                <li><a href="modifierpassword.jsp"><i class="fa fa-circle-o"></i> Modifier mot de passe</a></li>
              </ul>
             
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>
