xquery version "1.0";

<html>
	<head>
		<title>Condicionales if</title>
	</head>
	<body>
		<h2>Ejemplo de IF THEN: como elemento inmediato en un return</h2>
		<p> Agruparemos mediante parÃ©ntesis y de nuevo es obligatorio poner else aunque sea vacÃ­o
		</p>
		<p>
			En este ejemplo se muestran Ãºnicamente los alumnos que aprueban.
			Observar que adrede se han puesto dos pÃ¡rrafos en lo que devuelve el 
			if AsÃ­ podemos observar la obligatoriedad de poner comas: "," como 
			separador cuando se devuelven varios elementos en el if
		</p>
		<ul>
		{
			for $alumno in //alumno 
			let $nombre := string($alumno/nombre)
			let $media := avg($alumno//nota)
			return 
				if($media >= 5) then (
					<p>Nombre alumno: {$nombre}</p>,
					<p>Obtiene califiaciÃ³n media de: {$media}</p>
				)
				else (
				)
		}
		</ul>		
	</body>
</html>