<%@page import="com.mundo.lista.Lista"%>
<%@page import="com.mundo.lista.Serializacion"%>
<%@page import="com.mundo.lista.Tareas"%>




<%String usuario = request.getParameter("usuarioI");%>


<%
    
    String añadido=request.getParameter("add");
    System.out.println("----------------------");
    System.out.println(añadido);
    
    if (añadido != null && añadido.equals("no")) {
%>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            tareaNo();
            
        });
    </script>
<%  request.removeAttribute("add");
    }else if(añadido != null && añadido.equals("si")){
    %>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            tareaSi();
        });
    </script>
    <% request.removeAttribute("add");
}

%>

<!-- Mensaje personalizado al ingresar -->

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Gestión de Tareas</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Actualizar Página</a>
                </li>
            </ul>
        </div>
    </div>
</nav>



<!-- Tabla -->

<div class="container p-4"> 
    <div class="row">
        <div class="col-md-4">  <!-- clase division por 4 columnas -->
            <div class="card card-body">
                <form class="row g-3 needs-validation" action="SvLoginCheck" method="GET" novalidate >
                    <input type="hidden" name="usuarioI" value="<%=usuario%>">
                    <!-- ID -->

                    <div class="input-group">
                        <label for="validationCustomUsername" class="form-label">Id</label>
                        <div class="input-group">
                            <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-id-card"></i></span>
                            <input type="number" name="id" class="form-control" min="0" step="1"id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                           
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                                Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                                Introduce un id válido.
                            </div> 
                        </div>
                    </div>

                    <!-- Titulo -->

                    <div class="input-group">
                        <div class="input-group">
                            <formu class="form-floating">
                                <input type="text" class="form-control" id="floatingInputValue" name="titulo" placeholder="Ingrese el Titulo" value="" required="">
                                <label for="floatingInputValue">Titulo</label>
                                <!-- Verificacion -->
                                <div class="valid-feedback">
                                    Se mira bien!
                                </div>
                                <!-- En caso de no tener nada -->
                                <div class="invalid-feedback">
                                    Introduce un titulo válido.
                                </div> 
                            </formu></div>
                    </div>

                    <!-- Descripcion -->

                    <div class="input-group">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                            <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Required example textarea" required></textarea>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                                Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                                Introduce una descripcion válida.
                            </div> 
                        </div>    
                    </div>

                    <!-- Fecha -->  
                    <div class="input-group">
                        <label for="validationCustom05" class="form-label">Fecha</label>
                        <div class="input-group">
                            <input type="date" class="form-control"  name="fecha" id="validationCustom05" required>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                                Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                                Introduce una fecha válida.
                            </div> 
                        </div>
                    </div>

                    <!-- Boton centrado -->
                    <center>
                        <button type="submit" class="btn btn-outline-primary">Agregar Tarea</button>
                    </center>
                </form>
            </div>

        </div> 

        <div class="col-md-8">
            <!-- poner tabla aquí-->

            <div class="card card-body">
                <table class="table table-striped table-hover">
                    <!-- Primera fila -->   
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <!-- Contenido tabla -->
                    <tbody>
                        <%
                            Lista listaTareas = new Lista();
                            // Obtener el contexto del servlet
                            ServletContext context = getServletContext();

                            listaTareas = Serializacion.leerTareas(context);
                            if (listaTareas == null) {
                                listaTareas = new Lista();
                            }

                            String tablaHTML = listaTareas.generarTabla();
                        %>
                    <div>
                        <%= tablaHTML%>
                    </div>

                    </tbody>
                </table>
            </div>
        </div>
    </div></div>

<!-- Modal eliminar tarea-->
<div class="modal fade" id="eliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h2>¿Estás seguro de que deseas eliminar esta tarea?</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" onclick="eliminarTarea()">Eliminar</button>
            </div>
        </div>
    </div>
</div>




<%@include file= "templates/footer.jsp" %>
<%@include file= "templates/header.jsp" %>
<%@include file= "templates/cssLogin.jsp" %>
<%@include file= "templates/scriptsLogin.jsp" %>