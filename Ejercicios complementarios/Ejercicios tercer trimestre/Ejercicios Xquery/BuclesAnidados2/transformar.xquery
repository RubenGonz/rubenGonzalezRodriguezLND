xquery version "1.0";

<html>
	<head>
		<title>bucles</title>
	</head>
	<body>
		<h2>Ejemplo bucles anidados: caso de expresiones xquery con html en medio: Hace falta llaves</h2>
		<ul>
		{
			for $alumno in //alumno 
			let $nombre := string($alumno/nombre)
			return 	
				<li> {$nombre }
					<ol>
					{
						for $asignatura in $alumno//asignatura
						return 
							<li>  {$asignatura/text()} </li>
					}
					</ol>
				</li>
		}
		</ul>		
	</body>
</html>