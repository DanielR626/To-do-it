<style>
*
{
margin: 0;
padding: 0; 
box-sizing: border-box;
font-family: 'Poppins',sans-serif;
}

.header
{
position: fixed; 
width: 100%;
height: 60px;
display: flex; 
justify-content: space-between; 
align-items: center; 
padding: 20px 100px;
z-index: 99;
background: transparent;
}


.background
{
    width: 100%;
    height: 100vh;
      background-image: url("https://img.freepik.com/fotos-premium/fondo-grunge-espacio-texto-o-imagen_196038-2733.jpg");
    backgronud-position: center;
    background-size: cover;
    } 
    
.home   
    {
    position: absolute;  
    top: 50%;
    left: 50%; 
    width: 75%;
    height: 75%;
    transform: translate(-50%, -50%);
    background-image: url('https://media.tenor.com/TUEhsnMZrUMAAAAd/project-logo.gif'); 
    background-position: center;
    background-size: cover;
    display: flex;
    margin-top: 10px; 
    border: 1px solid black;
    border-radius: 10px; 
    border: none;
    }


.content a
{
position: relative; 
text-decoration: none; 
color: black; 
font-size: 3em; 
font-weight: 700;
top: -40px;
Left: 80px;
}

.content h2 {
    font-size: 4.5em;
    text-align: center;
    color: #fff;
    animation: moveUp 1s ease-in-out;
}
.content h2 {
    font-size: 4.5em;
    text-align: center;
    color: #fff;
    animation: bounce 2s ease-in-out;
}

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

.login {
    width: 500px;
    position: relative;
    padding: 80px 30px;
    background-image: url("https://img.freepik.com/fotos-premium/fondo-blanco-brillante-globos-ilustracion-3d-renderizado-3d_158469-8209.jpg");
    backdrop-filter: blur(100px);
}



.login h2
{
font-size: 2em; 
text-align: center; 
margin-bottom: 30px; 
color:#499EBF;
}

.login .input
{
position: relative; 
width: 100%; 
height: 30px; 
margin-bottom: 50px
}

.login .sign-up
{
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 0 auto;
}

.login .sign-up a
{
    display: block;
    text-decoration: none;
    color: black;
    font-weight: 700;
}




.login .input .input1
{
font-size: 16px;
display: flex;
flex-direction: column; 
justify-content: center; 
align-items: center; 
background: transparent; 
border: none; 
outline: none;
border-bottom: 2px solid black;
color: black;
width: 100%;
height: 100%;
}

::placeholder
{
color: black; 
font-size: 18px;
}



.check
{
display: flex;
justify-content: space-between; 
margin-bottom: 40px; 
color: black;
}

.check a{
    text-decoration: none;
    color: black;
}

.check a:hover
{
    text-decoration: underline;
}

.login .button
{
    width: 100%;
    height: 40px;
    margin-bottom: 15px;
}

button
{
    width: 100%;
    height: 40px;
    background-color: #499EBF !important;
    border: none;
    outline: none;
    font-size: 20px;
    font-weight: 700;
    border-radius: 7px;
    color: #fff !important;
}

button:active
{
    font-size: 25px;
}

.fa-solid .fa-envelope {
  color: #black;
} 

</style>
