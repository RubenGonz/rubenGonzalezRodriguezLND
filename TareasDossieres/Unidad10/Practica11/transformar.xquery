xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Cursos en los que se imparte practicas de empresa</h3>
    
    <table>
    <tr>
        <td>Curso</td>
    </tr>
    {
        for $curso in //curso
        let $nombre := $curso/@nombre
        where $curso//asignatura = "Prácticas de empresa"
        return <tr>
            <td>{string($nombre)}</td>
        </tr>
    }
    </table>
</body>
</html>
