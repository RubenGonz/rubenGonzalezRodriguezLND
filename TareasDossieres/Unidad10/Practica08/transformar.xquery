xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Faltas injustificadas del mes de abril para alumnos del 92:</h3>
    
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
        let $tipo := $falta/@tipo
        let $anioAlumno := substring($cial,2,2)
        where $mes = "04" and $tipo="I" and $anioAlumno = "92"
        order by $cial
        return <tr><td>{string($cial)}</td><td>{string($fecha)}</td><td>{string($horaClase)}</td></tr>
    }
    </table>
</body>
</html>