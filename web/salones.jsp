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
                                                <th>Aula</th>
                                                <th>Aforo</th>
                                                <th>Pabellón</th>
                                                <th>Descripción</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                DAOsalon dao = new DAOsalon();
                                                ArrayList<DTOsalon> Lista = dao.ListarSalones();
                                                DTOsalon s = null;
                                                for (int i = 0; i < Lista.size(); i++) {
                                                    s = Lista.get(i);
                                            %>
                                            <tr>
                                                <td><%= s.getId_salon()%></td>
                                                <td><%= s.getNombre()%></td>
                                                <td><%= s.getCapacidad()%></td>
                                                <td><%= s.getUbicacion()%></td>
                                                <td><%= s.getDescripcion()%></td>
                                                <td class="text-center">
                                                    <a class="btn btn-warning" onclick="openEditModal('<%= s.getId_salon()%>', '<%= s.getNombre()%>', '<%= s.getCapacidad()%>', '<%= s.getUbicacion()%>', '<%= s.getDescripcion()%>')">Editar</a>
                                                    <a class="btn btn-danger" href="ControladorSalon?accion=eliminar&idsalon=<%= s.getId_salon()%>">Eliminar</a>
                                                </td>
                                            </tr>
                                            <% } %>
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
                            <h4 class="modal-title" id="standard-modalLabel">Agregar Salón</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <form action="ControladorSalon">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="txtAula" class="form-label">Aula</label>
                                    <input type="text" id="txtAula" class="form-control" name="txtNombre">
                                </div>
                                <div class="mb-3">
                                    <label for="simpleinput" class="form-label">Aforo</label>
                                    <input type="number" id="simpleinput" class="form-control" name="txtCapacidad">
                                </div>
                                <div class="mb-3">
                                    <label for="txtUbicacion" class="form-label">Pabellón</label>
                                    <input type="text" id="txtUbicacion" class="form-control"  name="txtUbicacion">
                                </div>
                                <div class="mb-3">
                                    <label for="txtDescripcion" class="form-label">Descripcion</label>
                                    <input type="text" id="txtDescripcion" class="form-control" name="txtDescripcion">
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
                        <form action="ControladorSalon">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="editID" class="form-label">ID</label>
                                    <input type="number" id="editID"  class="form-control" name="txtID">
                                </div>
                                <div class="mb-3">
                                    <label for="editNombre" class="form-label">Aula</label>
                                    <input type="text" id="editNombre" class="form-control" name="txtNombre">
                                </div>
                                <div class="mb-3">
                                    <label for="editCapacidad" class="form-label">Aforo</label>
                                    <input type="number" id="editCapacidad" class="form-control" name="txtCapacidad">
                                </div>
                                <div class="mb-3">
                                    <label for="editUbicacion" class="form-label">Pabellón</label>
                                    <input type="text" id="editUbicacion" class="form-control"  name="txtUbicacion">
                                </div>
                                <div class="mb-3">
                                    <label for="editDescripcion" class="form-label">Descripcion</label>
                                    <input type="text" id="editDescripcion" class="form-control" name="txtDescripcion">
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
            function openEditModal(id, nombre, capacidad, ubicacion, descripcion) {
                $('#editID').val(id);
                $('#editNombre').val(nombre);
                $('#editCapacidad').val(capacidad);
                $('#editUbicacion').val(ubicacion);
                $('#editDescripcion').val(descripcion);
                $('#mdlEditar').modal('show');
            }
        </script>
        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>

    </body>
</html>
