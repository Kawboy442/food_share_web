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
			query = "SELECT COUNT(u) FROM User AS u WHERE u.userName = :name"
			),
	@NamedQuery(
			name = "checkUserNameAndPassword",
			query = "SELECT u FROM User AS u WHERE u.deleteFlag = 0 AND u.userName = :name AND u.password = :pass"
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public Integer getAdminFlag() {
		return adminFlag;
	}

	public void setAdminFlag(Integer adminFlag) {
		this.adminFlag = adminFlag;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}
