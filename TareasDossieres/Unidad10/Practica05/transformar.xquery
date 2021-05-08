xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Hay { count(//alumno) } alumnos</h3>
    
    <table>
    <tr>
        <td>Alumno</td>
        <td>Materias aprobadas</td>
    </tr>
    {
        for $alumno in //alumno
        let $nombre := $alumno/nombre
        let $contadorAprobadas := count($alumno//nota[. >= 5])
        where $contadorAprobadas >= 3
        order by $alumno/nombre
        return <tr><td>{string($nombre)}</td><td>{string($contadorAprobadas)} materias</td></tr>
    }
    </table>
</body>
</html>


