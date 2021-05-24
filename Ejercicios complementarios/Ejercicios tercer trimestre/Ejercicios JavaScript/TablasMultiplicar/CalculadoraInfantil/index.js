const DOM = {
    numero: document.getElementById("numero"),
}

function calcular() {

    let numero = DOM.numero.value

    if (numero < 0) {
        document.innerHTML.createE
    } else {
        document.createElement("div")
    }

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