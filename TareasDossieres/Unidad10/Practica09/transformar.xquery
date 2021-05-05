xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Nota media de los alumnos de 1º de Asir:</h3>
    
    <table>
    <tr>
        <td>Nombre</td>
        <td>Apellidos</td>
        <td>Nota media</td>
    </tr>
    {
        for $alumno in //alumno
        let $nombre := $alumno/nombre
        let $apellidos := $alumno/apellidos
        let $notas := $alumno//nota
        let $notaMedia := avg($notas)
        where $alumno/ancestor::curso/@nombre = "1º ASIR"
        order by $notaMedia
        return <tr>
            <td>{string($nombre)}</td>
            <td>{string($apellidos)}</td>
            <td>{number($notaMedia)}</td>
        </tr>
    }
    </table>
</body>
</html>
