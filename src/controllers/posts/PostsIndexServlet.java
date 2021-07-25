package controllers.posts;

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
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class PostsIndexServlet
 */
@WebServlet("/posts/index")
public class PostsIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostsIndexServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.createEntityManager();

		int page;
		try{
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) {
			page = 1;
		}

		User u = em.find(User.class, Integer.parseInt(request.getParameter("id")));

		List<Post> posts = em.createNamedQuery("getAllMyActivePosts", Post.class)
				.setParameter("user_id", u.getId())
				.setFirstResult(15 * (page - 1))
				.setMaxResults(15)
				.getResultList();

		long posts_count = (long)em.createNamedQuery("getMyActivePostsCount", Long.class)
				.setParameter("user_id", u.getId())
				.getSingleResult();

		if(postsCount == 0){
			request.getSession().setAttribute("flush", "まだ投稿がありません。");
		}

		em.close();

		request.setAttribute("user", u);
		request.setAttribute("posts", posts);
		request.setAttribute("posts_count", postsCount);
		request.setAttribute("page", page);
		if(request.getSession().getAttribute("flush") != null) {
			request.setAttribute("flush", request.getSession().getAttribute("flush"));
			request.getSession().removeAttribute("flush");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/posts/index.jsp");
		rd.forward(request, response);
	}

}
