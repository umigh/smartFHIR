<!DOCTYPE html>
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

<body style="background:#F7F7F7;">
    
    <div class="">
        <a class="hiddenanchor" id="toregister"></a>
        <a class="hiddenanchor" id="tologin"></a>

        <div id="wrapper">
            <div id="login" class="animate form">
                <section class="login_content">
                    <form action="register" method="post">
                        <h1>Register Form</h1>
                        <div>
                            <input type="text" id="email" name="email" class="form-control" placeholder="Email" required="true" />
                        </div>
                        <div>
                            <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" required="true" />
                        </div>
						<div>
                            <input type="password" id="pwdRepeat" name="pwdRepeat" class="form-control" placeholder="Confirm Password" required="true" />
                        </div>
						<div>
                            <input type="text" id="firstName" name="firstName" class="form-control" placeholder="First Name" required="true" />
                        </div>
                        <div>
                            <input type="text" id="lastName" name="lastName"  class="form-control" placeholder="Last Name" required="true" />
                        </div>
                        <div>
                        	<input type="submit" class="btn btn-default submit" id="registerSubmit" value="Register">
                        	<input type="button" class="btn btn-default cancel" id="cancel" value="Cancel">	
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">

                           <p class="change_link">Already Registered ?
                                <a href="index.jsp" class="to_register"> Login </a>
                            </p>
                            
                            <br />
                            <div>
                                <h1>smartFHIR</h1>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>

</body>

</html>