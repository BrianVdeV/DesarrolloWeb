<%@page import="Modelo.*" %>
<%@page import="DAO.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Salones | Héroes del Perú</title>
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
                                    <h4 class="page-title">Salones</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        <div class="row">
                            <div class="card">
                                <div class="card-body">


                                    <button  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregar">Agregar Salon</button>
                                    <table class="table table-striped table-centered mb-0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Pabellón</th>
                                                <th>Aula</th>
                                                <th>Aforo</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                DAOdocente dao = new DAOdocente();
                                                ArrayList<DTOdocente> Lista = dao.ListarDocentes();
                                                DTOdocente d = null;
                                                for (int i = 0; i < Lista.size(); i++) {
                                                    d = Lista.get(i);
                                            %>
                                            <tr>
                                                <td><%= d.getId_docente()%></td>
                                                <td><%= d.getApellido()%></td>
                                                <td><%= d.getNombre()%></td>
                                                <td><%= d.getDni()%></td>
                                                <td><%= d.getSexo()%></td>
                                                <td><%= d.getFecha()%></td>
                                                <td class="text-center">
                                                    <a class="btn btn-warning" onclick="openEditModal('<%= d.getId_docente()%>', '<%= d.getApellido()%>', '<%= d.getNombre()%>', '<%= d.getDni()%>', '<%= d.getSexo()%>', '<%= d.getFecha()%>')">Editar</a>
                                                    <a class="btn btn-danger" href="ControladorDocente?accion=eliminar&iddoc=<%= d.getId_docente()%>">Eliminar</a>
                                                </td>
                                            </tr>
                                            <%  }%>
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
                            <h4 class="modal-title" id="standard-modalLabel">Agregar Salon</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="example-number" class="form-label">Pabellon</label>
                                <input class="form-control" id="example-number" type="text" name="number">
                            </div>
                            <div class="mb-3">
                                <label for="example-number" class="form-label">Aula</label>
                                <input class="form-control" id="example-number" type="number" name="number">
                            </div>
                            <div class="mb-3">
                                <label for="example-number" class="form-label">Aforo</label>
                                <input class="form-control" id="example-number" type="number" name="number">
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
        <script>
            function openEditModal(id, apellido, nombre, dni, sexo, fecha) {
                $('#editID').val(id);
                $('#editApellido').val(apellido);
                $('#editNombre').val(nombre);
                $('#editDNI').val(dni);
                $('#editSexo').val(sexo);
                $('#editFecha').val(fecha);
                $('#mdlEditar').modal('show');
            }
        </script>
        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>

    </body>
</html>
