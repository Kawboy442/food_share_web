package controllers.users;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import models.validators.UserValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class UsersUpdateServlet
 */
@WebServlet("/users/update")
public class UsersUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsersUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _token = (String)request.getParameter("_token");
		if(_token != null && _token.equals(request.getSession().getId())) {
			EntityManager em = DBUtil.createEntityManager();

			User u = em.find(User.class, (Integer)(request.getSession().getAttribute("user_id")));

			// ログインしているユーザー以外の情報を編集しようとしていないか
			// 不正アクセスのチェックを行う
			Boolean unauthorizedAccessCheckFlag = true;
			if(u.getId().equals(request.getParameter("sessionScope.login_user.id"))) {
				unauthorizedAccessCheckFlag = false;
			}

			// 現在の値と異なるユーザー名が入力されていたら
			// 重複チェックを行う指定をする
			Boolean userNameDuplicateCheckFlag = true;
			if(u.getUser_name().equals(request.getParameter("user_name"))) {
				userNameDuplicateCheckFlag = false;
			} else {
				u.setUser_name(request.getParameter("user_name"));
			}

			// パスワード欄に入力があったら
			// パスワードの入力値チェックを行う指定をする
			Boolean passwordCheckFlag = true;
			String password = request.getParameter("password");
			String againPassword = request.getParameter("password_again");
			if(password == null || password.equals("")) {
				passwordCheckFlag = false;
			} else {
				u.setPassword(
						EncryptUtil.getPasswordEncrypt(
								password,
								(String)this.getServletContext().getAttribute("pepper")
								)
						);
			}

			u.setUser_name(request.getParameter("user_name"));
			u.setUpdated_at(new Timestamp(System.currentTimeMillis()));
			u.setDelete_flag(0);

			List<String> errors = UserValidator.validate(u, u.getId(), againPassword, unauthorizedAccessCheckFlag, userNameDuplicateCheckFlag, passwordCheckFlag);
			if(errors.size() > 0) {
				em.close();

				request.setAttribute("_token", request.getSession().getId());
				request.setAttribute("user", u);
				request.setAttribute("errors", errors);

				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/edit.jsp");
				rd.forward(request, response);
			} else {
				em.getTransaction().begin();
				em.getTransaction().commit();
				em.close();
				request.getSession().setAttribute("flush", "更新が完了しました。");

				request.getSession().removeAttribute("user_id");

				response.sendRedirect(request.getContextPath() + "/users/index");
			}
		}
	}
}

