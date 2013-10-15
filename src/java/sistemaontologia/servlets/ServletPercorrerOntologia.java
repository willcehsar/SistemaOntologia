/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemaontologia.servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sistemaontologia.consultas.ConsultasBanco;
import sistemaontologia.entidade.Livro;
import sistemaontologia.entidade.PercorreConceito;


public class ServletPercorrerOntologia extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        
        RequestDispatcher requestDispatcher = null;
        List<PercorreConceito> percorre = null;
        
   //   String conceito = request.getParameter("conceito");
      String acao = request.getParameter("selecao");
      
      try {  
        if(acao.equals("l")) {
        
            //cria uma instância da classe ConsultaBanco
            ConsultasBanco consulta = new ConsultasBanco();
            //cria uma lista de livros para receber a lista que o metodo buscarLivro vai retornar
            List<Livro> livros = new ArrayList<Livro>();
            //livros recebe a lista depois que o request.getParameter("camposBuscar")
            //ter sido passado como parametro String para o metodo buscarLivro
            livros = consulta.buscarLivro(request.getParameter("conceito"));
            //passa os atributos para o todos, onde o index.jsp irá pegar os valores
            request.setAttribute("livros", livros);
            
            
            //redireciona a página para a pégina inicial (index.jsp)
            requestDispatcher = request.getRequestDispatcher("/buscaTextual.jsp");  
            requestDispatcher.forward(request, response);
            
        }else if(acao.equals("r")) {
            
            ConsultasBanco consulta = new ConsultasBanco();
           
            percorre = new ArrayList<PercorreConceito>();
            
            percorre = consulta.bucarConceitos(request.getParameter("conceito"));
            
            //redireciona o resultado de acordo com a requisição da página
            String pagina = request.getParameter("tipoBusca");            
            if(pagina.equals("textual")){
                
                request.setAttribute("percorre", percorre);
                requestDispatcher = request.getRequestDispatcher("/buscaTextual.jsp");              
                requestDispatcher.forward(request, response);       
                
            } else if(pagina.equals("visual")) {                
               
               //retorna um JSON para o javascript
               String json = new Gson().toJson(percorre);                
               response.setContentType("application/json");
               response.setCharacterEncoding("UTF-8");
               response.getWriter().write(json);            
            }
        }//fim do if        
      }catch (Exception exc){
          exc.printStackTrace();
      }finally {            
      
      }//fim do finally
       
                
  }// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
             processRequest(request, response); 
             
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletPercorrerOntologia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletPercorrerOntologia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
