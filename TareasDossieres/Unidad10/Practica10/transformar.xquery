xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Materias que acaban en -s</h3>
    
    <table>
    <tr>
        <td>Nombre</td>
        <td>Apellidos</td>
        <td>Materia</td>
    </tr>
    {
        for $asignatura in //asignatura
        let $nombreAlumno := $asignatura/ancestor::alumno/nombre
        let $apellidosAlumno := $asignatura/ancestor::alumno/apellidos
        where ends-with($asignatura, "s")
        order by $asignatura
        return <tr>
            <td>{string($nombreAlumno)}</td>
            <td>{string($apellidosAlumno)}</td>
            <td>{string($asignatura)}</td>
        </tr>
    }
    </table>
</body>
</html>
