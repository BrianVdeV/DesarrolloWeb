<%@page import="Modelo.*" %>
<%@page import="DAO.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Estudiantes | Héroes del Perú</title>
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
                                    <h4 class="page-title">Estudiantes</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        <div class="row">
                            <div class="card">
                                <div class="card-body">


                                    <button  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregar">Agregar Estudiantes</button>
                                    <table class="table table-striped table-centered mb-0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Apellido</th>
                                                <th>Nombre</th>
                                                <th>DNI</th>
                                                <th>Sexo</th>
                                                <th>Fecha de nacimiento</th>
                                                <th>Responsable</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                DAOestudiante dao = new DAOestudiante();
                                                ArrayList<DTOestudiante> Lista = dao.ListarEstudiantes();
                                                DTOestudiante d = null;
                                                for (int i = 0; i < Lista.size(); i++) {
                                                    d = Lista.get(i);
                                            %>
                                            <tr>
                                                <td><%= d.getId_estudiante()%></td>
                                                <td><%= d.getApellido()%></td>
                                                <td><%= d.getNombre()%></td>
                                                <td><%= d.getDni()%></td>
                                                <td><%= d.getSexo()%></td>
                                                <td><%= d.getFecha()%></td>
                                                <td><%= d.getResponsable()%></td>
                                                <td class="text-center">
                                                    <a class="btn btn-warning" onclick="openEditModal('<%= d.getId_estudiante()%>', '<%= d.getApellido()%>', '<%= d.getNombre()%>', '<%= d.getDni()%>', '<%= d.getSexo()%>', '<%= d.getFecha()%>','<%= d.getResponsable()%>')">Editar</a>
                                                    <a class="btn btn-danger" href="ControladorEstudiante?accion=eliminar&iddoc=<%= d.getId_estudiante()%>">Eliminar</a>
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
                            <h4 class="modal-title" id="standard-modalLabel">Agregar Estudiante</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <form action="ControladorEstudiante">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="simpleinput" class="form-label">Apellido</label>
                                    <input type="text" id="simpleinput" class="form-control" name="txtApellido">
                                </div>
                                <div class="mb-3">
                                    <label for="simpleinput" class="form-label">Nombre</label>
                                    <input type="text" id="simpleinput" class="form-control" name="txtNombre">
                                </div>
                                <div class="mb-3">
                                    <label for="example-number" class="form-label">DNI</label>
                                    <input class="form-control" id="example-number" type="number" name="txtDNI">
                                </div>
                                <div class="mb-3">
                                    <label for="example-select" class="form-label">Sexo</label>
                                    <select class="form-select" id="example-select" name="txtSexo">
                                        <option>Masculino</option>
                                        <option>Femenino</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="example-date" class="form-label">Fecha de Nacimiento</label>
                                    <input class="form-control" id="example-date" type="date" name="txtFecha">
                                </div>
                                <div class="mb-3">
                                    <label for="simpleinput" class="form-label">Responsable</label>
                                    <input type="text" id="simpleinput" class="form-control" name="txtResponsable">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cerrar</button>
                                <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <div id="mdlEditar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="standard-modalLabel">Editar Docente</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <form action="ControladorEstudiante">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="editID" class="form-label">ID</label>
                                    <input type="number" id="editID" class="form-control" name="txtID">
                                </div>
                                <div class="mb-3">
                                    <label for="editApellido" class="form-label">Apellido</label>
                                    <input type="text" id="editApellido" class="form-control" name="txtApellido">
                                </div>
                                <div class="mb-3">
                                    <label for="editNombre" class="form-label">Nombre</label>
                                    <input type="text" id="editNombre" class="form-control" name="txtNombre">
                                </div>
                                <div class="mb-3">
                                    <label for="editDNI" class="form-label">DNI</label>
                                    <input class="form-control" id="editDNI" type="number" name="txtDNI">
                                </div>
                                <div class="mb-3">
                                    <label for="editSexo" class="form-label">Sexo</label>
                                    <select class="form-select" id="editSexo" name="txtSexo">
                                        <option>Masculino</option>
                                        <option>Femenino</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="editFecha" class="form-label">Fecha de Nacimiento</label>
                                    <input class="form-control" id="editFecha" type="date" name="txtFecha">
                                </div>
                                <div class="mb-3">
                                    <label for="editResponsable" class="form-label">Responsable</label>
                                    <input type="text" id="editResponsable" class="form-control" name="txtResponsable">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cerrar</button>
                                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                            </div>
                        </form>
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
            function openEditModal(id, apellido, nombre, dni, sexo, fecha,responsable) {
                $('#editID').val(id);
                $('#editApellido').val(apellido);
                $('#editNombre').val(nombre);
                $('#editDNI').val(dni);
                $('#editSexo').val(sexo);
                $('#editFecha').val(fecha);
                $('#editResponsable').val(responsable);
                $('#mdlEditar').modal('show');
            }
        </script>
        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>

    </body>
</html>
