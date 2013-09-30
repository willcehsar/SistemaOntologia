<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.0.2.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/vivagraph/vivagraph.min.js.js"></script>
        
        <title>Catálogo</title>
        
     <script type="text/javascript">
      $(document).ready(function() { 
          
        $("#enviar").click(function() {
            
            conceito = $("#conceito").val();
            selecao = $("#selecao").val();
                $.ajax({
                    type : "POST",
                   
                    //url : "http://localhost:8084/SistemaOntologia/ServletPercorrerOntologia",
                    //Esse comando abaixo pega o servidor(IP local) e a porta dinamicamente
                    url : "http://<%= request.getServerName() + ":" + request.getServerPort() %>/SistemaOntologia/ServletPercorrerOntologia",
                    data : "conceito=" + conceito + "&selecao=" + selecao,                    
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
   
   
   <script type="text/javascript">
        function criarGrafo() { 
            var graph = Viva.Graph.graph();

            // Construct the graph
            graph.addNode('anvaka', {url : 'https://secure.gravatar.com/avatar/91bad8ceeec43ae303790f8fe238164b'});
            graph.addNode('manunt', {url : 'https://secure.gravatar.com/avatar/c81bfc2cf23958504617dd4fada3afa8'});
            //graph.addNode('thlorenz', {url : 'https://secure.gravatar.com/avatar/1c9054d6242bffd5fd25ec652a2b79cc'});
            //graph.addNode('bling', {url : 'https://secure.gravatar.com/avatar/24a5b6e62e9a486743a71e0a0a4f71af'});
            //graph.addNode('diyan', {url : 'https://secure.gravatar.com/avatar/01bce7702975191fdc402565bd1045a8?'});
            //graph.addNode('pocheptsov', {url : 'https://secure.gravatar.com/avatar/13da974fc9716b42f5d62e3c8056c718'});
            //graph.addNode('dimapasko', {url : 'https://secure.gravatar.com/avatar/8e587a4232502a9f1ca14e2810e3c3dd'});
            
            <c:forEach  var="livro" items="${livros}">
               graph.addNode(${livro.titulo}, {url : 'https://secure.gravatar.com/avatar/8e587a4232502a9f1ca14e2810e3c3dd'});
               
               graph.addLink(${livro.titulo}, 'java');
            </c:forEach>
            
            graph.addLink('anvaka', 'manunt');
            

            // Set custom nodes appearance
            var graphics = Viva.Graph.View.svgGraphics();
            graphics.node(function(node) {
                   // The function is called every time renderer needs a ui to display node
                   return Viva.Graph.svg('image')
                         .attr('width', 24)
                         .attr('height', 24)
                         .link(node.data.url); // node.data holds custom object passed to graph.addNode();
                })
                .placeNode(function(nodeUI, pos){
                    // Shift image to let links go to the center:
                    nodeUI.attr('x', pos.x - 12).attr('y', pos.y - 12);
                });

            var renderer = Viva.Graph.View.renderer(graph, 
                {
                    graphics : graphics
                });
            renderer.run();
        }
    
    
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
                    <td <td width="1728">>${percorre.noFinal}</td>
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
  
  
 
 