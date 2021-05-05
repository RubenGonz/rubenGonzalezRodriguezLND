xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Faltas en el mes de mayo:</h3>
    
    <table>
    <tr>
        <td>Cial</td>
        <td>Fecha:</td>
        <td>Hora de clase</td>
    </tr>
    {
        for $falta in //falta
        let $cial := $falta/ancestor::alumno/@cial
        let $fecha := $falta/@fecha
        let $mes := substring($fecha,6,2)
        let $horaClase := $falta/@hora
        where $mes = "05"
        order by $cial
        return <tr><td>{string($cial)}</td><td>{string($fecha)}</td><td>{string($horaClase)}</td></tr>
    }
    </table>
</body>
</html>