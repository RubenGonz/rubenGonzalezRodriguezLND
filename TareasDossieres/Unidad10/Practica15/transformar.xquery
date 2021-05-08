xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Alumnos con todo aprobado</h3>
    
    <table>
    <tr>
        <td>Cial</td>
        <td>Fecha con comentarios</td>
        <td>Numero de comentarios</td>
    </tr>
    {
        for $alumno in //alumno
        let $cial := $alumno/@cial
        let $diasDistintos := $alumno/count(distinct-values(.//@fecha))
        let $contadorComentarios := $alumno/count(./comentario)
        return <tr>
            <td>{string($cial)}</td>
            <td>{number($diasDistintos)}</td>
            <td>{number($contadorComentarios)}</td>
        </tr>
    }
    </table>
</body>
</html>
