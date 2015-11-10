package edu.gatech.cs6400.php.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.gatech.cs6400.php.dao.UserDao;
import edu.gatech.cs6400.php.model.User;

@SuppressWarnings("serial")
@Namespace("/")
@ResultPath(value = "/")
@Action(value = "login", results = {
		@Result(name = "login", location = "index.jsp"),
		@Result(name = "patient_dashboard", location = "patient_dashboard.jsp"),
		@Result(name = "provider_dashboard", location = "provider_dashboard.jsp"),
		@Result(name = "error", location = "page_500.jsp") })
public class LoginAction extends ActionSupport implements SessionAware{
	private String email;
	private String pwd;
	
	private String firstName;
	private String lastName;
	private User user;
	@SuppressWarnings("rawtypes")
	Map session = ActionContext.getContext().getSession();

	@SuppressWarnings("unchecked")
	public String execute() {
		boolean validUser = false;
		HttpServletRequest request = ServletActionContext.getRequest();
		email=request.getParameter("email");
		pwd=request.getParameter("pwd");
		if (getEmail() != null && getPwd() != null) {
			UserDao dao = new UserDao();
			User user1 = dao.getUserByEmail(getEmail());
			if (user1 != null && user1.getPassword().equals(getPwd())) {
				this.user=user1;
				validUser = true;
			}
		}

		if (validUser) {
			session.put("User", user);
			if(user.getRole().equals("Patient")) {
				if(user.getFhirId()==null)
					return "patient_dashboard";
				else 
					return "patient_dashboard";
			}
			else if(user.getRole().equals("Provider"))
				return "provider_dashboard";
			else 
				return ERROR;
		} else
			return "login";
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

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}
}