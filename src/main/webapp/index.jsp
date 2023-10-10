<%-- 
    Document   : index
    Created on : 4/10/2023, 5:21:33 p. m.
    Author     : DANIEL REVELO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="index.css">
        <title>Listas</title>
        
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Poppins', sans-serif;
            }

            section {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                width: 100%;
                background: url('https://i.blogs.es/d5130c/wallpaper-2.png/1366_2000.jpeg') no-repeat;
                background-position: center;
                background-size: cover;
            }

            .form-box {
                position: relative;
                width: 400px;
                height: 450px;
                background: rgba(0, 0, 0, 0.5); /* Cambié transparent a rgba() */
                border: 2px solid rgba(255, 255, 255, 0.5);
                border-radius: 20px;
                backdrop-filter: blur(10px); /* Cambié flex a blur() */
                display: flex; /* Agregado display:flex */
                justify-content: center;
                align-items: center;
            }

            h2 {
                font-size: 2em;
                color: #fff;
                text-align: center;
            }

            .inputbox {
                position: relative;
                margin: 30px 0;
                width: 310px;
                border-bottom: 2px solid #fff;
            }

            .inputbox label {
                position: absolute;
                top: 50%;
                left: 5px;
                transform: translateY(-50%);
                color: #fff;
                font-size: 1em;
                pointer-events: none;
                transition: .5s;
            }

            input:focus ~ label,
            input:valid ~ label {
                top: -5px;
            }

            .inputbox input {
                width: 100%;
                height: 50px;
                background: transparent;
                border: none;
                outline: none;
                font-size: 1em;
                padding: 0 35px 0 5px;
                color: #fff;
            }

            .inputbox ion-icon {
                position: absolute;
                right: 8px;
                color: #fff;
                font-size: 1.2em;
                top: 20px;
            }

            .forget {
                margin: -15px 0 15px;
                font-size: .9em;
                color: #fff;
                display: flex;
                justify-content: space-between;
            }

            .forget label input {
                margin: 3px;
            }

            .forget label a {
                color: #fff;
                text-decoration: none;
                margin-left: 60px;
            }

            .forget label a:hover {
                text-decoration: underline;
            }

            button {
                width: 100%;
                height: 40px;
                border-radius: 40px;
                background: #fff;
                border: none;
                outline: none;
                cursor: pointer;
                font-size: 1em;
                font-weight: 600;
            }

            .register {
                font-size: 0.9em; /* Cambiado de 9.em a 0.9em */
                color: #fff;
                text-align: center;
                margin: 25px 0 10px;
            }

            .register p a {
                text-decoration: none;
                color: #fff;
                font-weight: 600;
            }

            .register p a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="">
                        <h2>Login</h2>
                        <div class="inputbox">
                            <ion-icon name="mail-outline"></ion-icon>
                            <input type="email" required>
                            <label for="">Usuario</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" required>
                            <label for="">Contraseña</label>
                        </div>

                        <div class="forget">
                            <label for=""><input type="checkbox">Recordar <a href="#">Olvidé mi contraseña</a></label>
                        </div>
                        <button>Log in</button>
                        <div class="register">
                            <p>No tengo una cuenta <a href="#">Registrarse</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
