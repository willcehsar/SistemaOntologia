<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.0.2.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/arbor/arbor.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/arbor/arbor-tween.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/arbor/graphics.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/arbor/renderer.js"></script>
   
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>

  
  <script type="text/javascript">      
      $(document).ready(function() {
        $("#enviar").click(function() {
            
          conceito = $("#conceito").val();            
          selecao = $("#selecao").val();
          tipoBusca = $("#tipoBusca").val();            
          var parameters = "conceito=" + conceito + "&selecao=" + selecao + "&tipoBusca=" + tipoBusca;
            
          $.getJSON("http://<%= request.getServerName() + ":" + request.getServerPort() %>/SistemaOntologia/ServletPercorrerOntologia", parameters, function(json){                                                                                
              desenhaGrafo(json);
          });
              
          return false;
                          
       });   
      });
   </script>
   
<script >     
       function desenhaGrafo(obj){ //obj é o json recebido como parâmetro
        
          /*  var canvas  = document.getElementById('quadro');
            if(!canvas.getContext) return;
            var ctx     = canvas.getContext('2d');
            var w       = canvas.width = canvas.height = 100;
            var drawn   = null;
            var d       = ctx.getImageData(0, 0, w, w); //image data 
            var len     = d.data.length;
            for(var i =0; i< len; i++) {
              if(!d.data[i]) {
                drawn = false;
              }else if(d.data[i]) {
                var gfx = arbor.Graphics('quadro')
                gfx.clearCanvas
              }
            }*/

            var sys = arbor.ParticleSystem()             
              sys.parameters({ gravity:false})                  
              //pega o canvas
              sys.renderer = Renderer('#quadro');
 
           var colour = [];            
                colour[0] = orange = "#EEB211",               
                colour[1] = purple = "#941e5e",
                colour[2] = limegreen = "#c1d72e",
                colour[3] = darkgreen = "#619b45",
                colour[4] = lightblue = "#009fc3",
                colour[5] = darkblue = "#21526a",
                colour[6] = pink = "#d11b67", 
                colour[7] = red = "#b01700";
        
           //adiciona o nó inicial
           var noInicial = sys.addNode('noInicial',{'color':colour[5], 
                                        'shape':'dot', 
                                        'radius':30,                                         
                                        'alpha':1,                                         
                                        'label': conceito = $("#conceito").val(),});              
              
           //adiciona o nó Final em um array noFinal[]   
           var noFinal = [];
           for(i=0; i<obj.length; i++){ 
               noFinal[i] = sys.addNode(obj[i].noFinal,
                {'label': obj[i].noFinal, 'color':colour[i], 'alpha': 0 });
           }
           
          //adiciona a aresta entre o noInicial, noFinal, passado os parametros 
          //para a configuração da aresta '{'length':.3, 'label':obj[i].tipoRelacionamento, 'directed':true}'
          var grafo;            
          for(i=0; i<obj.length; i++){ 
            grafo += sys.addEdge(noInicial, noFinal[i],{'length':0.1, 'label':obj[i].tipoRelacionamento, 'directed':true});               
          }

          //passa a variavel grafo(é um json)para ser desenhado o grafo
          sys.graft(grafo);

                  
        }; 
            

</script>
  
  
 
 <body>
     
     <div class="container-narrow">
     
     <div class="row-fluid marketing" style="margin: 60px 0 0 0;">   
     
     <jsp:include page="/includes/menu.jsp"/>
     
     <%-- <div class="jumbotron" style="padding: 0px;">
            <h1>Busca Visual</h1>
            <p class="lead">
                Visualização dos conceitos e relacionamentos em grafo
            </p>
        </div>--%>
     
     <form id="fomulario">         
         <table>
                <tr>
                    <td width="224">
                        <label>Conceito</label>
                    </td> 
                </tr>
                
                <tr>
                    <td> 
                        <input type="text" id ="conceito" name="conceito" style="width:260px;" />
                    </td>
                    
                    <input type="hidden"id="selecao" onchange="r"  value="r" />
                    <%--
                    <td width="236">
                       
                            <select name="select" id="selecao">
                                <option name="click" onchange="l" value="l">Busca por Livro</option>
                                <option name="click" onchange="r"  value="r">Busca por Relacionamento</option>
                            </select>                       
                    </td>
                    --%>
                    <td>
                    
                    <td>
                        <input type="submit" id="enviar"   name="botaoEnviar" value="Buscar" style="margin-bottom: 10px; margin-left: 30px;"
                               class="btn btn-success btn-large" />
                        
                        <input id="tipoBusca" value="visual" type="hidden"/>      
                    </td>                    
                </tr>
          </table>
       </form> 
     <%--canvas é onde o grafo será mostrado--%>
     <canvas id="quadro" width="900" height="500" ></canvas>
    <%--<jsp:include page="/includes/rodape.jsp"/> --%>
</body>
</html>
