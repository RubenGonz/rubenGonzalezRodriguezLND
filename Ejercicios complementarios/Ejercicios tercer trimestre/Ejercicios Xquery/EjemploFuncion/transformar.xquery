xquery version "1.0";

declare function local:factorial($x as xs:integer) 
as xs:integer
{
	let $resultado :=
		if($x = 0) then (
			1
		)else(
			$x * local:factorial($x - 1)
		)
	return $resultado	
};

<html>
	<head>
		<title>Ejemplo funciÃ³n</title>
	</head>
	<body>
		<h2>Ejemplo de funciÃ³n</h2>
		<p>  utilizamos: declare function
		y especificamos que es una funciÃ³n local. 
		directamente lo que se escribe es el return de la funciÃ³n
		</p>
		<p>
			En este ejemplo se muestran  por cada calificaciÃ³n el factorial. De esa forma podemos observar tambiÃ©n que soporta recursividad
		</p>
		{
			for $alumno in //alumno 
			return 	
				for $b in $alumno//nota
					return
						<factNota>{$b} {":"} {local:factorial($b)}</factNota>
		}
	</body>
</html>