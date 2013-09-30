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
                $.ajax({
                    type : "POST",
                    url : "http://localhost:8080/SistemaOntologia/ServletPercorrerOntologia",
                    data : "conceito=" + conceito + "&selecao=" + selecao,                    
                    success : function(html) {
                        $("#divAtualizar").replaceWith($('#divAtualizar', $(html)));                                              
                    }
                 });                 
          return false;  
        });
      });   
      
      function vai(){
      
      alert('Oi');
      }
    </script>        
   </head>
   
    <body>               
        <p><img src="ImagemCatalogo.png" width="1318" height="179" /></p>
        <div align="center">            
           
            <form id="fomulario">
            <table width="588" border="0">
              
                <tr>
                    <td width="224">
        
                        <label>Conceito</label>
                        <input type="text" id ="conceito" name="conceito" />
                    </td>
                    <td width="106">Tipos de Busca </td>
                    <td width="236">
                        <label>
                            <select name="select" id="selecao">
                                <option name="click" onchange="l" value="l">Busca por Livro</option>
                                <option name="click" onchange="r"  value="r">Busca por Relacionamento</option>
                            </select>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" id="enviar" name="botaoEnviar" value="Buscar" />
                        
                        <button onclick="vai()" value="Oi">Oi</button>
                    </td>
                    <td>
                        &nbsp;
                    </td>                    
                </tr>
          </div>
         <p>&nbsp;</p>        
         </table>
       </form>  
                 
       <div id="divAtualizar">         
        <table border="3">             
            <c:forEach  var="livro" items="${livros}">
               <tr>                    
                    <td width="500">autor: ${livro.autor}</td>                   
                    <td width="500">titulo: ${livro.titulo}</td>
                    <td>edição: ${livro.edicao}</td>              
                    <td>cidade: ${livro.cidade}</td>
                    <td>editora: ${livro.editora}</td>
                    <td>ano: ${livro.ano}</td>
                    <td>p: ${livro.paginas}</td>
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
    </body>

</html>
