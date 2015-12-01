<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.googlecode.objectify.ObjectifyService"%>
<%@page import="com.googlecode.objectify.Key"%>
<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="edu.gatech.cs6400.php.FhirAccount"%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Patient Health Portal! | </title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">

    <script src="js/jquery.min.js"></script>
    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body class="nav-md" ng-app="app" id="patientRegistrationCtrl" ng-controller="patientRegistrationCtrl" >
<%
	UserService userService = UserServiceFactory.getUserService();
	User guser = userService.getCurrentUser(); 
             
    FhirAccount user=null;
              
	if (guser != null) {       
    	Key<FhirAccount> fhirk = Key.create(FhirAccount.class, guser.getEmail());
        List<FhirAccount> fhirs = ObjectifyService.ofy()
              .load()
              .type(FhirAccount.class) 
              .ancestor(fhirk)             
              .limit(1)            
              .list();
         if(fhirs!=null && fhirs.size()>0 ) {
        	 user=fhirs.get(0);
         }         
    }
%>
    <div class="container body">

        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="patient_dashboard.jsp" class="site_title"><i class="fa fa-paw"></i> <span>Patient Health Portal</span></a>
                    </div>
                    <div class="clearfix"></div>

                    <!-- menu prile quick info -->
                    <div class="profile">
                        <div class="profile_pic">
                            <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>Welcome,</span>
                            <h2><%=guser.getNickname()%></h2>
                        </div>
                    </div>
                    <!-- /menu prile quick info -->
                    <br />
                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li>
                                    <a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li>
                                            <a href="patient_dashboard.jsp">Dashboard</a>
                                        </li>                                        
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->
                    <!-- /menu footer buttons -->
                    <div class="sidebar-footer hidden-small">
                        <a data-toggle="tooltip" data-placement="top" title="Settings">
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                            <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Lock">
                            <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Logout">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>
            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="images/img.jpg" alt=""><%=guser.getNickname() %>
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li>
                                        <a href="javascript:;">Help</a>
                                    </li>
                                    <li>
                                        <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                    </li>
                                </ul>
                            </li>
                            
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->
            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Patient Registration Form</h3>
                        </div>                        
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Patient Information</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        
                                        <li>
                                            <a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <!-- Smart Wizard -->
                                    <!--<p>Section description can be inserted here.</p>-->
                                    <div id="wizard" class="form_wizard wizard_horizontal">
                                        <ul class="wizard_steps">
                                            <li>
                                                <a href="#step-1">
                                                    <span class="step_no">1</span>
                                                    <span class="step_descr">
                                                        Basic<br /> <small>Patient basic information</small>
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-2">
                                                    <span class="step_no">2</span>
                                                    <span class="step_descr">
                                                        Address<br /> <small>Patient address</small>
                                                    </span>
                                                </a>
                                            </li>  
                                            
                                            <li>
                                            <a href="#step-3">
                                                <span class="step_no">3</span>
                                                <span class="step_descr">
                                                    Emergency Contact<br /> <small>Patient emergency contacts</small>
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step-4">
                                                <span class="step_no">4</span>
                                                <span class="step_descr">
                                                    Family History<br /> <small>Patient family history</small>
                                                </span>
                                            </a>
                                        </li>
                                           
                                                                      
                                        </ul>
                                        <div id="step-1">
                                            <form class="form-horizontal form-label-left" action="/sign" id="signinForm">
                                            	<input type="hidden" id="fhirId" name="fhirId">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        First Name <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="first-name" name="first-name" ng-model="patientDetails.firstName" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        Last Name <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" ng-model="patientDetails.lastName" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Middle Name / Initial</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <input type="radio" name="gender" ng-model="patientDetails.gender" value="male"> &nbsp; Male &nbsp;
                                                            </label>
                                                            <label class="btn btn-primary active" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <input type="radio" name="gender" ng-model="patientDetails.gender" value="female" > Female
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                        Date Of Birth <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" ng-model="patientDetails.birthDate" required="required" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                        Phone
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="phone" class="date-picker form-control col-md-7 col-xs-12" ng-model="patientDetails.phone" required="required" type="text">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div id="step-2">
                                            <form class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Address 1 <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="address1" name="address1" ng-model="patientDetails.address.line[0]" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        Address 2 <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="address2" name="address2" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        City <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="city" id="city" name="city" ng-model="patientDetails.address.city" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        State <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="state" name="state" ng-model="patientDetails.address.state" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        ZIP <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="zip" name="zip" ng-model="patientDetails.address.postalCode" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        
                                        
  										<div id="step-3">
                                        <h2 class="StepTitle">Emergency Contact 1</h2>

                                        <form class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                    Name <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                    Email <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="email" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                    Phone <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="phone" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                    Relationship <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="relationship" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                        </form>
                                        <br />
                                        <h2 class="StepTitle">Emergency Contact 2</h2>

                                        <form class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                    Name <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                    Email <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="email" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                    Phone <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="phone" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                    Relationship <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="relationship" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                    <div id="step-4">
                                        <h2 class="StepTitle">Family Member History 1</h2>
                                        <div class="row">
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Date" class="form-control"></div>

                                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Name" class="form-control"> </div>
                                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Relationship" class="form-control"> </div>

                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Gender" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Born" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Age" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Deceased" class="form-control"></div>

                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Note" class="form-control"> </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Condition" class="form-control"> </div>

                                        </div>

                                        <br />

                                        <h2 class="StepTitle">Family Member History 2</h2>
                                        <div class="row">
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Date" class="form-control"></div>

                                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Name" class="form-control"> </div>
                                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Relationship" class="form-control"> </div>

                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Gender" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Born" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Age" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Deceased" class="form-control"></div>

                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Note" class="form-control"> </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Condition" class="form-control"> </div>

                                        </div>

                                        <br />

                                        <h2 class="StepTitle">Family Member History 3</h2>
                                        <div class="row">
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Date" class="form-control"></div>

                                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Name" class="form-control"> </div>
                                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Relationship" class="form-control"> </div>

                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Gender" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Born" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Age" class="form-control"></div>
                                            <div class="col-md-1 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Deceased" class="form-control"></div>

                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Note" class="form-control"> </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group"> <input type="text" placeholder="Condition" class="form-control"> </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- End SmartWizard Content -->
                            </div>
                        </div>
                    </div>
                        <div class="clearfix"></div>
                        
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Add a new immunization </h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>                                        
                                        <li>
                                            <a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Administration Date <span class="required">*</span> </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12"> <input type="text" id="adminDate" name="adminDate" ng-model="details.adminDate" required="required" class="form-control col-md-7 col-xs-12"> </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name"> Vaccine <span class="required">*</span> </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="vaccine" name="vaccine" ng-model="details.vaccine" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Lot Number
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="lotNumber" name="lotNumber" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.lotNumber" required="required" type="text">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="button" id="immunizationCancel" class="btn btn-primary" ng-click="details=null;">Cancel</button>
                                                <button type="button" id="immunizationSubmit" class="btn btn-success" ng-click="updateModel(details)" ng-disabled="details.vaccine==null||details.adminDate==null">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Immunization</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        
                                        <li>
                                            <a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Administration Date</th>
                                                <th>Vaccine</th>
                                                <th>Lot Number</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="row in collection" >
                                               <td>{{row.resource.date}}</td>
                                                <td>{{row.resource.vaccineCode.text}}</td>
                                                <td>{{row.resource.lotNumber}}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Add a new Medication </h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        
                                        <li>
                                            <a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">
                                    	<div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Medication
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="medication" name="medication" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.medication" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Dosage
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="dosage" name="dosage" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.dosage" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Status
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="status" name="status" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.status" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="button" id="medicationCancel" name="medicationCancel" class="btn btn-primary" ng-click="details=null;">Cancel</button>
                                                <button type="button" id="medicationSubmit" name="medicationSubmit" class="btn btn-success" ng-click="updateModel(details)" ng-disabled="details.medication==null||details.dosage==null">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Medication</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        
                                        <li>
                                            <a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Medication</th><th>Dosage</th><th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="row in collection1" >
                                               <td>{{row.resource.medicationReference.display}}</td>  
                                               <td>{{row.resource.dosage[0].text}}</td> 
                                               <td>{{row.resource.status}}</td>                                                                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        
                        <div class="clearfix"></div>

                    </div>
                <div class="clearfix"></div>



                </div>

                <!-- footer content -->
                <footer>
                    <div class="">
                        <p class="pull-right">
                            Patient Health Portal |
                            <span class="lead"> Georgia Institute of Technology</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->

            </div>
            <!-- /page content -->
        </div>
    </div>
    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>
    <script src="js/bootstrap.min.js"></script>
    <!-- chart js -->
    <script src="js/chartjs/chart.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="js/icheck/icheck.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- form wizard -->
    <script type="text/javascript" src="js/wizard/jquery.smartWizard.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
    <script src="app/app.js"></script>
    <script type="text/javascript">
    var patientId=<%=user!=null?user.getFhirId():"9999999"%>;
        $(document).ready(function () {
        	alert(patientId);
        	angular.element($('#patientRegistrationCtrl')).scope().setPatientId(patientId);
            $('#wizard').smartWizard(
              {
                onFinish:onFinishCallback
              }
            );

            

            function onFinishCallback($http,$scope) {
            	var formdata="{\"resourceType\":\"Patient\", \"name\":[{ \"family\":[\" "+$('#last-name').val()+" \"],\"given\":[\""+$('#first-name').val()+"\"]}],\"gender\":\""+$('#gender').val()+"\",\"birthDate\":\""+$('#birthday').val()+"\",\"address\":[{\"use\":\"home\",\"line\":[\""+$('#address').val()+"\"],\"city\":\""+$('#city').val()+"\",\"state\":\""+$('#state').val()+"\",\"postalCode\":\""+$('#zip').val()+"\"}],\"active\":true}";
            	console.log(formdata);
                $.ajax({
                        type: 'POST',
                        contentType: "application/json+fhir; charset=UTF-8",
                        url: 'http://fhirtest.uhn.ca/baseDstu2/Patient',
                        data: formdata,
                        async:true,
                        crossDomain:true,
                        success: function(data){                         
                         var subStr = data.text.div.match("Patient/(.*)/_history");
                         patientId=subStr[1];
                         alert("New Patient has been created in FHIR. Patient FHIR id - "+ patientId);
                         
                         /*
                         formdata="{\"resourceType\":\"RelatedPerson\",\"patient\":{\"reference\":\"Patient/"+patientId+"\"},\"relationship\":{\"text\":\"Sig Other\"},\"name\":{\"use\":\"usual\",\"family\":[\"Ricardo\"],\"given\":[\"Ricky\"]},\"telecom\":[{\"system\":\"phone\",\"value\":\"0690383372\",\"use\":\"mobile\"},{\"system\":\"email\",\"value\":\"ricky@babaloo.com\",\"use\":\"home\"}]}";
                         $.ajax({
                             type: 'POST',
                             contentType: "application/json+fhir; charset=UTF-8",
                             url: 'http://fhirtest.uhn.ca/baseDstu2/RelatedPerson',
                             data: formdata,
                             async:true,
                             crossDomain:true,
                             success: function(data){
                             	alert('emergency contact created');
                             }
                     	}); 
                         */
                         
                         //angular.element($('#patientRegistrationCtrl')).scope().setPatientId(patientId);
                         $('#fhirId').val(patientId);
                         $('#signinForm').submit();
                        }
                });   
                
                
                
                
            }
            
        });
        
        $("#immunizationSubmit").click(function($http,$scope) {
    		var formdata="{\"resourceType\":\"Immunization\",\"status\":\"completed\",\"date\":\""+$('#adminDate').val()+"\",\"vaccineCode\":{\"text\":\""+$('#vaccine').val()+"\"},\"patient\":{\"reference\":\"Patient/"+patientId+"\"},\"wasNotGiven\":false,\"reported\":false,\"lotNumber\":\""+$('#lotNumber').val()+"\"}";
    		
    		$.ajaxSetup({async:false});
            $.ajax({
                    type: 'POST',
                    contentType: "application/json+fhir; charset=UTF-8",
                    url: 'http://fhirtest.uhn.ca/baseDstu2/Immunization',
                    data: formdata,
                    async:true,
                    crossDomain:true,
                    success: function(data){
                    	angular.element($('#patientRegistrationCtrl')).scope().setPatientId(patientId);
                    }
            });   
    	});
               
        $("#medicationSubmit").click(function($http,$scope) {
    		var formdata="{\"resourceType\":\"MedicationStatement\",\"patient\":{\"reference\":\"Patient/"+patientId+"\"},\"informationSource\":{\"reference\":\"Practitioner/302108\"},\"medicationReference\":{\"reference\":\"#fcc15736-5e05-4894-b9ea-e08fc81ea043\",\"display\":\""+$('#medication').val()+"\"},\"dosage\":[{\"text\":\""+$('#dosage').val()+"\"}]}";
    		
    		$.ajaxSetup({async:false});
            $.ajax({
                    type: 'POST',
                    contentType: "application/json+fhir; charset=UTF-8",
                    url: 'http://fhirtest.uhn.ca/baseDstu2/MedicationStatement',
                    data: formdata,
                    async:true,
                    crossDomain:true,
                    success: function(data){
                    	angular.element($('#patientRegistrationCtrl')).scope().setPatientId(patientId);
                    }
            });   
    	});
        
        
        
            
        $('#wizard_verticle').smartWizard({
              transitionEffect: 'slide'
        });
    </script>
</body>
</html>