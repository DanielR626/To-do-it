

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.umariana.mundo.Tarea"%>
<%@page import="com.umariana.mundo.Lista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "templates/header.jsp" %>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">


<% String usuarioVerificado = (String) session.getAttribute("usuarioverificado");%>

<style>

/* Estilos personalizados */
.navbar-custom {
  background-color: #007f00; /* Cambia el color de fondo */
  border-bottom: 3px solid #ff6219; /* Agrega un borde inferior */
}

.navbar-custom .navbar-brand {
  font-size: 30px;
  color: #fff; /* Cambia el color del texto */
}

.navbar-custom .nav-link {
  font-size: 20px;
  color: #fff; /* Cambia el color del texto */
}

.navbar-custom .navbar-toggler-icon {
  background-color: #fff; /* Cambia el color del icono del botón */
}

/* Cambia el color del botón del menú desplegable cuando está abierto */
.navbar-custom .navbar-toggler-icon.collapsed {
  background-color: #fff;
}

.encabezado-personalizado {
    font-family: 'Nombre de tu fuente', sans-serif; /* Reemplaza 'Nombre de tu fuente' con el nombre real de tu fuente */
    color: white;
    animation: rebote 1s infinite; /* Animación de rebote durante 1 segundo, infinitamente */
}

@keyframes rebote {
    0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
    }
    40% {
        transform: translateY(-30px); /* Ajusta el valor de -30px según tus preferencias de rebote */
    }
    60% {
        transform: translateY(-15px); /* Ajusta el valor de -15px según tus preferencias de rebote */
    }
}



</style>



<section class="vh-100" style="background-image: url('https://img.freepik.com/fotos-premium/resumen-fondo-olas_967467-537.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
    <!-- Contenido de tu sección -->

    <!-- Contenido de tu sección aquí -->
<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container">
    <a class="navbar-brand">Bienvenido a Gestion De Tareas</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Tareas.jsp">Actualizar Página</a>
        </li>
      </ul>
    </div>
  </div>
</nav>



                    
                    
        <!-- Alertas de notificacion(tarea agregada y tarea eliminada -->          
        <div class="alert alert-success text-center" role="alert" style="display: none;" id="successAlert">
            <strong>Exito</strong>
        </div>
        <div class="alert alert-success text-center" role="alert" style="display: none;" id="successAlertEliminada">
            <strong>eliminada con exito</strong>    
        </div>
        <div class="alert alert-success text-center" role="alert" style="display: none;" id="editAlert">
            <strong>editada con exito</strong> 
        </div>
        <%-- formulario para agregar tareas --%>
<h1 class="text-center mt-4 mb-4" style="color: white; font-family: 'Nombre de tu fuente', sans-serif; animation: rebote 2s infinite;">Tareas Almacenadas</h1>
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center" style="margin-top: -90px;"> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                <div class="card card-body text-center" style="background-color: #fff; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                     <h4 class="text-center" style="color: #f96e7f; font-family: 'Roboto', sans-serif;">Formulario de Tareas</h4>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="errorAlert">
                        existe esta tarea 
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <form action="SvTarea" method="POST" style="height: 50%; overflow: hidden;">
                        <div class="input-group mb-3">
                            <span class="input-group-text" style="width: 100px;">Id</span>
                            <input type="number" name="id" class="form-control"required>
                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text" style="width: 100px;">Titulo</span>
                            <input type="text" name="titulo" class="form-control"required>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" style="width: 100px;">Descripcion</span>
                            <input type="text" name="descripcion" class="form-control"required>
                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text" style="width: 100px;">Fecha de vencimiento</span>
                            <input type="date" name="fechaV" class="form-control"required>
                        </div>
                        <button type="button" class="btn btn-primary mt-3" data-bs-toggle="modal" data-bs-target="#tareasModal" style="background-color: #f96e7f; border-color: #ff6219;">Opcion de ordenamiento</button>

                        <!-- Radio buttons para seleccionar la posicion de la nueva tarea en la lista -->
                        <div class="tareas-container"style="display: none;">
                            
                        </div>

                        <button type="submit" class="btn btn-primary mt-3" style="background-color: #007f00; border-color: #ff6219;">Agregar tarea</button>
                    </form>
                </div>
            </div>

            <%-- tabla para visualizar las tareas agregadas --%>
            <div class="col-md-8">
                <div>
                    <table class="table table-striped table-dark">
                        <thead
                            <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Titulo</th>
                        <th scope="col"">Descripción</th>
                        <th scope="col">Fecha de vencimiento</th>
                        <th scope="col">Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
                                Lista listaTareas = (Lista) session.getAttribute("listaTareas");

                                if (listaTareas != null) {
                                    Lista.Nodo nodoActual = listaTareas.inicio;
                                    while (nodoActual != null) {
                                        Tarea tarea = nodoActual.tarea;
                            %>
                            <tr>
                                <td><%= tarea.getId()%></td>
                                <td><%= tarea.getTitulo()%></td>
                                <td><%= tarea.getDescripcion()%></td>
                                <td><%= new SimpleDateFormat("yyyy-MM-dd").format(tarea.getFechaDeVencimiento())%></td>
                                <td>
                                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tareaModal"
                                       onclick="showTareaDetails(<%= tarea.getId()%>, '<%= tarea.getTitulo()%>', '<%= tarea.getDescripcion()%>', '<%= new SimpleDateFormat("yyyy-MM-dd").format(tarea.getFechaDeVencimiento())%>')"
                                       title="Ver detalles" data-bs-toggle="tooltip" data-bs-placement="top">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editarModal"
                                       data-id="<%= tarea.getId()%>"
                                       data-titulo="<%= tarea.getTitulo()%>"
                                       data-descripcion="<%= tarea.getDescripcion()%>"
                                       data-fecha="<%= new SimpleDateFormat("yyyy-MM-dd").format(tarea.getFechaDeVencimiento())%>"
                                       title="Editar tarea" data-bs-toggle="tooltip" data-bs-placement="top">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>
                                    <a onclick="eliminarTarea(<%= tarea.getId()%>)" class="btn btn-danger" title="Eliminar tarea" data-bs-toggle="tooltip" data-bs-placement="top">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                        nodoActual = nodoActual.siguiente;
                                    }
                                } else {
                                    out.println("<div style='color: white;'>No existen tareas.</div>");

                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
</section>
<%@include file = "templates/footer.jsp" %>
<!-- Verificamos si la lista esta vacia -->
<%
    Lista lista = (Lista) session.getAttribute("listaTareas");
    boolean listaVacia = (lista == null) || lista.verificarContenido();
%>
<!-- JavaScript para verificar si la lista de tareas esta vacia o no,
inicialmente si no hay tareas agregadas en la lista, los radio buttons no seran visibles en la pagina, de lo contrario seran visibles -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var listaVacia = <%= listaVacia%>;
        var tareasContainer = document.querySelector(".tareas-container");

        if (listaVacia) {
            tareasContainer.style.display = "none";
        } else {
            tareasContainer.style.display = "block";
        }
    });
</script>

<!-- JavaScript para lanzar una alerta de error de id duplicada -->
<script>
    // JavaScript para mostrar la alerta de error
    document.addEventListener("DOMContentLoaded", function () {
        const errorAlert = document.getElementById('errorAlert');
        errorAlert.style.display = 'none';

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=error')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'error') {
            // Muestra la alerta si el parámetro de alerta es 'error'
            errorAlert.style.display = 'block';
        }
    });
</script>

<!-- JavaScript para mejorar la funcionalidad de los radio buttons si se selecciona o se desactiva -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var antesDeRadio = document.getElementById("antesDeRadio");
        var despuesDeRadio = document.getElementById("despuesDeRadio");
        var idAntesDeInput = document.getElementById("idAntesDe");
        var idDespuesDeInput = document.getElementById("idDespuesDe");
        var primeroRadio = document.getElementById("primeroRadio");
        var ultimoRadio = document.getElementById("ultimoRadio");

        idAntesDeInput.disabled = true;
        idDespuesDeInput.disabled = true;

        antesDeRadio.addEventListener("click", function () {
            idAntesDeInput.disabled = !antesDeRadio.checked;
            idDespuesDeInput.disabled = true;
        });

        despuesDeRadio.addEventListener("click", function () {
            idDespuesDeInput.disabled = !despuesDeRadio.checked;
            idAntesDeInput.disabled = true;
        });

        primeroRadio.addEventListener("click", function () {
            idAntesDeInput.disabled = true;
            idDespuesDeInput.disabled = true;
        });

        ultimoRadio.addEventListener("click", function () {
            idAntesDeInput.disabled = true;
            idDespuesDeInput.disabled = true;
        });
    });
</script>

<!-- JavaScript para confirmar eliminacion de una tarea -->
<script>
    function eliminarTarea(id) {
        if (confirm("¿ Seguro de eliminar esta tarea?")) {
            location.href = "SvTarea?tipo=delete&id=" + id;
        }
    }
</script>

<!-- Ventana Modal para Editar Tarea -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border" style="background-color: #fff; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
            <div class="modal-header" style="background-color: #fff;">
                <h5 class="modal-title" id="editarModalLabel" style="color: #007f00;">Editar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="SvEditarTarea" method="POST">
                    <!-- Campo oculto para almacenar el ID de la tarea -->
                    <input type="hidden" name="id" id="editar-tarea-id" value="">
                    <!-- Input para editar el título -->
                    <div class="mb-3">
                        <label for="titulo" class="form-label" style="color: black;">Título</label>
                        <input type="text" class="form-control" id="editar-tarea-titulo" name="titulo">
                    </div>
                    <!-- Input para editar la descripción -->
                    <div class="mb-3">
                        <label for="descripcion" class="form-label" style="color: black;">Descripción</label>
                        <textarea class="form-control" id="editar-tarea-descripcion" name="descripcion"></textarea>
                    </div>
                    <!-- Input para editar la fecha -->
                    <div class="mb-3">
                        <label for="fecha" class="form-label" style="color: black;">Fecha de vencimiento</label>
                        <input type="date" class="form-control" id="editar-tarea-fecha" name="fecha">
                    </div>
                    <!-- Botón para guardar cambios -->
                    <button type="submit" class="btn btn-primary" style="background-color: #f96e7f; border-color: #ff6219;">Guardar Cambios</button>
                </form>
            </div>
            <div class="modal-footer" style="background-color: #fff;">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="color: white;">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="tareasModal" tabindex="-1" aria-labelledby="tareasModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Copiar el contenido original al cuerpo del modal -->
            <div class="modal-body">
                <div class="tareas-container" style="display: block;">
                    <h6 class="text-center" style="color: black;">marque una posición en la que quiere agregar la tarea</h6>
                    <div class="mb-3 form-check">
                        <input class="form-check-input" type="radio" name="posicion" id="primeroRadio" value="primero">
                        <label class="form-check-label" for="primeroRadio" style="color: black;">
                            Primera 
                        </label>
                    </div>
                    <div class="mb-3 form-check">
                        <input class="form-check-input" type="radio" name="posicion" id="ultimoRadio" value="ultimo">
                        <label class="form-check-label" for="ultimoRadio" style="color: black;">
                            Última
                        </label>
                    </div>
                    <div class="mb-3 form-check">
                        
                    </div>
                    <div class="mb-3 form-check">
                        
                    </div>
                </div>
            </div>
            <!-- Agregar botones de acción en el footer del modal -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" style="background-color: #ff6219; border-color: #ff6219;" onclick="agregarTarea()">Elejir opcion</button>
            </div>
        </div>
    </div>
</div>


<!-- Script para prellenar los campos de edición -->
<script>
    $('#editarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que desencadenó el evento
        var id = button.data('id'); // Obtén el ID de la tarea
        var titulo = button.data('titulo'); // Obtén el título de la tarea
        var descripcion = button.data('descripcion'); // Obtén la descripción de la tarea
        var fecha = button.data('fecha'); // Obtén la fecha de la tarea

        // Rellena los campos del formulario de edición con los datos de la tarea
        $('#editar-tarea-id').val(id);
        $('#editar-tarea-titulo').val(titulo);
        $('#editar-tarea-descripcion').val(descripcion);
        $('#editar-tarea-fecha').val(fecha);
    });
</script>

<!-- Ventana Modal con la Informacion de la Tareas -->
<div class="modal fade" id="tareaModal" tabindex="-1" aria-labelledby="tareaModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content border" style="background-color: #fff; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
            <div class="modal-header" style="background-color: #fff;">
                <h5 class="modal-title" id="tareaModalLabel"style="color: black;">tarea</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="tarea-details">
                    <p style="color: black;"><strong>ID:</strong> <span id="tarea-id"></span></p>
                    <p style="color: black;"><strong>Título:</strong> <span id="tarea-titulo"></span></p>
                    <p style="color: black;"><strong>Descripción:</strong> <span id="tarea-descripcion"></span></p>
                    <p style="color: black;"><strong>Fecha:</strong> <span id="tarea-fecha"></span></p>
                </div>
            </div>
            <div class="modal-footer" style="background-color: #fff;">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="color: black;">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Funcion para visualizar infromacion actual de la tareas -->
<script>
    function showTareaDetails(id, titulo, descripcion, fecha) {
        var modal = $('#tareaModal');
        modal.find('#tarea-id').text(id);
        modal.find('#tarea-titulo').text(titulo);
        modal.find('#tarea-descripcion').text(descripcion);
        modal.find('#tarea-fecha').text(fecha);
    }
</script>

<!-- Nombres de los botones de la tabla con tooltip -->
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>

<!-- Funcion para activar la alerta de exito cuando se agrega una tarea -->
<script>
    // JavaScript para mostrar la alerta de éxito cuando sea necesario
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const successAlert = document.getElementById('successAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=success')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'success') {
            // Muestra la alerta si el parámetro de alerta es 'success'
            successAlert.style.display = 'block';
            // Oculta la alerta después de 2.5 segundos (2500 milisegundos)
            setTimeout(function () {
                successAlert.style.display = 'none';
            }, 2500);
        }
    });
</script>

<!-- JavaScript para activar la alerta que indica que una tarea fue eliminada -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('eliminada') && urlParams.get('eliminada') === 'success') {
            const successAlertEliminada = document.getElementById('successAlertEliminada');
            successAlertEliminada.style.display = 'block';
            setTimeout(function () {
                successAlertEliminada.style.display = 'none';
            }, 2500); // Tiempo de visualización de la alerta en milisegundos (2.5 segundos en este caso)
        }
    });
</script>

<!-- JavaScript para activar la alerta que indica que una tarea fue editada -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        const alertType = urlParams.get('alert');

        if (alertType === 'edit') {
            const editAlert = document.getElementById('editAlert');
            editAlert.style.display = 'block';

            setTimeout(function () {
                editAlert.style.display = 'none';
            }, 2500); // 2500 milisegundos equivalen a 2.5 segundos
        }
    });
    
  

</script>
<script>
function agregarTarea() {
    // Obtiene los valores del formulario original
    var id = document.querySelector('input[name="id"]').value;
    var titulo = document.querySelector('input[name="titulo"]').value;
    var descripcion = document.querySelector('input[name="descripcion"]').value;
    var fechaV = document.querySelector('input[name="fechaV"]').value;
    
    // Obtiene la posición seleccionada
    var radios = document.getElementsByName('posicion');
    var posicion;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            posicion = radios[i].value;
            break;
        }
    }
    
    // Lógica para agregar la tarea según la posición seleccionada
    if (posicion === 'primero') {
        // Agregar tarea al principio de la lista
        // ...
    } else if (posicion === 'ultimo') {
        // Agregar tarea al final de la lista
        // ...
    } else if (posicion === 'antesDe') {
        var idAntesDe = document.querySelector('input[name="idAntesDe"]').value;
        // Agregar tarea antes de la tarea con ID especificado
        // ...
    } else if (posicion === 'despuesDe') {
        var idDespuesDe = document.querySelector('input[name="idDespuesDe"]').value;
        // Agregar tarea después de la tarea con ID especificado
        // ...
    }
    
    // Cierra el modal
    $('#tareasModal').modal('hide');
}

    
    
</script>