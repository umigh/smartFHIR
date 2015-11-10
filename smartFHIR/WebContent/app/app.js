'use strict';
var app=angular.module('app',[]);
app.controller('patientRegistrationCtrl',function($scope,$http){
    function init() {
        $scope.collection=[];
        $scope.immunization={
            adminDate:null,
            vaccine:null,
            route:null,
            dose:null,
            site:null
        };
        $scope.medication={
        		effectiveTimeDateTime:null,
        		dosage:null,
                route:null,
                dose:null,
                site:null
            };
        $scope.details=null;
        $scope.setPatientId=function(patientId)
        {
        	$scope.patientId=patientId;
        	getPatientInformation();
            getImmunizationDetails();
        }
    }
    init();
    $scope.myfunction=function() {
                delete $scope.patientDetails.id;
                $http.put('http://fhirtest.uhn.ca/baseDstu2/Patient/'+$scope.patientId,$scope.patientDetails).success(function (result)
                {
                    try{
                        alert(result.text.status);
                    }
                    catch(err)
                    {
                        alert("Failure - "+err.message);
                    }


                }).error(function (error) {
                    alert("Failure - ", error.message);
                });
        }
    $scope.updateModel=function(immunization){
        if((immunization.adminDate||immunization.vaccine||immunization.route)!==null)
        {
            $scope.collection.push(
                {
                    'adminDate': $scope.details.adminDate,
                    'vaccine': $scope.details.vaccine,
                    'route':$scope.details.route,
                    'dose' : $scope.details.dose,
                    'site':$scope.details.site
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
    	$http.get('http://fhirtest.uhn.ca/baseDstu2/Immunization?patient='+$scope.patientId).success(function (result) {
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

});
//app.factory('PatientRegistrationFactory',function($http){
//    return {
//        getPatientInfo: function(patientId) {
//        	alert('in getinfo '+patientId);
//            return $http.get('http://fhirtest.uhn.ca/baseDstu2/Patient/'+patientId);
//        },
//        putPatientDetails:function(data,patientId)
//        {
//            return $http.put('http://fhirtest.uhn.ca/baseDstu2/Patient/'+patientId,data);
//        }
//    };
//
//
//});
//app.factory('PatientImmunizationFactory',function($http){
//	alert('immunizatio'+$scope.patientId);
//    return {
//        getImmunizationDetails: function() {        	
//            //return $http.get('http://fhirtest.uhn.ca/baseDstu2/Immunization/1531235');
//        	return $http.get('http://fhirtest.uhn.ca/baseDstu2/Immunization?patient='+$scope.patientId);
//        },
//        postImmunizationDetails:function(data)
//        {
//            return true;
//        }
//    };
//});
//app.factory('FamilyHistoryFactory',function($http) {
//    return{
//        getFamilyHistoryDetails:function()
//        {
//            return
//        },
//        postFamilyHistoryDetails:function(data){
//            return $http.post('http://fhirtest.uhn.ca/baseDstu2/FamilyMemberHistory',data);
//        }
//    }
//})