const DOM = {
    canvas: document.getElementById("canvas")
}

let partesCuerpo = 7;
let contadorAhorcado = partesCuerpo;
drawStructure();

DOM.canvas.style.backgroundColor = "white";

function drawStructure() {
    let ctx = DOM.canvas.getContext('2d');

    /**
     * Forma principal
     */
    ctx.beginPath();
    ctx.strokeStyle = "black";
    ctx.lineWidth = 6;

    //Base
    ctx.moveTo(125, 250);
    ctx.lineTo(225, 250);

    //Columna
    ctx.moveTo(175, 250);
    ctx.lineTo(175, 100);

    //Viga
    ctx.moveTo(175, 100);
    ctx.lineTo(265, 100);

    ctx.stroke();

    /**
     * Cuerda
     */
    ctx.beginPath();
    ctx.strokeStyle = "red";
    ctx.lineWidth = 6;

    ctx.moveTo(265, 100);
    ctx.lineTo(265, 125);

    ctx.stroke();

    /**
     * Soporte
     */
    ctx.beginPath();
    ctx.strokeStyle = "black";
    ctx.lineWidth = 5;

    ctx.moveTo(220, 100);
    ctx.lineTo(175, 125);

    ctx.stroke();

    /**
     * Persona
     */
    ctx.beginPath();
    ctx.strokeStyle = "blue";
    ctx.lineWidth = 5;

    //Cabeza
    ctx.ellipse(265, 137.5, 8, 12.25, 0, 0, 2 * Math.PI);

    //Tronco
    ctx.moveTo(265, 150);
    ctx.lineTo(265, 200);

    //Brazo derecho
    ctx.moveTo(265, 150);
    ctx.lineTo(280, 175);

    //Brazo izquierdo
    ctx.moveTo(265, 150);
    ctx.lineTo(250, 175);

    //Pierna derecha
    ctx.moveTo(265, 200);
    ctx.lineTo(280, 225);

    //Pierna izquierda
    ctx.moveTo(265, 200);
    ctx.lineTo(250, 225);

    ctx.stroke();

}