
<!-- Javascript para manejar la logica de los mensajes del required 
BASADO:   https://getbootstrap.com/docs/5.3/forms/validation/   -->



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
    
    // Mostrar una notificación Toastr de error
    toastr.success('Se ha añadido exitosamente!', 'Registrado');
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
    
    // Mostrar una notificación Toastr de error
    toastr.warning('no', 'No ha podido ingresar');
    }
    // Función de flecha que se ejecuta inmediatamente.
    (() => {
        'use strict'; // Modo estricto para un código más seguro y eficiente.

        // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
        const forms = document.querySelectorAll('.needs-validation');

        // Itera sobre cada formulario encontrado.
        Array.from(forms).forEach(form => {
            // Agrega un evento "submit" a cada formulario.
            form.addEventListener('submit', event => {
                // Verifica si el formulario no es válido.
                if (!form.checkValidity()) {
                    event.preventDefault(); // Previene el envío del formulario si no es válido.
                    event.stopPropagation(); // Detiene la propagación del evento para evitar otros manejadores de eventos.
                }
                form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
            }, false);
        });
    })();
    
       var id = "";

    /**
     * Esta función se encarga de mostrar el modal de confirmación antes de eliminar una tarea.
     * Se dispara cuando se muestra el modal.
     */
    $('#eliminar').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el id de la tarea desde el atributo 'data-nombre' del botón
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
            url: 'SvEliminarEditar?id=' + idTarea, // URL del servlet con el parámetro 'id' para la eliminación
            method: 'GET', // Método HTTP utilizado para la solicitud (GET en este caso)
            success: function (data) {
                // En caso de éxito en la solicitud:

                // Cierra el modal de eliminación
                $('#eliminar').modal('hide');

                // Recarga la página actual para reflejar los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola (para fines de depuración)
                console.log('Error al eliminar el perro.');
            }
        });
    }
     

</script>