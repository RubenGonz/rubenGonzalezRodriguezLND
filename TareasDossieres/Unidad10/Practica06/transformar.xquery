xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Alumnos:</h3>
    
    <table>
    <tr>
        <td>Alumno</td>
        <td>Nacio en:</td>
    </tr>
    {
        for $alumno in //alumno
        let $nombre := $alumno/nombre
        let $cial := $alumno/@cial
        let $anioNacimiento := substring($cial,2,2)
        order by $anioNacimiento
        return <tr><td>{string($nombre)}</td><td>19{string($anioNacimiento)}</td></tr>
    }
    </table>
</body>
</html>