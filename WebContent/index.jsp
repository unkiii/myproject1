<%@page import="java.util.List"%>
<%@page import="tablas.Person"%>
<%@page import="model.PersonDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="es">

    <head>
<script type="text/javascript">
function marcarTot(source) {
	  checkboxes = document.getElementsByName('NIF');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		}
	}
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUD</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,300,100,100italic,300italic,400italic,700,700italic">
        
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/media-queries.css">
		<link rel="stylesheet" href="css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        
        
        
        

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        
        
        
        
        
        
        
        </head>

    <body style="color:white;">
    

    <div class="row text-center pad-top">
                                
    
    
    
    
    
    
    
        <!-- Coming Soon -->
        <div class="coming-soon">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2 class="wow fadeInLeftBig">Gestió</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <main>
  
		  <input id="tab1" type="radio" name="tabs" checked>
		  <label for="tab1">Llistat</label>
		    
		  <input id="tab2" type="radio" name="tabs">
		  <label for="tab2">Afegir</label>
		    
		  <input id="tab3" type="radio" name="tabs">
		  <label for="tab3">Modificar</label>
		    
		  <input id="tab4" type="radio" name="tabs">
		  <label for="tab4">Eliminar</label>
		    
		  <section id="content1">
		    <p>
		    
		    <table class="table table-hover table-inverse">
	            <thead>
	                <tr>
	                 <th style="text-align: center;">NIF</th>
	                 <th style="text-align: center;">Nom</th>
	                 <th style="text-align: center;">Adreça</th>
	                 <th style="text-align: center;">Edat</th>
	                </tr>
	            </thead>
	            <tbody>
	                <%
	                	PersonDAO pdao=new PersonDAO();
				  		List<Person> p = null;
				 
	            		try {
	            			p = pdao.obtenListaContactos();
	            		} catch (Exception e) {
	            			e.printStackTrace();
	            		}
	            		for(Person per:p){
	                %>
               		<tr>
               			<td>
               				<%=per.getId()%>
               			</td>
               			<td>
               				<%=per.getName()%>
               			</td>
               			<td>
               				<%=per.getAddress()%>
               			</td>
               			<td>
               				<%=per.getAge()%>
               			</td>

               		</tr>
               		 <% } %>	
	            </tbody>
	        </table>

		    </p>
		 
		  </section>
		    
		  <section id="content2">
		    <p>
		       <form method="post" name="Form" action="/ProjecteHibernateWeb/afegirPersona">
                                
	               <table align="center">
	                   <tr>
	                       <td style="text-align: left;">NIF: </td>
	                       <td>&nbsp; <input type="text" class="form-control"  name="nif" size="25" maxlength="8"  required/></td>
	                   </tr>
	                   <tr>
	                       <td style="text-align: left;">Nom: </td>
	                       <td>&nbsp; <input type="text" class="form-control"  name="nom"  size="25" required/></td>
	                   </tr>
						<tr>
                            <td style="text-align: left;">Direccio: </td>
                            <td>&nbsp; <input type="text" class="form-control"  name="direccio"   size="25" required/></td>
	                   </tr>
	                   <tr>
	                       <td style="text-align: left;">Edat: </td>
	                       <td>&nbsp; <input type="text" class="form-control"  name="edat"   size="25" maxlength="3" required/></td>
	                   </tr>
	                   <tr>
	                       <td>&nbsp;<br>&nbsp;</td>
	                   </tr>
	                   <tr>
	                       <th> </th>
	                       <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Afegir" class="btn btn-primary"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Esborrar" class="btn btn-danger"/></th>
	                   </tr>
	               </table>
	           </form>
		    </p>
		  </section>
		    
		  <section id="content3">
		    <p>
		       <form method="post" name="mForm" action="/ProjecteHibernateWeb/modificarPersona">
                                
	               <table>
	                   <tr>
	                       <td style="text-align: left;">NIF: </td>
	                       <td>&nbsp; <input type="text" class="form-control"  name="mnif" size="25" maxlength="8"  required/></td>
	                   </tr>
	                  
	
	                   <tr>
	                       <td style="text-align: left;">Nom: </td>
	                       <td>&nbsp; <input type="text" class="form-control"  name="mnom"  size="25" required/></td>
	                   </tr>
						<tr>
                           <td style="text-align: left;">Direccio: </td>
                           <td>&nbsp; <input type="text" class="form-control"  name="mdireccio"   size="25" required/></td>
	                   </tr>
	                   <tr>
	                       <td style="text-align: left;">Edat: </td>
	                       <td>&nbsp; <input type="text" class="form-control"  name="medat"   size="25" maxlength="3" required/></td>
	                   </tr>
	                   <tr>
	                       <td>&nbsp;<br>&nbsp;</td>
	                   </tr>
	                   <tr>
	                       <th> </th>
	                       <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Modificar" class="btn btn-primary"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Esborrar" class="btn btn-danger"/></th>
	                   </tr>
	               </table>
	           </form>
 

		    </p>
		  </section>
		    
		  
		  
		  <section id="content4">
	
		      
		      
		     
		      
		      
		      
		      <div class="container">

		
        
        <div class="col-md-12">
        <div class="table-responsive">

			                
              <table id="mytable" width="60%" class="table-hover table-inverse">
                  
                   <thead>
	                   <th style="text-align: center;">DNI</th>
	                   <th style="text-align: center;">Nom</th>
	                   <th style="text-align: center;">Direccio</th>
	                   <th style="text-align: center;">Edat</th>                  
	                   <th style="text-align: center;">Eliminar</th>
                   </thead>
                   
                 
                   
                   
                   <tbody>
                  	<tr> <td colspan=5>&nbsp;</td> </tr>
	                   <%
	                   
	                   	List<Person> per=pdao.obtenListaContactos();
	                   
	                   	for(Person pq:per){
	                   %>
	                   	<tr>
	                   	
	                   		<td>
	                   			<%= pq.getId() %>
	                   		</td>
	                   		<td >
	                   			<%= pq.getName() %>
	                   		</td>
	                   		<td >
	                   			<%= pq.getAddress() %>
	                   		</td>	
	                   		<td >
	                   			<%= pq.getAge() %>
	                   		</td>
	                   		
	                   		<td>
		                   		<form name="form" method="Post" action="/ProjecteHibernateWeb/eliminarPersona" class="table-link">
		            				<input type="hidden" name="NIF" value="<%=pq.getId()%>">
		            				<button type="submit" class="btn btn-danger btn-xs" value="Eliminar" data-title="Delete" data-toggle="modal" data-target="#delete" >
			   				 			<span class="glyphicon glyphicon-trash"></span>
			   				 		</button>
		            			</form>
	                   		</td>
	                   		
	                   	
   				 			
	                   		
	                   			
	                   		
	                   	</tr>
	                  <tr> <td colspan=5>&nbsp;</td> </tr>
	                   	
	                   	
	                   <% 	
	                   	}
	                   %>
	               </tbody>
                   
                   
                   
                   
    
        
</table>

                
            </div>
            
        
	</div>
</div>







    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
		      
		      
		      
		      
		      
		      
		      
		      
		      
		      
		   
		  </section>
    
	</main>
        
        
        
       
        
        
        
        
        <!-- Footer -->
        
        
        <footer>
	        <div class="container" style="padding: 0.0001%; width: 80%;">
	            <div class="row">
	                <div class="col-sm-7 footer-copyright">
	                	<div >
	                    <p>&copy; By Fran <a href="#"></a></p>
	                    </div>
	                </div>
	            </div>
	        </div>
        </footer>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.10.2.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
