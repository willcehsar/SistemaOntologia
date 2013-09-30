<%-- 
    Document   : menu
    Created on : 25/07/2013, 21:14:58
    Author     : Filipe

    ****************************************
    ***INÍCIO DAS ATIVIDADES NA ONTOLOGIA***
    ***CRIAR MENU E RODAPÉ E COLOCAR O   ***
    ***BOOTSTRAP  2.3                    ***
    ****************************************

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

  
     <div class="masthead">
        <ul class="nav nav-pills pull-right active">
          <li class=""><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/buscaTextual.jsp">Busca Textual</a></li>
          <li><a href="${pageContext.request.contextPath}/buscaVisual.jsp">Busca Visual</a></li>
          <li><a href="${pageContext.request.contextPath}/index_bkp.jsp">Original</a></li>
          <li><a href="${pageContext.request.contextPath}/sobre.jsp">Sobre</a></li>
        </ul>
        <h3 class="muted">Catálogo Online</h3>
      </div>

      <hr>

         <!-- CSS - Estilos -->
    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css"/>
    

     <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 800px;
        margin-top: -80px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 30px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>

  