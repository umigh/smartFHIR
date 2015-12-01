'use strict';
var app=angular.module('app',[]);
app.controller('patientRegistrationCtrl',function($scope,$http){
    function init() {
        $scope.collection=[];
        $scope.collection1=[];
        $scope.collection2 = [];
        $scope.familyMemberHistory = [];
        $scope.immunization={
            adminDate:null,
            vaccine:null,
            lotNumber:null
        }; 
        
        $scope.emergencycontact={
        		firstName: null,
                lastName: null,
                birthDate: null,
                relationship: null
        }
        $scope.medication={
        		medication:null,
        		dosage:null,
        		status:null
            };
        $scope.details = null;
        $scope.setPatientId=function(patientId)
        {
            $scope.collection=[];
            $scope.collection1=[];
            $scope.patientId = patientId;
        	getPatientInformation();
        	getImmunizationDetails(); 
        	getMedicationDetails();
        	getEmergencyContactsDetails();
        	getFamilyMemberHistory();
        }
    }
    init();
    $scope.myfunction=function() {
                //delete $scope.patientDetails.id;
                $http.put('http://fhirtest.uhn.ca/baseDstu2/Patient/'+$scope.patientId,$scope.patientDetails).success(function (result)
                {
                    try{
                        alert(result.text.status);
                    }
                    catch(err)
                    {
                        //alert("Failure - "+err.message);
                    }


                }).error(function (error) {
                    //alert("Failure - ", error.message);
                });
        }
    $scope.updateModel=function(immunization){
        if((immunization.adminDate||immunization.vaccine)!==null)
        {
            $scope.collection.push(
                {
                    'adminDate': $scope.details.adminDate,
                    'vaccine': $scope.details.vaccine,
                    'lotNumber' : $scope.details.lotNumber
                }
            );
            $scope.details=null;
        }
        else{
            return;
        }
    }
    function getPatientInformation()
    {
    	$http.get('http://fhirtest.uhn.ca/baseDstu2/Patient/'+$scope.patientId).success(function (result) {
            console.log(result);
            try {
                $scope.patientDetails=result;
                $scope.patientDetails.lastName= result.name[0].family[0];
                $scope.patientDetails.firstName=result.name[0].given[0];
                $scope.patientDetails.gender=result.gender;
                $scope.patientDetails.birthDate=result.birthDate;
                $scope.patientDetails.address=result.address[0];
            }
            catch(err){
                console.log(err.message);
            }

        }).error(function (error){
            console.log("Failure - ", error);
        })
    }

    function getImmunizationDetails()
    {    	
    	$http.get('http://fhirtest.uhn.ca/baseDstu2/Immunization?patient='+$scope.patientId+"&_sort:desc=date").success(function (result) {
            console.log(result);
            try {
                $scope.immunization=result.entry;
                for(var i=0;i<$scope.immunization.length;i++)
                	{
                	$scope.collection.push($scope.immunization[i]);
                	}
                console.log($scope.collection);
            }
            catch(err){
                console.log(err.message);
            }

        }).error(function (error){
            console.log("Failure - ", error);
        })
    }
    function getMedicationDetails()
    {    	
    	$http.get('http://fhirtest.uhn.ca/baseDstu2/MedicationStatement?patient='+$scope.patientId).success(function (result) {
            console.log(result);
            try {
                $scope.medication=result.entry;
                for(var i=0;i<$scope.medication.length;i++)
                	{
                	$scope.collection1.push($scope.medication[i]);
                	}
                console.log($scope.collection1);
            }
            catch(err){
                console.log(err.message);
            }

        }).error(function (error){
            console.log("Failure - ", error);
        })
    }
    function getEmergencyContactsDetails()
    {
    	//alert('emergency contact');
        $http.get('http://fhirtest.uhn.ca/baseDstu2/RelatedPerson?patient=' + $scope.patientId).success(function (result) {
            console.log('getEmergencyContactsDetails()');
            console.log(result);
            try {
                for (var i = 0; i < result.entry.length; i++)
                {
                	if(i==0) {
                		if(result.entry[i].resource.name.family!=null) {
                			$("#name1").val(result.entry[i].resource.name.family[0]);
                	    }
                		if(result.entry[i].resource.telecom[0]!=null && result.entry[i].resource.telecom[0].system=="phone") {
                			$("#phone1").val(result.entry[i].resource.telecom[0].value);
                		}
                		
                		if(result.entry[i].resource.telecom[0]!=null && result.entry[i].resource.telecom[0].system=="email") {
                			$("#email1").val(result.entry[i].resource.telecom[0].value);
                		}
                		
                		if(result.entry[i].resource.telecom[1]!=null && result.entry[i].resource.telecom[1].system=="phone") {
                			$("#phone1").val(result.entry[i].resource.telecom[1].value);
                		}
                		
                		if(result.entry[i].resource.telecom[1]!=null && result.entry[i].resource.telecom[1].system=="email") {
                			$("#email1").val(result.entry[i].resource.telecom[1].value);
                		}
                		
                		if(result.entry[i].resource.relationship!=null) {
                			$("#relationship1").val(result.entry[i].resource.relationship.text);
                		}
                		
                		$("#fhirContact1Id").val(result.entry[i].resource.id);
                		console.log($("#fhirContact1Id").val());
                	}
                	
                	if(i==1) {
                		if(result.entry[i].resource.name.family!=null) {
                			$("#name2").val(result.entry[i].resource.name.family[0]);
                		}
                		if(result.entry[i].resource.telecom[0]!=null && result.entry[i].resource.telecom[0].system=="phone") {
                			$("#phone2").val(result.entry[i].resource.telecom[0].value);
                		}
                		
                		if(result.entry[i].resource.telecom[0]!=null && result.entry[i].resource.telecom[0].system=="email") {
                			$("#email2").val(result.entry[i].resource.telecom[0].value);
                		}
                		
                		if(result.entry[i].resource.telecom[1]!=null && result.entry[i].resource.telecom[1].system=="phone") {
                			$("#phone2").val(result.entry[i].resource.telecom[1].value);
                		}
                		
                		if(result.entry[i].resource.telecom[1]!=null && result.entry[i].resource.telecom[1].system=="email") {
                			$("#email2").val(result.entry[i].resource.telecom[1].value);
                		}
                		if(result.entry[i].resource.relationship!=null) {                			
                			$("#relationship2").val(result.entry[i].resource.relationship.text);
                		}
                		$("#fhirContact2Id").val(result.entry[i].resource.id);
                		console.log($("#fhirContact2Id").val());
                	}
                }
            }
            catch (err) {
                console.log(err.message);
            }

        }).error(function (error) {
            console.log("Failure - ", error);
        })
    }
        
    function getFamilyMemberHistory()
    {
        $http.get('http://fhirtest.uhn.ca/baseDstu2/FamilyMemberHistory?patient=' + $scope.patientId).success(function (result) {
            console.log('getFamilyMemberHistory()');
            console.log(result);
            try {
                for (var i = 0; i < result.entry.length; i++)
                {
                	if(i==0) {
                		$("#fhdate1").val(result.entry[i].resource.date);
                		$("#fhname1").val(result.entry[i].resource.name);
                		$("#fhgender1").val(result.entry[i].resource.gender);
                		$("#fhrelationship1").val(result.entry[i].resource.relationship.coding[0].display);
                		$("#fhborn1").val(result.entry[i].resource.born);
                		$("#fhcondition1").val(result.entry[i].resource.condition[0].code.text);
                		$("#fhnote1").val(result.entry[i].resource.condition[0].code.text);
                		$("#fhirFH1Id").val(result.entry[i].resource.id);
                		console.log($("#fhirFH1Id").val());
                	}
                	
                	if(i==1) {
                		$("#fhdate2").val(result.entry[i].resource.date);
                		$("#fhname2").val(result.entry[i].resource.name);
                		$("#fhgender2").val(result.entry[i].resource.gender);
                		$("#fhrelationship2").val(result.entry[i].resource.relationship.coding[0].display);
                		$("#fhborn2").val(result.entry[i].resource.born);
                		$("#fhcondition2").val(result.entry[i].resource.condition[0].code.text);
                		$("#fhnote2").val(result.entry[i].resource.condition[0].code.text);
                		$("#fhirFH2Id").val(result.entry[i].resource.id);
                		console.log($("#fhirFH2Id").val());
                	}
                }
            }
            catch (err) {
                console.log(err.message);
            }

        }).error(function (error) {
            console.log("Failure - ", error);
        })
    }
});