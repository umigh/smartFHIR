package edu.gatech.cs6400.php;

//Import required java libraries
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

//Implements Filter class
public class SmartFilter implements Filter  {
public void  init(FilterConfig config) throws ServletException{
}

public void  doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws java.io.IOException, ServletException {
	UserService userService = UserServiceFactory.getUserService();
	HttpServletRequest req = (HttpServletRequest) request;
    User user = userService.getCurrentUser();  // Find out who the user is.
    
    if (req.getUserPrincipal() != null) {       
    	Key<FhirAccount> fhirk = Key.create(FhirAccount.class, user.getEmail());
          List<FhirAccount> fhirs = ObjectifyService.ofy()
              .load()
              .type(FhirAccount.class) 
              .ancestor(fhirk)             
              .limit(1)            
              .list();
          
         if(fhirs!=null && fhirs.size()>0 ) {
        	 req.getSession(true).setAttribute("FhirUser", fhirs.get(0));
         }         
    }
    
   // Pass request back down the filter chain
   chain.doFilter(request,response);
}
public void destroy( ){
}
}