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
        	//getFamilyMemberHistory();
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
    	alert('emergency contact');
        $http.get('http://fhirtest.uhn.ca/baseDstu2/RelatedPerson?patient=' + $scope.patientId).success(function (result) {
            console.log('getEmergencyContactsDetails()');
            console.log(result);
            try {
                for (var i = 0; i < result.total; i++)
                {
                    $scope.emergencyContact[i] = {
                        firstName: result.entry[i].resource.name.given[0],
                        lastName: result.entry[i].resource.name.family[0],
                        birthDate: result.entry[i].resource.birthDate,
                        relationship: result.entry[i].resource.relationship.coding[0].code
                    };
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
            //console.log(result);
            try {
                //for (var i = 0; i < result.total; i++)
                //{
                //    $scope.familyMemberHistory[i] = {
                //        date: result.entry[i].resource.meta.lastUpdated,
                //        name: result.entry[i].resource.patient,
                //        relationship: result.entry[i].resource.relationship.coding[0].display,
                //        gender: result.entry[i].resource.patient,
                //        born: result.entry[i].resource.patient,
                //        age: result.entry[i].resource.patient,
                //        deceased: result.entry[i].resource.patient,
                //        note: result.entry[i].resource.text.div,
                //        condition: result.entry[i].resource.condition[0].code.coding[0].display
                //    };
                //}

                console.log(result.entry[0].resource.meta.lastUpdated);
                console.log(result.entry[0].resource.condition[0].code.coding[0].display);
                console.log(result.entry[0].resource.relationship.coding[0].display);
                console.log(result.entry[0].resource.text.div);
                console.log(result.entry[0].resource.patient.reference); // this need to be split on / and passed to getPatientInfo to get the family memeber details

                //console.log($scope.familyMemberHistory[0].date);
                //console.log($scope.familyMemberHistory[0].name);
                //console.log($scope.familyMemberHistory[0].relationship);
                //console.log($scope.familyMemberHistory[0].gender);
                //console.log($scope.familyMemberHistory[0].born);
                //console.log($scope.familyMemberHistory[0].age);
                //console.log($scope.familyMemberHistory[0].deceased);
                //console.log($scope.familyMemberHistory[0].note);
                //console.log($scope.familyMemberHistory[0].condition);
            }
            catch (err) {
                console.log(err.message);
            }

        }).error(function (error) {
            console.log("Failure - ", error);
        })
    }
});