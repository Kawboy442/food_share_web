package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String context_path = ((HttpServletRequest)request).getContextPath();
		String servlet_path = ((HttpServletRequest)request).getServletPath();

		if(!servlet_path.matches("/css.*") && !servlet_path.matches("/images.*") ) {       // CSSフォルダ内およびimagesフォルダ内は認証処理から除外する
			HttpSession session = ((HttpServletRequest)request).getSession();

			// セッションスコープに保存されたユーザー情報を取得
			User u = (User)session.getAttribute("login_user");

			switch (servlet_path) {
			case "/index.html":
			case "/users/new":
			case "/posts/index":
			case "/posts/show":
				break;
			case "users/index":
			case "users/show":
				if(u != null) {
					if(u.getAdmin_flag() == 0) {
						((HttpServletResponse)response).sendRedirect(context_path + "/");
						return;
					}
				}
				break;
			case "/login":  // ログイン画面について
				// ログインしているのにログイン画面を表示させようとした場合は
				// システムのトップページにリダイレクト
				if(u != null) {
					((HttpServletResponse)response).sendRedirect(context_path + "/");
					return;
				}
				break;
			default: // それ以外の画面について
				// ログアウトしている状態であれば
				// ログイン画面にリダイレクト
				if(u == null) {
					((HttpServletResponse)response).sendRedirect(context_path + "/login");
					return;
				}
				break;
			}
		}

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
