package edu.gatech.cs6400.php.action;

import java.text.ParseException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import edu.gatech.cs6400.php.dao.UserDao;
import edu.gatech.cs6400.php.model.User;
import edu.gatech.cs6400.php.util.DateUtil;

@Namespace("/user")
@ResultPath(value="/")
@Action(value="register", results={@Result(name="success",location="dashboard.jsp"),
		@Result(name="error",location="error.jsp")})
public class RegisterAction extends ActionSupport{
	private String userId;
	private String pwd;
	private String pwdRepeat;
	private String firstName;
	private String lastName;
	private String email;
	private String birthDate;
	private String role;
	
	public String execute() {
		if(getEmail() !=null){
			UserDao dao=new UserDao();
			
			try {
				User user=dao.add(new User(email, pwd, firstName, lastName, DateUtil.toDate(birthDate, "mm/dd/yyyy"),role));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		   return SUCCESS;
		}else{
			return ERROR;
		}
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdRepeat() {
		return pwdRepeat;
	}
	public void setPwdRepeat(String pwdRepeat) {
		this.pwdRepeat = pwdRepeat;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}