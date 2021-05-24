const DOM = {
    num1: document.getElementById("num1"),
    num2: document.getElementById("num2"),
    operador: document.getElementById("operador"),
    solucion: document.getElementById("solucion")
}

function calcular(){

    let num1 = DOM.num1.value
    let num2 = DOM.num2.value
    let operador = DOM.operador.value

    switch (operador) {
        case "+":
            let respuestaSuma = Number(num1) + Number(num2)
            DOM.solucion.innerHTML = respuestaSuma
            break;

        case "-":
            let respuestaResta = Number(num1) - Number(num2)
            DOM.solucion.innerHTML = respuestaResta
            alert(resResta)
            break;

        case "*":
            let respuestaMultiplicacion = Number(num1) * Number(num2)
            DOM.solucion.innerHTML = respuestaMultiplicacion
            break;

        case "/":
            let respuestaDivision = Number(num1) / Number(num2)
            DOM.solucion.innerHTML = respuestaDivision
            break;
            
        default:
            DOM.solucion.innerHTML = "No introdujo un operador válido"
            break; 
    }

}