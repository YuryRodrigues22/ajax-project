package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.Usuario;


@WebServlet("/pages/ServletAutenticacao")
public class ServletAutenticacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletAutenticacao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deslogar = request.getParameter("deslogar");
		
		if(Boolean.parseBoolean(deslogar)) {
			
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			session.invalidate();
			
			response.sendRedirect("../index.jsp");
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");
		
		if(login.equals("admin") && senha.equals("123")) {
			
			Usuario usuario = new Usuario();
			usuario.setLogin(login);
			usuario.setSenha(senha);
			
			//Adiciona Usuario na sessao
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session =  req.getSession();
			session.setAttribute("usuario", usuario);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		} else {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/autenticar.jsp");
			dispatcher.forward(request, response);
			
			
		}
		
	}

}
