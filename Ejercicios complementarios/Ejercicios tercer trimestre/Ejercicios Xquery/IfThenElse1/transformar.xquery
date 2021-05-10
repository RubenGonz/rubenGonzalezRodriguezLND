xquery version "1.0";

<html>
	<head>
		<title>Condicionales if</title>
	</head>
	<body>
		<h2>Ejemplo de IF THEN: asignando a una variable</h2>
		<p> se puede poner el if directamente despuÃ©s del sÃ­mbolo: 

		":=" que se usa para las asignaciones 
		<br/>Por otro lado es obligatorio poner la sentencia else
		Hay que ponerla aunque puede devolver vacÃ­o
		</p>
		<ul>
		{
			for $alumno in //alumno 
			let $nombre := string($alumno/nombre)
			let $media := avg($alumno//nota)
			let $apruebaCurso := 
				if($media >= 5) then
					" y aprueba el curso"
				else
					" " 
			return 
				<li>
					{$nombre} tiene una media de: {$media}  {$apruebaCurso}
				</li>
		}
		</ul>		
	</body>
</html>