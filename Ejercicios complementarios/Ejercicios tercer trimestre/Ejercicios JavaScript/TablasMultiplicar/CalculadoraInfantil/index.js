const DOM = {
    numero: document.getElementById("numero"),
    divPrincipal: document.getElementById("divPrincipal"),
}

function CrearTabla() {

    let numero = DOM.numero.value

    if (numero >= 0) {

        document.write("<div id='encabezadoTabla'>Tabla del: " + numero + "</div>");
    
        document.write("<table>");

        for(i = 1;i<=10;i++){

            let resultado = i * numero;
            document.write("<tr>");
            document.write("<td>" + i + " * " + numero + "</td>");
            document.write("<td>" + resultado + "</td>");
            document.write("</tr>");
        }

        document.write("</table>");
    } else {
        document.write("<div>No ha escrito un valor válido</div>");
    }
}
