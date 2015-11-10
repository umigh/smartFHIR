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
@Action(value = "logout", results = {
		@Result(name = "success", location = "index.jsp"),
		@Result(name = "error", location = "page_500.jsp") })
public class LogoutAction extends ActionSupport implements SessionAware{
	@SuppressWarnings("rawtypes")
	Map session = ActionContext.getContext().getSession();

	@SuppressWarnings("unchecked")
	public String execute() {
		session.remove("User");
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}
}