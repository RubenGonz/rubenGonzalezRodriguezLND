xquery version "1.0";

<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Comentarios por fecha</h3>
    {
        for $alumno in doc("file:///C:/Users/admin/Desktop/Repositorios/LND/rubenGonzalezRodriguezLND/TareasDossieres/Unidad10/Practica17/alumnos.xml")//alumno
        let $nombre := $alumno/nombre
        let $cial := $alumno/@cial
        return 
        <table>
            <tr>
                <th colspan = "2">{string($nombre)}</th>
            </tr>
            <tr>
                <td>Tipo</td>
                <td>Fecha</td>
            </tr>
            {
                for $falta in doc("file:///C:/Users/admin/Desktop/Repositorios/LND/rubenGonzalezRodriguezLND/TareasDossieres/Unidad10/Practica17/faltas.xml")//falta[./ancestor::alumno/@cial = $cial]
                let $tipo := $falta/@tipo
                let $fecha := $falta/@fecha
                where $tipo = "I"
                return
                <tr>
                    <td>{string($tipo)}</td>
                    <td>{string($fecha)}</td>
                </tr>
            }
        </table>
    }
</body>
</html>
