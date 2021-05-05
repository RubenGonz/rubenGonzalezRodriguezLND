xquery version "1.0";
<html>
<head>
    <title>Lista</title>
</head>
<body>
    <h3>Hay { count(/instituto/curso/alumno) } alumnos</h3>
    
    <ul>
    {
        for $alumno in /instituto/curso/alumno
        let $cial := $alumno/@cial
        let $nombre := $alumno/nombre
        let $curso := $alumno/ancestor::curso/@nombre
        order by $alumno/apellidos
        return <li id ="{$cial}">{string($nombre)} del curso {string($curso)}</li>
    }
    </ul>
</body>
</html>
