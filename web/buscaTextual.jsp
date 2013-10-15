<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.0.2.min.js"></script>
        
        <title>Catálogo</title>
        
     <script type="text/javascript">
      $(document).ready(function() { 
        $("#enviar").click(function() {
            
            conceito = $("#conceito").val();
            selecao = $("#selecao").val();
            tipoBusca = $("#tipoBusca").val();
                $.ajax({
                    type : "POST",
                   
                    //url : "http://localhost:8084/SistemaOntologia/ServletPercorrerOntologia",
                    //Esse comando abaixo pega o servidor(IP local) e a porta dinamicamente
                    url : "http://<%= request.getServerName() + ":" + request.getServerPort() %>/SistemaOntologia/ServletPercorrerOntologia",
                    data : "conceito=" + conceito + "&selecao=" + selecao + "&tipoBusca=" + tipoBusca,                    
                    success : function(html) {
                        $("#divAtualizar").replaceWith($('#divAtualizar', $(html)));  
                        $("#divAtualizar").css( "visibility", "visible" ); 
                        criarGrafo();
                        //se entrou aqui é true, então tem q mostrar a div, então usa o jquery pra mudar
                        //o css da div
                      
                    }
                 });                 
          return false;  
        });
      });   
      
    
    
   </script>
   </head>
   
   <body>    
        
        
    <div class="container-narrow">
    
     <div class="row-fluid marketing" style="margin: 60px 0 0 0;">   
       
      <jsp:include page="/includes/menu.jsp"/>
      
        
       <div class="jumbotron" style="padding: 0px;">
            <h1>Busca Textual</h1>
            <p class="lead">
                Busca dos conceitos e relacionamentos por texto
            </p>
        </div>
        
            
         
         
        
        <div align="center" style="margin-bottom: -20px;">
            
            
            <form id="fomulario">
                
            <table width="588" border="0">
              
                <tr>
                    <td width="224">
                        <label>Conceito</label>
                    </td> 
                    
                    <td width="106">
                        Tipos de Busca
                    </td>
                    
                </tr>
                
                <tr>
                    <td> 
                        <input type="text" id ="conceito" name="conceito" style="width:260px;" />
                    </td>
                    
                    <td width="236">
                       
                            <select name="select" id="selecao">
                                <option name="click" onchange="l" value="l">Busca por Livro</option>
                                <option name="click" onchange="r"  value="r">Busca por Relacionamento</option>
                            </select>
                       
                    </td>
                    
                    <td>
                        <input type="submit" id="enviar" name="botaoEnviar" value="Buscar" style="margin-bottom: 10px; margin-left: 30px;"
                               class="btn btn-success btn-large" />
                        
                        <input id="tipoBusca" value="textual" type="hidden"/>      
                    </td>
                    
                </tr>
                
                <tr>
                    
                    <td>
                        &nbsp;
                    </td>                    
                </tr>
         
         <p>&nbsp;</p>        
         </table>
       </form>  
                 
       <div id="divAtualizar" style="visibility: hidden;">         
        <table class="table table-bordered table-hover">
            
            <c:choose>
                <c:when test="${livros != null }">
                     <thead>
                        <th>
                            Autor
                        </th>
                        <th>
                            Título
                        </th>
                        <th>
                            Edição
                        </th>
                        <th>
                            Cidade
                        </th>
                        <th>
                            Editora
                        </th>
                        <th>
                            Ano
                        </th>
                        <th>
                            Páginas
                        </th>
                     </thead>
                </c:when>
                <c:otherwise>
                    <thead>
                    <th style="width: 120px;">
                            Nó inicial
                        </th>
                        <th>
                            Relacionamento
                        </th>
                        <th>
                            Nó final
                        </th>
                     </thead>
                </c:otherwise>
            </c:choose>
           
            <c:forEach  var="livro" items="${livros}">
               <tr>                    
                    <td width="500">${livro.autor}</td>                   
                    <td width="500">${livro.titulo}</td>
                    <td>${livro.edicao}</td>              
                    <td>${livro.cidade}</td>
                    <td>${livro.editora}</td>
                    <td>${livro.ano}</td>
                    <td>${livro.paginas}</td>
                </tr>
            </c:forEach>
       
            <c:forEach  var="percorre" items="${percorre}">          
                <tr> 
                    <td>${percorre.noInicial}</td>
                    <td>${percorre.tipoRelacionamento}</td>
                    <td <td width="1728">${percorre.noFinal}</td>
                </tr>
            </c:forEach>                         
          </table>
        </div>
            
            
        </div>    
      

      <hr style="margin: 30px 0;">
 
      </div>
      
     
     <jsp:include page="/includes/rodape.jsp"/>   

    </div> <!-- /container -->
        
        
      
    </body>

</html>
  
  
 
 