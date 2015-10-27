package edu.gatech.cs6400.php.model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "User", catalog = "php")
public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	public User(String email, String password, String firstName, String lastName,
			Date birthDate,String role) {
		super();
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.birthDate = birthDate;
		this.role=role;
	}

	private Integer fhirId;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private Date birthDate;
	private Date lastLoginDate;
	private String role;
	
	public User() {
	}

	@Column(name = "fhirId", unique = true, nullable = true)
	public Integer getFhirId() {
		return this.fhirId;
	}

	public void setFhirId(Integer fhirId) {
		this.fhirId = fhirId;
	}

	@Column(name = "password", nullable = false)
	public String getPassword() {
		return password;
	}

	private void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "firstName", nullable = false)
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "lastName", nullable = false)
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Id
	@Column(name = "email", nullable = false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "birthDate")
	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LastLoginDate")
	public Date getLastLoginDate() {
		return this.lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	
	@Column(name = "Role", nullable = false)
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
