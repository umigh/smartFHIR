package edu.gatech.cs6400.php.dao;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.model.dstu2.resource.Patient;
import ca.uhn.fhir.model.primitive.IdDt;
import ca.uhn.fhir.rest.api.MethodOutcome;
import ca.uhn.fhir.rest.client.IGenericClient;

public class PatientDao {
	public static void main(String args[]) {
		PatientDao dao=new PatientDao();
		dao.createPatient();
	}
	public void createPatient() {
		FhirContext ctx = FhirContext.forDstu2();
	    //String serverBase = "http://fhirtest.uhn.ca/baseDstu2";
		String serverBase = "http://polaris.i3l.gatech.edu:8080/gt-fhir-webapp/base";
	      
	    IGenericClient client = ctx.newRestfulGenericClient(serverBase);
	      
        // START SNIPPET: create
        Patient patient = new Patient();
        // ..populate the patient object..
        //patient.addIdentifier().setSystem("urn:smartFHIR").setValue("12345");
        patient.addName().addFamily("Smith").addGiven("John");

        // Invoke the server create method (and send pretty-printed JSON
        // encoding to the server
        // instead of the default which is non-pretty printed XML)
        MethodOutcome outcome = client.create()
           .resource(patient)
           .prettyPrint()
           .encodedJson()
           .execute();
        
        // The MethodOutcome object will contain information about the
        // response from the server, including the ID of the created 
        // resource, the OperationOutcome response, etc. (assuming that
        // any of these things were provided by the server! They may not
        // always be)
        IdDt id = (IdDt) outcome.getId();
        System.out.println("Got ID: " + id.getIdPart());
	}
}
