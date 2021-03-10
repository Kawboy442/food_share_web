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
 * Servlet implementation class UsersCreateServlet
 */
@WebServlet("/users/create")
public class UsersCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsersCreateServlet() {
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

			User u = new User();

			u.setUser_name(request.getParameter("user_name"));
			u.setPassword(
					EncryptUtil.getPasswordEncrypt(
							request.getParameter("password"),
							(String)this.getServletContext().getAttribute("pepper")
							)
					);
			String password = request.getParameter("password");
			String againPassword = request.getParameter("password_again");

			u.setAdmin_flag(0);

			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			u.setCreated_at(currentTime);
			u.setUpdated_at(currentTime);
			u.setDelete_flag(0);

			List<String> errors = UserValidator.validate(u, password, againPassword, true, true);
			if(errors.size() > 0) {
				em.close();

				request.setAttribute("_token", request.getSession().getId());
				request.setAttribute("user", u);
				request.setAttribute("errors", errors);

				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/new.jsp");
				rd.forward(request, response);
			} else {
				em.getTransaction().begin();
				em.persist(u);
				em.getTransaction().commit();
				request.getSession().setAttribute("flush", "登録が完了しました。");
				em.close();

				response.sendRedirect(request.getContextPath() + "/users/index");
			}
		}
	}
}
