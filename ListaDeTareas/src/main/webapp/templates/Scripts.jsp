<script>
    
    function tareaSi() {
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
    
    // Mostrar una notificaci�n Toastr de error
    toastr.success('Se ha a�adido exitosamente!', 'Registrado');
    }
    
    function tareaNo(){
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
    
    // Mostrar una notificaci�n Toastr de error
    toastr.warning('no', 'No ha podido ingresar');
    }
    // Funci�n de flecha que se ejecuta inmediatamente.
    (() => {
        'use strict'; // Modo estricto para un c�digo m�s seguro y eficiente.

        // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
        const forms = document.querySelectorAll('.needs-validation');

        // Itera sobre cada formulario encontrado.
        Array.from(forms).forEach(form => {
            // Agrega un evento "submit" a cada formulario.
            form.addEventListener('submit', event => {
                // Verifica si el formulario no es v�lido.
                if (!form.checkValidity()) {
                    event.preventDefault(); // Previene el env�o del formulario si no es v�lido.
                    event.stopPropagation(); // Detiene la propagaci�n del evento para evitar otros manejadores de eventos.
                }
                form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
            }, false);
        });
    })();
    
       var id = "";

    /**
     * Esta funci�n se encarga de mostrar el modal de confirmaci�n antes de eliminar una tarea.
     * Se dispara cuando se muestra el modal.
     */
    $('#eliminar').on('show.bs.modal', function (event) {
        // Obtiene el bot�n que desencaden� el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el id de la tarea desde el atributo 'data-nombre' del bot�n
        var idTarea = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);

        // Almacena el nombre de la tarea en la variable global 'id'
        id = idTarea;

    });
    
     function eliminarTarea() {
        // Obtiene el id de la tarea desde una variable previamente definida (id)
        var idTarea = id;

        // Realiza una solicitud AJAX al servlet 'SvEliminarEditar' para eliminar la tarea
        $.ajax({
            url: 'SvEliminarEditar?id=' + idTarea, // URL del servlet con el par�metro 'id' para la eliminaci�n
            method: 'GET', // M�todo HTTP utilizado para la solicitud (GET en este caso)
            success: function (data) {
                // En caso de �xito en la solicitud:

                // Cierra el modal de eliminaci�n
                $('#eliminar').modal('hide');

                // Recarga la p�gina actual para reflejar los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al eliminar el perro.');
            }
        });
    }
     

</script>

<%
    
    String a�adido=request.getParameter("add");
    System.out.println("----------------------");
    System.out.println(a�adido);
    
    if (a�adido != null && a�adido.equals("no")) {
%>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            tareaNo();
            
        });
    </script>
<%  request.removeAttribute("add");
    }else if(a�adido != null && a�adido.equals("si")){
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
    
    // Mostrar una notificaci�n Toastr de error
    toastr.success('Se ha registrado exitosamente!', 'Registrado');
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
    
    // Mostrar una notificaci�n Toastr de error
    toastr.warning('La cedula o contrase�a no son correctas', 'No ha podido ingresar');
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
    
    // Mostrar una notificaci�n Toastr de error
    toastr.error('Ya existe un usuario registrado con esa cedula', 'Error');
}

</script>
<%
    //Llamamos variable de registrado para obtener banderas de si fue registrado o no el usuario
    String registrado = (String) request.getAttribute("registrado");
        
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
    request.removeAttribute("registrado");
    request.removeAttribute("valido");
%>