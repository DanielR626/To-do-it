
<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<!-- Inclución deL STYLE -->
<%@include file= "style/style.jsp" %>

<div class="background"></div>


<form action="SvLoginCheck" method="POST">
    <section class="home">
        <!--Login-->
        <div class="login">
            <h2>Ingresar</h2>
            <!--Cedula-->
            <form>
  <div class="input">
    <input type="number" class="input1" name="cedula" placeholder="Cédula Usuario" min="0" step="1" required>
    <i class="fa-solid fa-id-card fa-lg" style="color: #499EBF;"></i>
  </div>
</form>

            <!--Contraseña-->
            <div class="input">
                <input type="password" class="input1" name="contrasenia" placeholder="Contraseña" required>
                <i class="fa-solid fa-lock fa-lg" style="color: #499EBF;"></i>
            </div>
            <!--Boton ingresar-->
            <div class="button">
                <button type="submit" class="btn">Ingresar</button>
            </div>
            <!--Registrarse-->
            <div class="sign-up">
                <p>No tiene una cuenta?</p>
                <!--Llama modal para registrarse-->
                <ingresar type="button" class="btn btn-outline-light"  style="color: black" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >
                    <a href="#" >Regístrese aqui</a>
                </ingresar>
            </div>
        </div>
                <!--Informacion de la pagina -->
        <div class="content">
            <a href="#" class="logo"><i class=""></i>   </a>
            <h2> Gestión de Tareas </h2>          
            
            <br>
             
        </div>
    </section>
</form>

<%
    //Llamamos variable de registrado para obtener banderas de si fue registrado o no el usuario
    String registrado = (String) request.getAttribute("exito en el registrado");
        
    //En caso de que si se registra exitosamente
    if (registrado != null && registrado.equals("si")) {

%>
    <!--Llama metodo de JS para mostrar la modal de registrado existosamente-->
    <script>
        $(document).ready(function () {
            usuarioR();
        });
    </script>
<%    } 
        //En caso de que no se registra exitosamente
       else if(registrado != null && registrado.equals("no")){
%>
    <!--Llama metodo de JS para mostrar la modal de NO registrado existosamente-->
    <script>
        $(document).ready(function () {
            usuarioNoR();
        });
    </script>
<%
    }
    //Llamamos variable para saber si los datos de ingreso son validos
    String valido=request.getParameter("valido");
    //En caso de no ser validos
    if (valido != null && valido.equals("false")) {
%>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            usuarioNoI();
        });
    </script>
<%
    }
    // Elimina los atributos "registrado" e "ingresar" de la solicitud
    request.removeAttribute("exito en el registro");
    request.removeAttribute("valido");
%>

<!-- Modal para registrar el usuario -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <form action="SvRegister" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de Usuarios</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Cedula -->
                    <br>
                    <formu class="form-floating">
                        <input type="number" class="form-control" id="floatingInputValue" name="cedula" placeholder="Ingrese su cédula" value="" maxlength="10" required pattern="[0-9]+" title="Solo se permiten números">
                        <label for="floatingInputValue">Cédula</label>
                    </formu>
                    

                    <!-- Usuario -->
                    <br>
                    <formu class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="nombre" placeholder="Ingrese su cédula" value="" required>
                        <label for="floatingInputValue">Nombre de Usuario</label>
                    </formu>
                    <!-- Contraseña -->
                    <br>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" name="contrasenia" placeholder="Password" required>
                        <label for="floatingPassword">Contraseña</label>
                    </div>
                </div>
                <!-- Footer con botones -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Registrar Usuario</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Modal registro exitoso-->
<div class="modal fade" id="registrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registradoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h2>Exito en el Registro</h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Exit</button>
                </div>
            </div>
        </div>
</div>



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


<!-- Script para llamar los toastr. BASADO: https://codeseven.github.io/toastr/demo.html
    BASADO: https://getbootstrap.com/docs/5.3/components/toasts/-->
<script>
    function usuarioR() {
        toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    
    // Mostrar una notificación Toastr de error
    toastr.success('Registro Existoso', 'Registrado');
    }
    
    function usuarioNoI(){
         toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    
    // Mostrar una notificación Toastr de error
    toastr.warning('Cedula o Contraseña incorrecto', 'ingreso denegado');
    }
    
    
   function usuarioNoR() {
    // Configurar opciones Toastr
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    
    // Mostrar una notificación Toastr de error
    toastr.error('Ya existe este usuario', 'Ingresa un usuario diferente ');
}

</script>


<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
