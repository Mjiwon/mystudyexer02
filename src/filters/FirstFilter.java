package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FirstFilter extends HttpFilter{
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();	
		String query = request.getQueryString();
		System.out.println("doFileter");
		HttpSession session = request.getSession();
		session.setAttribute("uri",uri);
		session.setAttribute("query", query);
		//		boolean check = (Boolean)session.getAttribute("auth");

		if(session.getAttribute("auth")!=null) {
			chain.doFilter(request, response);
			System.out.println("���عٺ�");
		}else {
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			System.out.println("���ظ�û�� ");
		}
		
		//request.getContextPath()+uri
	}

}
