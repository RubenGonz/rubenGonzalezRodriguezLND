const DOM = {
    canvas : document.getElementById("canvas")
} 

let partesCuerpo = 7;
let contadorAhorcado = partesCuerpo;
drawStructure();

drawStructure();

function drawStructure() {
    let ctx = DOM.canvas.getContext('2d');

    ctx.beginPath();
    ctx.strokeStyle = "black";
    ctx.lineWidth = 6;

    ctx.moveTo(50,200);
    ctx.lineTo(150,200);

    ctx.moveTo(100,200);
    ctx.lineTo(100,250);

    ctx.stroke();


}