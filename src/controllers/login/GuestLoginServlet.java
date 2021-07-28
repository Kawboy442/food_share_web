package controllers.login;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/guestLogin")
public class GuestLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GuestLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	// ログイン画面を表示
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("_token", request.getSession().getId());
		request.setAttribute("hasError", false);
		if(request.getSession().getAttribute("flush") != null) {
			request.setAttribute("flush", request.getSession().getAttribute("flush"));
			request.getSession().removeAttribute("flush");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// ログイン処理を実行
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_name = "Guest";
		String plain_pass = "GuestPassword";

		User u = null;

		EntityManager em = DBUtil.createEntityManager();

		String password = EncryptUtil.getPasswordEncrypt(
				plain_pass,
				(String)this.getServletContext().getAttribute("pepper")
				);

		try {
			u = em.createNamedQuery("checkUserNameAndPassword", User.class)
					.setParameter("name", user_name)
					.setParameter("pass", password)
					.getSingleResult();
		} catch(NoResultException ex) {}

		em.close();

		// 認証できたらログイン状態にしてトップページへリダイレクト
		request.getSession().setAttribute("login_user", u);

		request.getSession().setAttribute("flush", "ログインしました。");
		response.sendRedirect(request.getContextPath() + "/");
	}
}
