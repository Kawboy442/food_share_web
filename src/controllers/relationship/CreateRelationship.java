package controllers.relationship;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Relationship;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class CreateRelationship
 */
@WebServlet("/relationship")
public class CreateRelationship extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateRelationship() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 初回起動を判定するための処理
		// アプリケーションスコープから値を取得
		ServletContext sc = this.getServletContext();
		Relationship r = (Relationship) sc.getAttribute("follow");

		// 初回起動判定の続き
		// アプリケーションスコープに値がなければnewする
		if(r == null) {
			r = new Relationship();
			sc.setAttribute("follow", r);
		}

		String follow = request.getParameter("action");

		// いいねボタン押されたら
		if (follow != null) {
			EntityManager em = DBUtil.createEntityManager();

			User u = em.find(User.class, Integer.parseInt(request.getParameter("id")));

			em.close();

			request.setAttribute("user", u);

			HttpSession session = ((HttpServletRequest)request).getSession();
			User followerUser = (User)session.getAttribute("login_user");

			r.setFollowerUser(followerUser);
			r.setFollowedUser(u);
			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			r.setCreated_at(currentTime);
			r.setUpdated_at(currentTime);
		}

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/show.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
