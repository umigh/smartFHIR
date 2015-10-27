package edu.gatech.cs6400.php.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import edu.gatech.cs6400.php.dao.UserDao;
import edu.gatech.cs6400.php.model.User;

@Namespace("/")
@ResultPath(value = "/")
@Action(value = "login", results = {
		@Result(name = "success", location = "Patient_Registration.html"),
		@Result(name = "error", location = "error.jsp") })
public class LoginAction extends ActionSupport {
	private String email;
	private String pwd;
	
	private String firstName;
	private String lastName;
	private User user;

	public String execute() {
		boolean validUser = false;
		HttpServletRequest request = ServletActionContext.getRequest();
		email=request.getParameter("email");
		pwd=request.getParameter("pwd");
		if (getEmail() != null && getPwd() != null) {
			UserDao dao = new UserDao();
			User user = dao.getUserByEmail(getEmail());
			if (user != null && user.getPassword().equals(getPwd())) {
				this.user=user;
				validUser = true;
			}
		}

		if (validUser)
			return SUCCESS;
		else
			return ERROR;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}