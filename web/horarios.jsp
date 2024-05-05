<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Horarios | Héroes del Perú</title>
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
                                    <h4 class="page-title">Horarios</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        <div class="row">
                            <div class="card">
                                <div class="card-body">


                                    <button  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregar">Agregar Horarios</button>
                                    <table class="table table-striped table-centered mb-0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Curso</th>
                                                <th>Docente</th>
                                                <th>Aula</th>
                                                <th>Dia</th>
                                                <th>Hora Inicio</th>
                                                <th>Hora Fin</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody><tr>
                                                <td>1</td>
                                                <td>Matemática</td>
                                                <td>López Juan</td>
                                                <td>101</td>
                                                <td>Miércoles</td>
                                                <td>8:00</td>
                                                <td>9:30</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Historia</td>
                                                <td>Gómez Ana</td>
                                                <td>102</td>
                                                <td>Jueves</td>
                                                <td>10:00</td>
                                                <td>11:30</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Física</td>
                                                <td>Rodríguez Carlos</td>
                                                <td>103</td>
                                                <td>Viernes</td>
                                                <td>13:00</td>
                                                <td>14:30</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Literatura</td>
                                                <td>Martínez Laura</td>
                                                <td>104</td>
                                                <td>Lunes</td>
                                                <td>15:00</td>
                                                <td>16:30</td>
                                                <td class="table-action">
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Química</td>
                                                <td>Díaz Martín</td>
                                                <td>105</td>
                                                <td>Martes</td>
                                                <td>12:00</td>
                                                <td>13:30</td>
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
                            <h4 class="modal-title" id="standard-modalLabel">Agregar Horario</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="example-select" class="form-label">Curso</label>
                                <select class="form-select" id="example-select">
                                    <option>Matematicas</option>
                                    <option>Lengua</option>
                                    <option>Ciencias Naturales</option>
                                    <option>Ciencias Sociales</option>
                                    <option>Musica</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="example-select" class="form-label">Docente</label>
                                <select class="form-select" id="example-select">
                                    <option>López Juan</option>
                                    <option>Gómez Ana</option>
                                    <option>Rodríguez Carlos</option>
                                    <option>Martínez Laura</option>
                                    <option>Díaz Martín</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="example-select" class="form-label">Dia</label>
                                <select class="form-select" id="example-select">
                                    <option>Lunes</option>
                                    <option>Martes</option>
                                    <option>Miercoles</option>
                                    <option>Jueves</option>
                                    <option>Viernes</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="example-time" class="form-label">Hora Inicio</label>
                                <input class="form-control" id="example-time" type="time" name="time">
                            </div>
                            <div class="mb-3">
                                <label for="example-time" class="form-label">Hora Fin</label>
                                <input class="form-control" id="example-time" type="time" name="time">
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
