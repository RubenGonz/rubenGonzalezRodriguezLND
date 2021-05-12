xquery version "1.0";
<html>
<head>
    <title>Lista</title>
    <link rel="stylesheet" href="miestilo.css"/>
</head>
<body>
    <h3>Html que usa los tres archivos</h3>
    
    {
        for $alumno in doc("file:///C:/Users/admin/Desktop/Repositorios/LND/rubenGonzalezRodriguezLND/Ejercicios complementarios/Ejercicios tercer trimestre/Ejercicios Xquery/EjercicioTresFicheros/alumnos.xml")//alumno
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
                    for $asignatura in $alumno//asignatura
                    let $nota := $asignatura/following-sibling::nota[1]
                    return
                    <tr>
                        <td>{string($asignatura)}</td>
                        <td>{number($nota)}</td>
                    </tr>
                }
                {
                    for $alumnoFaltas in doc("file:///C:/Users/admin/Desktop/Repositorios/LND/rubenGonzalezRodriguezLND/Ejercicios complementarios/Ejercicios tercer trimestre/Ejercicios Xquery/EjercicioTresFicheros/faltas.xml")//alumno[@cial = $cial]
                    let $contadorFaltasJ := count($alumnoFaltas/falta[@tipo = "J"])
                    let $contadorFaltasI := count($alumnoFaltas/falta[@tipo = "I"])
                    return 
                    
                    if($contadorFaltasJ + $contadorFaltasI != 0) then (
					<tr>
                        <td class="encabezado">F.Justificadas</td>
                        <td class="encabezado">F.Injustificadas</td>
                    </tr>,
                    <tr>
                        <td>{number($contadorFaltasJ)}</td>
                        <td>{number($contadorFaltasI)}</td>
                    </tr>
				    )
				    else (
				    )
                }
                {
                    for $alumnoConComentarios in doc("file:///C:/Users/admin/Desktop/Repositorios/LND/rubenGonzalezRodriguezLND/Ejercicios complementarios/Ejercicios tercer trimestre/Ejercicios Xquery/EjercicioTresFicheros/comentarios.xml")//alumno[@cial = $cial]
                    let $contadorCometarios := count($alumnoConComentarios/comentario)
                    return 
                    if($contadorCometarios!= 0) then (
					    <tr>
                            <td class="encabezado">Fecha</td>
                            <td class="encabezado">Comentario</td>
                        </tr>,
                        {
                            for $fecha in distinct-values($alumnoConComentarios//@fecha)
                            let $contadorComentariosEnFecha := count($alumnoConComentarios/comentario[@fecha = $fecha])
                            return 
                            <tr>
                                <td colspan="{number($contadorComentariosEnFecha)}">{string($fecha)}</td>,
                                {
                                    for $comentariosEnFecha in $alumnoConComentarios/comentario[@fecha = $fecha]
                                    return
                                    <td>{string($comentariosEnFecha)}</td>
                                }
                            </tr>
                        }
				    )
				    else (
				    )
                }
            </table>
        )
    }
</body>
</html>
