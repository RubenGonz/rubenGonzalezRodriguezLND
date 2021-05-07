xquery version "1.0";

declare base-uri "/mnt/daw/home/Escritorio/rubenGonzalezRodriguezLND/Ejercicios complementarios/Ejercicios tercer trimestre/Ejercicios Xquery/Comentarios de alumnos";

<html>
<head>
    <title>Lista</title>
</head>
<body>
    {
        for $alumno in doc(alumnos.xml)//alumno
        let $nombre := $alumno/nombre
        let $apellidos:= $alumno/apellidos
        let $cial:= $alumno/@cial
        return 
        <h3>{string($nombre)} {string($apellidos)}</h3>
        {
            for $comentario in doc(comentarios.xml)//alumno[@cial = $alumno/@cial]/comentario
            return 
            <table>
                <tr>
                    <td>$comentario</td>
                </tr>
            </table>
        }
    }
</body>
</html>
