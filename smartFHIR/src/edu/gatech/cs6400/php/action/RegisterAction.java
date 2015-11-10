package edu.gatech.cs6400.php.action;

import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import edu.gatech.cs6400.php.dao.UserDao;
import edu.gatech.cs6400.php.model.User;
import edu.gatech.cs6400.php.util.DateUtil;

@Namespace("/")
@ResultPath(value="/")
@Action(value="register", results={@Result(name="success",location="index.jsp"),
		@Result(name="error",location="page_500.jsp")})
public class RegisterAction extends ActionSupport {
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String email=request.getParameter("email");  
    	String pwd=request.getParameter("pwd");
    	String pwdRepeat=request.getParameter("pwdRepeat");
    	String role=request.getParameter("role");
    	String firstName=request.getParameter("firstName");
    	String lastName=request.getParameter("lastName");
    	if(email==null || pwd==null || pwdRepeat==null) {
    		return ERROR;
    	}
    	else if(!pwd.equals(pwdRepeat)) {
    		return ERROR;
    	}
    	else {
    		UserDao dao=new UserDao();
			User user=dao.add(new User(email, pwd,firstName,lastName,"Patient"));	
		   return SUCCESS;
    	}
	}
}