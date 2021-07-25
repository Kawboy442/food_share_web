package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "users")
@NamedQueries({
	@NamedQuery(
			name = "getAllUsers",
			query = "SELECT u FROM User AS u ORDER BY u.id DESC"
			),
	@NamedQuery(
			name = "getUsersCount",
			query = "SELECT COUNT(u) FROM User AS u"
			),
	@NamedQuery(
			name = "checkRegisteredUser",
			query = "SELECT COUNT(u) FROM User AS u WHERE u.user_name = :name"
			),
	@NamedQuery(
			name = "checkUserNameAndPassword",
			query = "SELECT u FROM User AS u WHERE u.delete_flag = 0 AND u.user_name = :name AND u.password = :pass"
			)
})
@Entity
public class User {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "user_name", nullable = false)
	private String userName;

	@Column(name = "thumbnailUrl", length = 1000, nullable = true)
	private String thumbnailUrl;

	@Column(name = "password", length = 64, nullable = false)
	private String password;

	@Column(name = "admin_flag", nullable = false)
	private Integer adminFlag;

	@Column(name = "created_at", nullable = false)
	private Timestamp createdAt;

	@Column(name = "updated_at", nullable = false)
	private Timestamp updatedAt;

	@Column(name = "delete_flag", nullable = false)
	private Integer deleteFlag;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUser_name() {
		return userName;
	}

	public void setUser_name(String user_name) {
		this.userName = user_name;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAdmin_flag() {
		return adminFlag;
	}

	public void setAdmin_flag(Integer admin_flag) {
		this.adminFlag = admin_flag;
	}

	public Timestamp getCreated_at() {
		return createdAt;
	}

	public void setCreated_at(Timestamp created_at) {
		this.createdAt = created_at;
	}

	public Timestamp getUpdated_at() {
		return updatedAt;
	}

	public void setUpdated_at(Timestamp updated_at) {
		this.updatedAt = updated_at;
	}

	public Integer getDelete_flag() {
		return deleteFlag;
	}

	public void setDelete_flag(Integer delete_flag) {
		this.deleteFlag = delete_flag;
	}

}
