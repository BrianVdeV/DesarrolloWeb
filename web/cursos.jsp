<%@page import="Modelo.*" %>
<%@page import="DAO.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Cursos | Héroes del Perú</title>
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
                                    <h4 class="page-title">Curso</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        <div class="row">
                            <div class="card">
                                <div class="card-body">
                                    <button  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregar">Agregar Curso</button>
                                    <table class="table table-centered mb-0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Año</th>
                                                <th>Horas semanales</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                DAOcurso dao = new DAOcurso();
                                                ArrayList<DTOcurso> Lista = dao.ListarCursos();
                                                DTOcurso c = null;
                                                for (int i = 0; i < Lista.size(); i++) {
                                                    c = Lista.get(i);
                                            %>  
                                            <tr>
                                                <td><%= c.getId_curso()%></td>
                                                <td><%= c.getNombre()%></td>
                                                <td><%= c.getAnio()%></td>
                                                <td><%= c.getHoras()%></td>
                                                <td class="text-center">
                                                    <a class="btn btn-warning" onclick="openEditModal('<%= c.getId_curso() %>', '<%= c.getNombre() %>', '<%= c.getAnio() %>', '<%= c.getHoras() %>')">Editar</a>
                                                    <a class="btn btn-danger" href="ControladorCurso?accion=eliminar&idcar=<%= c.getId_curso()%>">Eliminar</a>
                                                </td>
                                            </tr>
                                            <% }%>
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
            <!-- Modal Ingresar -->    
            <div id="mdlAgregar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="standard-modalLabel">Agregar Cursos</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <form action="ControladorCurso">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="simpleinput" class="form-label">Nombre</label>
                                    <input type="text" id="simpleinput" class="form-control" name="txtNombre">
                                </div>
                                <div class="mb-3">
                                    <label for="example-number" class="form-label">Año</label>
                                    <input class="form-control" id="example-number" type="number" name="txtAnio">
                                </div>
                                <div class="mb-3">
                                    <label for="example-number" class="form-label">Horas Semanales</label>
                                    <input class="form-control" id="example-number" type="number" name="txtHoras">
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

            <!-- Modal Editar -->    
            <div id="mdlEditar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="standard-modalLabel">Agregar Cursos</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <form action="ControladorCurso">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="simpleinput" class="form-label">ID</label>
                                    <input type="text" id="editId" class="form-control" name="txtId">
                                </div>
                                <div class="mb-3">
                                    <label for="simpleinput" class="form-label">Nombre</label>
                                    <input type="text" id="editNombre" class="form-control" name="txtNombre">
                                </div>
                                <div class="mb-3">
                                    <label for="example-number" class="form-label">Año</label>
                                    <input class="form-control" id="editAnio" type="number" name="txtAnio">
                                </div>
                                <div class="mb-3">
                                    <label for="example-number" class="form-label">Horas Semanales</label>
                                    <input class="form-control" id="editHoras" type="number" name="txtHoras">
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
            function openEditModal(id, nombre, anio, horas) {
                $('#editId').val(id);
                $('#editNombre').val(nombre);
                $('#editAnio').val(anio);
                $('#editHoras').val(horas);
                $('#mdlEditar').modal('show');
            }
        </script>
        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>

    </body>
</html>
