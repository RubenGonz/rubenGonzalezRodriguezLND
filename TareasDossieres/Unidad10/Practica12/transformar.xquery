xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Cursos en los que todos los alumno asisten a lenguaje de marcas</h3>
    
    <table>
    <tr>
        <td>Curso</td>
    </tr>
    {
        for $curso in //curso
        let $nombre := $curso/@nombre
        where every $alumno in $curso/alumno satisfies $alumno//asignatura = "Lenguajes de marcas"
        return <tr>
            <td>{string($nombre)}</td>
        </tr>
    }
    </table>
</body>
</html>
