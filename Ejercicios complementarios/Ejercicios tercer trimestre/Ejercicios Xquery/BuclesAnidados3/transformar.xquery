xquery version "1.0";

<html>
	<head>
		<title>bucles</title>
	</head>
	<body>
		<h2>Ejemplo bucles: caso de primera fila distinta ( por ej. una cabecera)</h2>
		<h3>garantizamos que se interprete correctamente las lÃ­neas afectadas por el return
		mediante parÃ©ntesis </h3>

		<p>
			Observar que en el return usamos parÃ©ntesis y separamos los elementos
			mediante comas: ","
			Esto es: 
			return (  blabla1, blabla2 )
		</p>
		<ul>
		{
			for $alumno in //alumno 
			let $nombre := string($alumno/nombre)
			return (
				<h4> {$nombre } </h4>,
				<table border="1">
				{
					for $asignatura in $alumno//asignatura
					return (
						<tr> 
							<td> {$asignatura/text()} </td>
						</tr>
					)
				}
				</table>
			)
		}
		</ul>		
	</body>
</html>