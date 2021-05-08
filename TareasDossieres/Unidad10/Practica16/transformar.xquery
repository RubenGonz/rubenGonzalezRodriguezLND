xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Comentarios por fecha</h3>
    {
        for $alumno in //alumno
        let $cial := $alumno/@cial
        return 
        <table>
            <tr>
                <th colspan = "2">{string($cial)}</th>
            </tr>
            <tr>
                <td>Fecha</td>
                <td>Numero de comentarios</td>
            </tr>
            {
                for $fecha in $alumno/distinct-values(.//@fecha)
                let $contadorMismaFecha := count($alumno//@fecha[. = $fecha])
                return
                <tr>
                    <td>{string($fecha)}</td>
                    <td>{string($contadorMismaFecha)}</td>
                </tr>
            }
        </table>
    }
</body>
</html>
