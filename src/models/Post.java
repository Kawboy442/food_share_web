package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "posts")
@NamedQueries({
	@NamedQuery(
			name = "getAllPosts",
			query = "SELECT p FROM Post AS p ORDER BY p.id DESC"
			),
	@NamedQuery(
			name = "getPostsCount",
			query = "SELECT COUNT(p) FROM Post AS p"
			),
	@NamedQuery(
			name = "getAllActivePosts",
			query = "SELECT p FROM Post AS p WHERE p.delete_flag = 0 ORDER BY p.id DESC"
			),
	@NamedQuery(
			name = "getActivePostsCount",
			query = "SELECT COUNT(p) FROM Post AS p WHERE p.delete_flag = 0"
			),
	@NamedQuery(
			name = "getAllMyActivePosts",
			query = "SELECT p FROM Post AS p WHERE p.delete_flag = 0 AND p.user.id = :user_id ORDER BY p.id DESC"
			),
	@NamedQuery(
			name = "getMyActivePostsCount",
			query = "SELECT COUNT(p) FROM Post AS p WHERE p.delete_flag = 0 AND p.user.id = :user_id"
			)
})
@Entity
public class Post {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	@Column(name = "store_name", length = 255, nullable = false)
	private String store_name;

	@Column(name = "title", length = 255, nullable = false)
	private String title;

	@Lob
	@Column(name = "content", nullable = false)
	private String content;

	@Column(name = "evaluation", nullable = false)
	private Integer evaluation;

	@Column(name = "photoUrl1", length = 1000, nullable = true)
	private String photoUrl1;

	@Column(name = "photoUrl2", length = 1000, nullable = true)
	private String photoUrl2;

	@Column(name = "created_at", nullable = false)
	private Timestamp created_at;

	@Column(name = "delete_flag", nullable = false)
	private Integer delete_flag;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(Integer evaluation) {
		this.evaluation = evaluation;
	}

	public String getPhotoUrl1() {
		return photoUrl1;
	}

	public void setPhotoUrl1(String photoUrl1) {
		this.photoUrl1 = photoUrl1;
	}

	public String getPhotoUrl2() {
		return photoUrl2;
	}

	public void setPhotoUrl2(String photoUrl2) {
		this.photoUrl2 = photoUrl2;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public Integer getDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(Integer delete_flag) {
		this.delete_flag = delete_flag;
	}

}
