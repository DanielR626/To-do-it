

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file = "templates/header.jsp" %>

<style>
    @keyframes bounce {
        0%, 20%, 50%, 80%, 100% {
            transform: translateY(0);
        }
        40% {
            transform: translateY(-30px);
        }
        60% {
            transform: translateY(-15px);
        }
    }

    .bounce-text {
        animation: bounce 2s infinite;
    }
</style>


<section class="vh-100" style="background: linear-gradient(to top right, #000000, #000000);">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem; background-color:white">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://media.tenor.com/TUEhsnMZrUMAAAAd/project-logo.gif"
     alt="login form" 
     class="img-fluid" 
     style="border-radius: 1rem 0 0 1rem; width: 800px; height: 700px;" />

                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-white">

                                <%-- formulario para el login --%>

                                <form  action="SvLogin" method="POST">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="errorAlert">
                                        ! Por Favor rellene los Campos!
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>

                                    <div class="alert alert-success alert-dismissible fade show" role="alert" style="display: none;" id="registroSuccessAlert">
                                        Exito en el registro.
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>


                                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="registroErrorAlert">
                                        Cedula ya registrada!.
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>


 

<div class="d-flex align-items-center mb-3 pb-1">
    <span class="h1 fw-bold mb-0 bounce-text" style="color: black;">Proyecto Tareas</span>
</div>


                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Iniciar sesión</h5>

                                    <div class="form-outline mb-4">
                                        <input type="number" id="form2Example17" class="form-control form-control-lg"name="Cedula" />
                                        <label class="form-label" for="form2Example17" style="color: black;">DIGITE CEDULA</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="form2Example27" class="form-control form-control-lg"name="contrasenia" />
                                        <label class="form-label" for="form2Example27" style="color: black;">DIGITE CONTRASEÑA</label>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" type="submit" style="background-color: #ff8282; ">Login</button>
                                    </div>

                                    <p class="mb-5 pb-lg-2" style="color: #8bffc2;"> <a href="#!" style="color: #1A1A1A;" data-bs-toggle="modal" data-bs-target="#exampleModal">Regístrate aquí</a></p>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ventana Modal para formulario de registro de nuevos usuarios-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color: white;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" style="color: black;">Registro de Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="background-color: #FFFFFF;"></button>
            </div>
            <div class="modal-body">
                <form action="SvUsuario" method="POST">

                    <div id="usuario-details">
                        <div class="form-group">
                            <label for="Cedula" style="color: black;">Cedula</label>
                            <input type="number" id="Cedulan" class="form-control form-control-lg" name="Cedulan" required>
                            <div class="invalid-feedback" style="color: black;">ingresa tu cédula.</div>
                        </div>

                        <div class="form-group">
                            <label for="NombreUsuario" style="color: black;">Nombre de usuario</label>
                            <input type="text" id="NombreUsuarion" class="form-control form-control-lg" name="NombreUsuarion" required>
                            <div class="invalid-feedback" style="color: black;"> ingresa tu nombre de usuario.</div>
                        </div>

                        <div class="form-group">
                            <label for="Contrasenia" style="color: black;">Contraseña</label>
                            <input type="password" id="Contrasenian" class="form-control form-control-lg" name="Contrasenian" required>
                            <div class="invalid-feedback" style="color: black;">Por favor, ingresa tu contraseña.</div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-dark btn-lg btn-block" id="btnRegistrar" style="background-color: #f96e7f;">Registrarse</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="color: black; background-color: #8bffc2;">Exit</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // Agrega un controlador de clic al enlace "Regístrate aquí"
        $("a[href='#exampleModal']").on('click', function () {
            // Muestra el modal cuando se hace clic en el enlace
            $('#exampleModal').modal('show');
        });
    });
</script>

<!-- JavaScript para mostrar la alerta cuando falle el proceso de login -->
<script>
    // JavaScript para mostrar la alerta cuando sea necesario
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const errorAlert = document.getElementById('errorAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=error')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'error') {
            // Muestra la alerta si el parámetro de alerta es 'error'
            errorAlert.style.display = 'block';
        }
    });
</script>

<!-- JavaScript para mostrar la alerta de registro cuando exista una cedula previamente registrada -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const registroErrorAlert = document.getElementById('registroErrorAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=registro-error')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'registro-error') {
            // Muestra la alerta de registro si el parámetro de alerta es 'registro-error'
            registroErrorAlert.style.display = 'block';
        }
    });
</script>

<!-- JavaScript para mostrar la alerta de registro exitoso cuando sea necesario -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const registroSuccessAlert = document.getElementById('registroSuccessAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=registro-success')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'registro-success') {
            // Muestra la alerta de registro exitoso si el parámetro de alerta es 'registro-success'
            registroSuccessAlert.style.display = 'block';
        }
    });
</script>

<script>
    function validarFormulario() {
        var cedula = document.getElementById("form2Example17").value;
        var contrasenia = document.getElementById("form2Example27").value;

        if (cedula === "" || contrasenia === "") {
            document.getElementById("errorAlert").style.display = 'block';
            return false; // Evita que se envíe el formulario si faltan campos.
        }

        return true; // Envía el formulario si los campos están completos.
    }
</script>

<%@include file = "templates/footer.jsp" %>


