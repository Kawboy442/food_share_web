package controllers.search;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Post;
import utils.DBUtil;

/**
 * Servlet implementation class SearchResultServlet
 */
@WebServlet("/search/result")
public class SearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchResultServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.createEntityManager();

		int page;
		try{
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) {
			page = 1;
		}

		String storeName = request.getParameter("store_name");
		String userName = request.getParameter("user_name");
		int evaluation = Integer.parseInt(request.getParameter("evaluation"));

		StringBuilder postQueryBuilder = new StringBuilder("SELECT p FROM Post AS p WHERE p.delete_flag = 0 ");
		if(!storeName.equals("")) {
			postQueryBuilder.append("AND p.store_name LIKE '%" + storeName + "%'");
		} else if(!userName.equals("")) {
			postQueryBuilder.append("AND p.user.user_name LIKE  '%" + userName + "%'");
		} else if (evaluation != 0) {
			postQueryBuilder.append("AND p.evaluation = " + evaluation + " ");
		}
		postQueryBuilder.append("ORDER BY p.id DESC");
		String postQuery = postQueryBuilder.toString();

		List<Post> posts = em.createQuery(postQuery, Post.class)
				.setFirstResult(15 * (page - 1))
				.setMaxResults(15)
				.getResultList();

		StringBuilder postCountQueryBuilder = new StringBuilder("SELECT COUNT(p) FROM Post AS p WHERE p.delete_flag = 0 ");
		if(!storeName.equals("")) {
			postQueryBuilder.append("AND p.store_name LIKE '%" + storeName + "%'");
		} else if(!userName.equals("")) {
			postQueryBuilder.append("AND p.user.user_name LIKE  '%" + userName + "%'");
		} else if (evaluation != 0) {
			postQueryBuilder.append("AND p.evaluation = " + evaluation + " ");
		}
		String postCountQuery = postCountQueryBuilder.toString();

		long posts_count = (long)em.createQuery(postCountQuery, Long.class)
				.getSingleResult();

		em.close();

		request.setAttribute("posts", posts);
		request.setAttribute("posts_count", posts_count);
		request.setAttribute("page", page);
		if(request.getSession().getAttribute("flush") != null) {
			request.setAttribute("flush", request.getSession().getAttribute("flush"));
			request.getSession().removeAttribute("flush");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/search/result.jsp");
		rd.forward(request, response);
	}

}
