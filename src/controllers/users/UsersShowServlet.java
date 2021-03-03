package controllers.users;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class UsersShowServlet
 */
@WebServlet("/users/show")
public class UsersShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsersShowServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.createEntityManager();

		System.out.println("ユーザー名: " + request.getParameter("id"));
		User u = em.find(User.class, Integer.parseInt(request.getParameter("id")));

		em.close();

		request.setAttribute("user", u);

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/show.jsp");
		rd.forward(request, response);
	}

}
