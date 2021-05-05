xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Alumnos con todo aprobado</h3>
    
    <table>
    <tr>
        <td>Alumno</td>
        <td>Apellido</td>
    </tr>
    {
        for $alumno in //alumno
        let $nombre := $alumno/nombre
        let $apellidos := $alumno/apellidos
        let $nota := $alumno//nota
        where every $nota in $alumno satisfies ($nota >= "5") 
        return <tr>
            <td>{string($nombre)}</td>
            <td>{string($apellidos)}</td>
        </tr>
    }
    </table>
</body>
</html>
