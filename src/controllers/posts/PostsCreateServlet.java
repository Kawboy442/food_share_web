package controllers.posts;

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

import models.Post;
import models.User;
import models.validators.PostValidator;
import utils.DBUtil;

/**
 * Servlet implementation class PostsCreateServlet
 */
@WebServlet("/posts/create")
public class PostsCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostsCreateServlet() {
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

			Post p = new Post();

			p.setUser((User)request.getSession().getAttribute("login_user"));

			p.setStore_name(request.getParameter("store_name"));
			p.setTitle(request.getParameter("title"));
			p.setContent(request.getParameter("content"));

			p.setEvaluation(Integer.parseInt(request.getParameter("evaluation")));

			p.setPhotoUrl1(request.getParameter("photoUrl1").replace("gs://", ""));
			p.setPhotoUrl2(request.getParameter("photoUrl2").replace("gs://", ""));

			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			p.setCreated_at(currentTime);

			p.setDelete_flag(0);

			List<String> errors = PostValidator.validate(p);
			if(errors.size() > 0) {
				em.close();

				request.setAttribute("_token", request.getSession().getId());
				request.setAttribute("post", p);
				request.setAttribute("errors", errors);

				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/posts/new.jsp");
				rd.forward(request, response);
			} else {
				em.getTransaction().begin();
				em.persist(p);
				em.getTransaction().commit();
				em.close();
				request.getSession().setAttribute("flush", "登録が完了しました。");

				response.sendRedirect(request.getContextPath() + "/posts/index");
			}
		}
	}

}
