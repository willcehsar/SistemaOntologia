<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Catálogo Online - IFSP</title>
   
   </head>
   
    <body>    
        
        
    <div class="container-narrow">

     
      <div class="row-fluid marketing">
        
        <jsp:include page="/includes/menu.jsp"/>


         <div class="jumbotron">

              <h1>Ontologia IFSP</h1>
              <p class="lead">
                  Catálogo Online para Bibliotecas V 1.1
              </p>
              <a class="btn btn-large btn-success" href="buscaTextual.jsp">Busca Textual</a>
              <a class="btn btn-large btn-info" href="#">Busca Visual</a>

         </div>
          
      </div>

      <hr>

     <jsp:include page="/includes/rodape.jsp"/>   

    </div> <!-- /container -->
        
        
      
    </body>

</html>

