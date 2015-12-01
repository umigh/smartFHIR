package edu.gatech.cs6400.php;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class FhirAccount implements Serializable {
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public Long fhirId;
  @Id 
  public String email;
  public String userid;
  public String firstName;
  public String lastName;

  public FhirAccount(Long fhirId, String email, String userid, String firstName,
		String lastName) {
	super();
	this.fhirId = fhirId;
	this.email = email;
	this.userid = userid;
	this.firstName = firstName;
	this.lastName = lastName;
}

/**
   * Simple constructor just sets the date
   **/
  public FhirAccount() {
    
  }

public Long getFhirId() {
	return fhirId;
}

public void setFhirId(Long id) {
	this.fhirId = id;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
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

  

}
//[END all]
