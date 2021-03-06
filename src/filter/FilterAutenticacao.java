package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import user.Usuario;

@WebFilter(urlPatterns = {"/pages/*"})
public class FilterAutenticacao implements Filter{

	@Override
	public void destroy() {

	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String urlAutenticar = req.getServletPath();
		
		Usuario usuario = (Usuario)	session.getAttribute("usuario");
		
		if(usuario == null && !urlAutenticar.equalsIgnoreCase("/pages/ServletAutenticacao")) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/autenticar.jsp?url=" + urlAutenticar);
			dispatcher.forward(request, response);
			return;//Redirecionar o Processo
		}
		
		chain.doFilter(request, response);
		
	}
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
}
