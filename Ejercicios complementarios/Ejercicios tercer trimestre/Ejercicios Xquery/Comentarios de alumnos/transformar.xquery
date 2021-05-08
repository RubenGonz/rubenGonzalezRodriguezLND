xquery version "1.0";

<html>
<head>
    <title>Lista</title>
</head>
<body>
    {
        for $alumno in doc("file:///C:/Users/admin/Desktop/Repositorios/LND/rubenGonzalezRodriguezLND/Ejercicios%20complementarios/Ejercicios%20tercer%20trimestre/Ejercicios%20Xquery/Comentarios%20de%20alumnos/alumnos.xml")//alumno
        let $nombre := $alumno/nombre
        let $apellidos:= $alumno/apellidos
        let $cial:= $alumno/@cial
        return 
        <table>
        <tr><th>{string($nombre)} {string($apellidos)}</th></tr>
        {
            for $comentario in doc("file:///C:/Users/admin/Desktop/Repositorios/LND/rubenGonzalezRodriguezLND/Ejercicios%20complementarios/Ejercicios%20tercer%20trimestre/Ejercicios%20Xquery/Comentarios%20de%20alumnos/comentarios.xml")//alumno[./@cial = $cial]/comentario
            return 
            <tr>
                <td>{string($comentario)}</td>
            </tr>
        }
        </table>
    }
</body>
</html>
