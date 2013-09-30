
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : sobre
    Created on : 01/09/2013, 11:13:54
    Author     : Filipe
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Catálogo Online - Sobre</title>
   
   </head>
   
    <body>    
        
        
    <div class="container-narrow">

     
      <div class="row-fluid marketing">
        
      <jsp:include page="/includes/menu.jsp"/>
      
      
          
          <div class="row" style="margin-left:0;">
               
              <div class="span12">
               <h4 style="color: #999999;">
                 Nome
               </h4>
               <div class="span3">
                    <img class="img-polaroid" src="${pageContext.request.contextPath}/img/icon-user.png"
                             style="width:95px; "/>
                </div>
                             
                <div class="span8" style="text-align: justify;">
                   Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut 
                   labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                   laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                   voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
                   non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
                             
                </div>
                             
          </div>
          
     
       
          
      </div>

      <hr>

     <jsp:include page="/includes/rodape.jsp"/>   

    </div> <!-- /container -->
        
        
      
    </body>

</html>

