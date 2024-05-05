<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Log In | Héroes del Perú</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Theme Config Js -->
    <script src="assets/js/hyper-config.js"></script>

    <!-- App css -->
    <link href="assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
</head>

<body class="authentication-bg pb-0">

    <div class="auth-fluid">
        <!--Auth fluid left content -->
        <div class="auth-fluid-form-box">
            <div class="card-body d-flex flex-column h-100 gap-3">

                <!-- Logo -->
                <div class="auth-brand text-center text-lg-start">
                    <a href="index.jsp" class="logo-dark">
                        <h4><span class="badge bg-danger">Héroes del Perú</span></h4>
                    </a>
                    <a href="index.jsp" class="logo-light">
                        <h4><span class="badge bg-danger">Héroes del Perú</span></h4>
                    </a>
                </div>

                <div class="my-auto">
                    <!-- title-->
                    <h4 class="mt-0">Iniciar Sesión</h4>
                    <p class="text-muted mb-4">Ingresa tu correo y contraseña para iniciar sesión.</p>

                    <!-- form -->
                    <form action="index.jsp">
                        <div class="mb-3">
                            <label for="emailaddress" class="form-label">Correo</label>
                            <input class="form-control" type="email" id="emailaddress" required="" placeholder="Intresa tu email">
                        </div>
                        <div class="mb-3">
                            <a href="pages-recoverpw-2.jsp" class="text-muted float-end"><small>¿Olvidaste tu contraseña?</small></a>
                            <label for="password" class="form-label">Contraseña</label>
                            <input class="form-control" type="password" required="" id="password" placeholder="Ingresa tu contraseña">
                        </div>
                        <div class="mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="checkbox-signin">
                                <label class="form-check-label" for="checkbox-signin">Recuerdame</label>
                            </div>
                        </div>
                        <div class="d-grid mb-0 text-center">
                            <button class="btn btn-primary" type="submit"><i class="mdi mdi-login"></i>Iniciar sesión</button>
                        </div>
                    </form>
                    <!-- end form-->
                </div>

            </div> <!-- end .card-body -->
        </div>
        <!-- end auth-fluid-form-box-->

    </div>
    <!-- end auth-fluid-->
    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

</body>

</html>