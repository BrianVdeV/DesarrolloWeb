<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Equipo | H�roes del Per�</title>
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

    <body>
        <!-- Begin page -->
        <div class="wrapper">


            <!-- ========== Topbar Start ========== -->
            <%@ include file="assets/inc/topbar.jsp" %>
            <!-- ========== Topbar End ========== -->

            <!-- ========== Left Sidebar Start ========== -->
            <%@ include file="assets/inc/left-sidebar.jsp" %>
            <!-- ========== Left Sidebar End ========== -->


            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Equipo</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        <div class="row">
                            <div class="card">
                                <div class="card-body">


                                    <button  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregar">Agregar Equipo</button>
                                    <table class="table table-striped table-centered mb-0">
                                        <thead>
                                            <tr>
                                                <th>Apellidos</th>
                                                <th>Nombres</th>
                                                <th>Correo</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Lopez</td>
                                                <td>Juan</td>
                                                <td>juan@gmail.com</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Gonzalez</td>
                                                <td>Maria</td>
                                                <td>maria@outlook.com</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Rodriguez</td>
                                                <td>Carlos</td>
                                                <td>carlos@hotmail.com</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Martinez</td>
                                                <td>Ana</td>
                                                <td>ana@gmail.com</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Perez</td>
                                                <td>Luis</td>
                                                <td>luis@hotmail.com</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div> <!-- container -->

                </div> <!-- content -->

                <!-- Footer Start -->
                <%@ include file="assets/inc/footer.jsp" %>
                <!-- end Footer -->

            </div>
            <div id="mdlAgregar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="standard-modalLabel">Agregar Estudiante</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="simpleinput" class="form-label">Apellidos</label>
                                <input type="text" id="simpleinput" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="simpleinput" class="form-label">Nombres</label>
                                <input type="text" id="simpleinput" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="example-email" class="form-label">Email</label>
                                <input type="email" id="example-email" name="example-email" class="form-control" placeholder="Email">
                            </div>
                            <div class="mb-3">
                                <label for="example-password" class="form-label">Contrase�a</label>
                                <input type="password" id="example-password" class="form-control" value="password">
                            </div><div class="mb-3">
                                <label for="example-password" class="form-label">Repetir Contrase�a</label>
                                <input type="password" id="example-password" class="form-control" value="password">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary">Guardar</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->

        <!-- Theme Settings -->
        <%@ include file="assets/inc/theme.jsp" %>

        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>

    </body>
</html>
