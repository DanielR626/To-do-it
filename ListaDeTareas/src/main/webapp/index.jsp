
<div class="background"></div>


<form action="SvLoginCheck" method="POST">
    <section class="home">
        
        <div class="login">
            <h2>Iniciar Sesion</h2>
           
            <div class="input">
                <input type="text" class="input1" name="cedula" placeholder="Digite Cédula" maxlength="10" required pattern="[0-9]+" title="Solo se permiten números">
                 <i class="fa-solid fa-id-card fa-lg" style="color: #499EBF;"></i>
            </div>
            
            <div class="input">
                <input type="password" class="input1" name="contrasenia" placeholder="Digite Contraseña" required>
                <i class="fa-solid fa-lock fa-lg" style="color: #499EBF;"></i>
            </div>
            
            <div class="button">
                <button type="submit" class="btn">Ingresar</button>
            </div>
           
            <div class="sign-up">
                <p>No tiene una cuenta?</p>
              
                <ingresar type="button" class="btn btn-outline-light"  style="color: black" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >
                    <a href="#" >Regístrese aqui</a>
                </ingresar>
            </div>
        </div>
                
        <div class="content">
            <a href="#" class="logo"><i class=""> </i>  </a>
            <h2>       Gestion de Tareas </h2>          
          
            <br>
            <h3> 
        </div>
    </section>
</form>




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
                        <input type="text" class="form-control" id="floatingInputValue" name="cedula" placeholder="Ingrese su cédula" value="" maxlength="10" required pattern="[0-9]+" title="Solo se permiten números">
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
             
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Registrar Usuario</button>
                </div>
            </div>
        </div>
    </form>
</div>


<div class="modal fade" id="registrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registradoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h2>Usuario registrado exitosamente</h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
</div>



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>





<%@include file= "templates/footer.jsp" %>
<%@include file= "templates/header.jsp" %>
<%@include file= "templates/Scripts.jsp" %>

<%@include file= "templates/style.jsp" %>