//Recreamos un "minimodelo" del juego
class Punto{
    constructor(x,y){
        this.x = x;
        this.y = y;
    }
}

class Jugador{
    constructor(escenario){
        this.escenario = escenario;
        
        let posXinicial = Math.trunc( Math.random() * escenario.ancho );
        let posYinicial = Math.trunc( Math.random() * escenario.alto );

        this.posicion = new Punto(posXinicial, posYinicial);

        //si usamos la variante del jugador que se mueve constantemente
        //por inercia ( se mueve solo, cuando llega a un muro choca y rebota )
        //establecemos los pixeles que se moverá en cada paso:
        this.pasoInercia =  this.escenario.sizeObjetoEscenario/4;
        
        this.direccionInercia = new Punto(0,0);
    }

    mover(desplazamiento){
        this.posicion.x += desplazamiento.x;
        this.posicion.y += desplazamiento.y;

        //si la nueva posición se sale del tablero se reubica 
        //reflejando que un muro impide salir
        this.posicion = this.escenario.ponerPuntoDentro(this.posicion);
    }

    moverPorInercia(){
        this.posicion.x += this.direccionInercia.x * this.pasoInercia;
        this.posicion.y += this.direccionInercia.y * this.pasoInercia;

        let nuevaUbicacion = this.escenario.ponerPuntoDentro(this.posicion);
        if(nuevaUbicacion.x != this.posicion.x ){ // se ha chocado con un muro vertical Hay que "rebotar" 
            this.direccionInercia.x = -1 * this.direccionInercia.x;
        }

        if(nuevaUbicacion.y != this.posicion.y ){ // se ha chocado con un muro horizontal Hay que "rebotar" 
            this.direccionInercia.y = -1 * this.direccionInercia.y;
        }        
    }

    cambiarInercia(nuevaDireccion){
        this.direccionInercia = nuevaDireccion;
    }
}

class Escenario{
    constructor(ancho, alto, sizeObjetoEscenario){
        this.ancho = ancho;
        this.alto = alto;
        this.sizeObjetoEscenario = sizeObjetoEscenario;
    }

    //haremos un escenario que no permitá salir fuera ( como si tuviera muros)
    //entonces necesitaremos funciones para saber cuando se está dentro o si se está fuera
    //y reubicar a la posición más cercana válida ( que sería el efecto de si nos movemos y al alcanzar un 
    // muro ya no pudiéramos movernos más )

    ponerPuntoDentro(punto){
        let result = new Punto(punto.x,punto.y);
        if( result.x < 0 )
            result.x = 0;

        if( result.y < 0)
            result.y = 0;
        
        if( result.x + this.sizeObjetoEscenario > escenario.ancho)
            result.x = escenario.ancho - this.sizeObjetoEscenario;
        
        if( result.y + this.sizeObjetoEscenario > escenario.alto)
            result.y = escenario.alto - this.sizeObjetoEscenario;
        
        return result;
    }
}



//Establecemos el enlace con la parte gráfica

const DOM = {
    escenario: document.getElementById("escenario"),
    jugador: document.getElementById("jugador"),
    body: document.querySelector("body"),
    //objetosEscenario: document.querySelector(".objetoEscenario"),
    //enemigos: document.querySelector(".enemigo")
}





//ponemos un eventListener a body para escuchar el teclado
//DOM.body.addEventListener( "keydown", event=>moverJugador(event))

DOM.body.addEventListener( "keyup", event=>cambiarDireccionInerciaJugador(event))




//Iniciamos los objetos necesarios para el juego 
//tomamos la información del tamaño de los objetos del juego según el CSS:
const sizeObjetoEscenario = parseInt(
    getComputedStyle(document.documentElement)
    .getPropertyValue('--size-objetoEscenario')
);



const escenario = new Escenario(DOM.escenario.offsetWidth , DOM.escenario.offsetHeight, sizeObjetoEscenario);
let jugador = new Jugador(escenario);
ubicarEnDOM( jugador, DOM.jugador);

let paso = sizeObjetoEscenario/2;  //cuando pulsamos las arrow keys moveremos esta cantidad de pixeles


function moverJugador(e){
    
       
    if( e instanceof KeyboardEvent){
       
        
        if (e.key == 'ArrowUp') {
            jugador.mover( new Punto(0, -1*paso) );

        }
        else if (e.key == 'ArrowDown') {
            jugador.mover( new Punto(0,paso) );
        }
        else if (e.key == 'ArrowLeft') {
            jugador.mover( new Punto(-1*paso,0) );
        }
        else if (e.key == 'ArrowRight') {
            jugador.mover( new Punto(paso,0) );
        }

        ubicarEnDOM(jugador,DOM.jugador);
    }
}



function cambiarDireccionInerciaJugador(e){
    if( e instanceof KeyboardEvent){
       
        
        if (e.key == 'ArrowUp') {
            jugador.cambiarInercia( new Punto(0, -1) );

        }
        else if (e.key == 'ArrowDown') {
            jugador.cambiarInercia( new Punto(0, 1) );
        }
        else if (e.key == 'ArrowLeft') {
            jugador.cambiarInercia( new Punto(-1,0) );
        }
        else if (e.key == 'ArrowRight') {
            jugador.cambiarInercia( new Punto(1,0) );
        }

        ubicarEnDOM(jugador,DOM.jugador);
    }
}


//los objetos se ubican con CSS position absolute. Así
//que basta establecer un style con left y top agregando la unidad ( en este caso pixel: px )
function ubicarEnDOM( objetoEscenario, objetoEscenarioDOM){
    objetoEscenarioDOM.style.left = objetoEscenario.posicion.x +"px";
    objetoEscenarioDOM.style.top = objetoEscenario.posicion.y +"px";        
}








//Para aportar dinamismo usaremos timers 
//Primero vemos una función: moverJuego() que lo que hace es mover todos los objetos
function moverJuego(){
   
    //en esta función moveremos un paso por inercia todos los elementos que 
    //corresponda. Luego para que tenga reflejo en la parte gráfica
    //volvemos a ubicar en el DOM los objetos
    //Como ejemplo lo hacemos con el jugador

    jugador.moverPorInercia();
    ubicarEnDOM(jugador,DOM.jugador);
}


let timerActualizaPosicionesJuego;

function timersNuevoJuego(){



    timerActualizaPosicionesJuego = setInterval(function(){moverJuego();},10);


    //Para agregar los enemigos ( la clase enemigo que aparece en el CSS )
    //lo mejor sería que aparecieran progresivamente Para eso hay un 
    //timer muy apropiado:  setTimeout()   Buscar por internet su descripción
    //Observar que debiera existir una clase: Enemigo   que tendrá bastante
    //parecido a la clase Jugador ( tiene que poder moverse por inercia, tener una posición,
    //estar ubicado en el escenario, etc )
    //Luego cada enemigo creado : new Enemigo() ( lo lógico es que se "fabrique" con el setTimeout() que se dijo antes )
    //Hay que crear también un equivalente en el DOM: Será un <div> que se agregará al DOM.escenario
    //y ese <div> deberá tener las clases: .enemigo  .objetoEscenario  de esa forma se le aplicarán los CSS
    //correspondientes. 


    
}


timersNuevoJuego();