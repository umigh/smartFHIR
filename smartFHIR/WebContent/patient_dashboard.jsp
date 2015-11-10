<!DOCTYPE html>
<%@page import="edu.gatech.cs6400.php.model.User"%>
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
	User user=(User) session.getAttribute("User");
	System.out.println(user);
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
                            <h2><%=user.getFirstName()+" "+user.getLastName() %></h2>
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
                                    <img src="images/img.jpg" alt=""><%=user.getFirstName()+" "+user.getLastName() %>
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li>
                                        <a href="javascript:;">Help</a>
                                    </li>
                                    <li>
                                        <a href="index.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                    </li>
                                </ul>
                            </li>
                            <li role="presentation" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="badge bg-green">6</span>
                                </a>
                                <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                                    <li>
                                        <a>
                                            <span class="image">
                                                <img src="images/img.jpg" alt="Profile Image" />
                                            </span>
                                            <span>
                                                <span>John Smith</span>
                                                <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                                Film festivals used to be do-or-die moments for movie makers. They were where...
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                                <img src="images/img.jpg" alt="Profile Image" />
                                            </span>
                                            <span>
                                                <span>John Smith</span>
                                                <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                                Film festivals used to be do-or-die moments for movie makers. They were where...
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                                <img src="images/img.jpg" alt="Profile Image" />
                                            </span>
                                            <span>
                                                <span>John Smith</span>
                                                <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                                Film festivals used to be do-or-die moments for movie makers. They were where...
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                                <img src="images/img.jpg" alt="Profile Image" />
                                            </span>
                                            <span>
                                                <span>John Smith</span>
                                                <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                                Film festivals used to be do-or-die moments for movie makers. They were where...
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="text-center">
                                            <a>
                                                <strong>See All Alerts</strong>
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
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
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="#">Settings 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">Settings 2</a>
                                                </li>
                                            </ul>
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
                                            <form class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        First Name <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="first-name" ng-model="patientDetails.firstName" required="required" class="form-control col-md-7 col-xs-12">
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
                                                        <input type="text" id="address1" ng-model="patientDetails.address.line[0]" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        Address 2 <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="address2" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        City <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="city" name="last-name" ng-model="patientDetails.address.city" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        State <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="state" name="last-name" ng-model="patientDetails.address.state" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        ZIP <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="zip" name="last-name" ng-model="patientDetails.address.postalCode" required="required" class="form-control col-md-7 col-xs-12">
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

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Add a new immunization </h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="#">Settings 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">Settings 2</a>
                                                </li>
                                            </ul>
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
                                            <div class="col-md-6 col-sm-6 col-xs-12"> <input type="text" id="first-name" ng-model="details.adminDate" required="required" class="form-control col-md-7 col-xs-12"> </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name"> Vaccine <span class="required">*</span> </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="last-name" name="last-name" ng-model="details.vaccine" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Site</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="middle-name" class="form-control col-md-7 col-xs-12" type="text" ng-model="details.site" name="middle-name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Route <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.route" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Dose
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="phone" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.dose" required="required" type="text">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="submit" class="btn btn-primary" ng-click="details=null;">Cancel</button>
                                                <button type="submit" class="btn btn-success" ng-click="updateModel(details)" ng-disabled="details.route==null||details.vaccine==null||details.adminDate==null">Submit</button>
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
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="#">Settings 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">Settings 2</a>
                                                </li>
                                            </ul>
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
                                                <th>Site</th>
                                                <th>Route</th>
                                                <th>Dose</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="row in collection" >
                                               <td>{{row.resource.date}}</td>
                                                <td>{{row.resource.vaccineCode.text}}</td>
                                                <td>{{row.resource.site}}</td>
                                                <td>{{row.resource.route}}</td>
                                                <td>{{row.resource.doseQuantity}}</td>
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
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="#">Settings 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">Settings 2</a>
                                                </li>
                                            </ul>
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
                                            <div class="col-md-6 col-sm-6 col-xs-12"> <input type="text" id="first-name" ng-model="details.adminDate" required="required" class="form-control col-md-7 col-xs-12"> </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name"> Vaccine <span class="required">*</span> </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="last-name" name="last-name" ng-model="details.vaccine" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Site</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="middle-name" class="form-control col-md-7 col-xs-12" type="text" ng-model="details.site" name="middle-name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Route <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.route" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Dose
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="phone" class="date-picker form-control col-md-7 col-xs-12" ng-model="details.dose" required="required" type="text">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="submit" class="btn btn-primary" ng-click="details=null;">Cancel</button>
                                                <button type="submit" class="btn btn-success" ng-click="updateModel(details)" ng-disabled="details.route==null||details.vaccine==null||details.adminDate==null">Submit</button>
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
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="#">Settings 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">Settings 2</a>
                                                </li>
                                            </ul>
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
                                                <th>Site</th>
                                                <th>Route</th>
                                                <th>Dose</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="row in collection" >
                                               <td>{{row.resource.date}}</td>
                                                <td>{{row.resource.vaccineCode.text}}</td>
                                                <td>{{row.resource.date}}</td>
                                                <td>{{row.resource.date}}</td>
                                                <td>{{row.resource.date}}</td>
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
        $(document).ready(function () {
        	var patientId=<%=user.getFhirId()%>;
        	angular.element($('#patientRegistrationCtrl')).scope().setPatientId(patientId);
        	//alert(patientId);
            // Smart Wizard
            $('#wizard').smartWizard(
              {
                onFinish:onFinishCallback
              }
            );


            function onFinishCallback($http,$scope) {
                angular.element($('#patientRegistrationCtrl')).scope().myfunction();
               //$http.put('http://fhirtest.uhn.ca/baseDstu2/Patient/1371268?_format=json','patientDetails');
                //$('#wizard').smartWizard({contentURL:'http://fhirtest.uhn.ca/baseDstu2/Patient/1371268?_format=json',contentCache:false});
                //var data ='data';
//                $.put("http://fhirtest.uhn.ca/baseDstu2/Patient/1371268", function(data, status){
//                    alert("Data: " + data + "\nStatus: " + status);
//                });
//                $.ajax({
//                    type: "PUT",
//                    url: "http://fhirtest.uhn.ca/baseDstu2/Patient/1371268",
//                    contentType: "application/json",
//                    data: {"data": $scope.patientDetails}
//                });



//                $.get("http://fhirtest.uhn.ca/baseDstu2/Patient/1371268", function(data, status){
//                    alert("Data: " + data + "\nStatus: " + status);
//                    angular.element(document.getElementById('patientRegistrationCtrl')).scope().get();
//                });
                $('#wizard').smartWizard('showMessage', 'Finish Clicked');
            }
        });

        $(document).ready(function () {
            // Smart Wizard
            $('#wizard_verticle').smartWizard({
                transitionEffect: 'slide'
            });

            $('#finish').click(function () {
                alert('finish');
            });
        });
    </script>
</body>
</html>