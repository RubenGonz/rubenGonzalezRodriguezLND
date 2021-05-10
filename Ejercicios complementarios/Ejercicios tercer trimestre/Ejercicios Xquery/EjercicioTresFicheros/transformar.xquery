xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Html que usa los tres archivos</h3>
    
    {
        for $alumno in doc("alumnos.xml")//alumno
        let $cial := $alumno/@cial
        let $nombre := $alumno/nombre
        let $apellidos := $alumno/apellidos
        let $curso := $alumno/ancestor::curso/@nombre

        return (
            <h3>{string($nombre)} {string($apellidos)}</h3>,
        
            <table>
                <tr>
                    <td class="encabezado">Cial</td>
                    <td class="encabezado">Curso</td>
                </tr>
                <tr>
                    <td>{string($cial)}</td>
                    <td>{string($curso)}</td>
                </tr>
                <tr>
                    <td class="encabezado">Asignatura</td>
                    <td class="encabezado">Nota</td>
                </tr>
                {
                    for $asignaturaYNota in doc("alumnos.xml")//alumno//asignatura
                    let $nota := sibling a nota
                    return
                    <tr>
                        <td>{string($asignaturaYNota)}</td>
                        <td>{string($nota)}</td>
                    </tr>
                }
            </table>
        )
    }
</body>
</html>
