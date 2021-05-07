xquery version "1.0";

(:
declare base-uri "file:///E:/xquery/";
:)

declare base-uri "file:///home/carlos/Dropbox/clases/LND/xquery/";

<html>
	<head>
		<title>prueba</title>
	</head>
	<body>
		<h2>Cursos con Redes</h2>
		<table border="1">
			<tr style="background: #809A9D">

				<th>Alumno </th>
				<th>Apellidos </th>
				<th>NÃºmero de materias </th>
			</tr>

			{
				for $a at $i in doc("alumnos.xml")//alumno 
				return <tr> <td>{$a} </td>  <td>{$i}</td></tr>
			}

			
			

		</table>
		
	</body>
</html>




(:
 <html>
	<head>
		<title>Practica 18</title>

	</head>
	<body>
		<!-- <h4>Hay { count(//alumno) } alumnos </h4>  -->
		<h1>NÃºmero de faltas por alumno</h1>
		<table border="1">
			<tr>
				<th> Alumno </th>
				<th> NÂº Faltas </th>
			</tr>
			{
				for $alumno in //alumno
				let $id := string($alumno/@cial)
				let $nom := string($alumno/nombre)
				let $curso := string($alumno/ancestor::curso/@nombre)
				(: let $materiasAprobadas := count($alumno//nota[number(.) >= 5])  :)
				
				let $alumnoEnFaltasXML := doc("faltas.xml")//alumno[@cial = $id]
				let $faltas := count($alumnoEnFaltasXML/falta[@tipo])
				order by $nom 
				return 
					<tr>
						<td> {$nom} </td>
						<td> {$faltas}  </td>
					</tr>
			}
			
		</table>
	</body>
</html>

:)


(:
<html>
	<head>
		<title>practica 17</title>
	</head>
	<body>
		<h2>Comentarios por fecha</h2>
		<table border="1">
			<tr style="background: #809A9D">

				<th>Alumno</th>
				<th>Tipo</th>
				<th>Fecha</th>
			</tr>
			{
				for $alumno in //alumno
					let $nombre := string($alumno/nombre)
					let $cial := $alumno/@cial
					



					for $alumnofalta in doc("faltas.xml")//alumno[@cial=$cial], $falta in $alumnofalta/falta
					where $falta/@tipo = "I"
			
						
						return	<tr>
							<td>{$nombre}</td>
							<td>{string($falta/@tipo)}</td>
							<td>{string($falta/@fecha)}</td>

						</tr>


			}
			

		</table>
		
	</body>
</html>
:)


(:

<html>
	<head>
		<title>practica 16</title>
	</head>
	<body>
		<h2>Comentarios por fecha</h2>
		<table border="1">
			<tr style="background: #809A9D">

				<th>Alumno</th>
				<th>Fecha</th>
				<th>NÂº de Comentarios</th>
			</tr>
			{
				for $alumno in //alumno, $fecha in distinct-values($alumno/comentario/@fecha)
				let $numeroComentarios := count($alumno/comentario[@fecha = $fecha])

				
				return 			<tr>
				<td>{string($alumno/@cial)}</td>
				<td>{$fecha}</td>
				<td>{$numeroComentarios}</td>

			</tr>

			}
			

		</table>
		
	</body>
</html>


:)

(:
<html>
	<head>
		<title>practica 15</title>
	</head>
	<body>
		<h2>Comentarios por alumno</h2>
		<table border="1">
			<tr style="background: #809A9D">

				<th>CIAL</th>
				<th>Fechas con Comentarios</th>
				<th>NÂº de Comentarios</th>
			</tr>
			{
				for $alumno in //alumno
				let $cial := string($alumno/@cial)
				let $numeroDistintosDias := count(distinct-values($alumno/comentario/@fecha))
				let $numeroComentarios := count($alumno/comentario)

				
				return 			<tr>
				<td>{$cial}</td>
				<td>{$numeroDistintosDias}</td>
				<td>{$numeroComentarios}</td>

			</tr>

			}
			

		</table>
		
	</body>
</html>
:)



(:
<html>
	<head>
		<title>practica 11</title>
	</head>
	<body>
		<h2>Cursos con Redes</h2>
		<table border="1">
			<tr style="background: #809A9D">

				<th>Curso</th>
			</tr>
			{
				for $curso in //curso
				where
				(some $alumno in $curso//alumno
				satisfies ($alumno//asignatura = "Redes"))
				
				return 			<tr>
				<td>{string($curso/@nombre)} <br/> {count($curso/alumno)}</td>

			</tr>

			}
			

		</table>
		
	</body>
</html>
:)


(:
 <html>
	<head>
		<title>Practica 10</title>

	</head>
	<body>
		<h4>Materias que acaban en -s</h4>  
		
		<table border="1">
			<tr>
				<th>Nombre </th>
				<th>Apellidos</th>
				<th>Materia </th>
			</tr>
			{
				for $asignatura in //asignatura
				let $apellidos := string($asignatura/ancestor::alumno/apellidos)
				let $nombre := string($asignatura/ancestor::alumno/nombre)
				
				where ends-with($asignatura,"s")
				
				order by $nombre, $apellidos 
				return 
					<tr>
						<td> {$nombre} </td>
						<td> {$apellidos}  </td>
						<td> {$asignatura}  </td>
					</tr>
			}
			
		</table>
	</body>
</html>
:)



(:
<html>
	<head>
		<title>practica 09</title>
	</head>
	<body>
		<h2>Nota media 1Âº ASIR</h2>
		<table border="1">
			<tr style="background: #809A9D">
				<th>Nombre</th>
				<th>Apellidos</th>
				<th>Nota media</th>
			</tr>
			{
				for $alumno in //alumno
				let $nombre := string($alumno/nombre)
				let $apellidos := string($alumno/apellidos)
				let $media := avg($alumno//nota)
				where string($alumno/ancestor::curso/@nombre) = "1Âº ASIR"
				return 			<tr>
				<td>{$nombre}</td>
				<td>{$apellidos}</td>
				<td>{$media}</td>
			</tr>

			}
			

		</table>
		
	</body>
</html>
:)



(:
<html>
	<head>
		<title>practica 08</title>
	</head>
	<body>
		<h2>Faltas en el mes de mayo</h2>
		<table border="1">
			<tr style="background: #809A9D">
				<th>Cial</th>
				<th>Fecha</th>
				<th>Hora de clase</th>
			</tr>
			{
				for $alumno in //alumno, $falta in $alumno/falta
				let $cial := string($alumno/@cial)
				let $fecha := $falta/@fecha
				let $hora := string($falta/@hora)
				where month-from-date($fecha) = 4 and string($falta/@tipo) = "I"
				return 			<tr>
				<td>{$cial}</td>
				<td>{string($fecha)}</td>
				<td>{$hora}</td>
			</tr>

			}
			

		</table>
		
	</body>
</html>
:)



(:
<html>
	<head>
		<title>practica 07</title>
	</head>
	<body>
		<h2>Faltas en el mes de mayo</h2>
		<table border="1">
			<tr style="background: #809A9D">
				<th>Cial</th>
				<th>Fecha</th>
				<th>Hora de clase</th>
			</tr>
			{
				for $alumno in //alumno, $falta in $alumno/falta
				let $cial := string($alumno/@cial)
				let $fecha := $falta/@fecha
				let $hora := string($falta/@hora)
				where month-from-date($fecha) = 5
				return 			<tr>
				<td>{$cial}</td>
				<td>{string($fecha)}</td>
				<td>{$hora}</td>
			</tr>

			}
			

		</table>
		
	</body>
</html>
:)


(:
<html>
	<head>
		<title>practica 06</title>
	</head>
	<body>
		<h2>Alumnos:</h2>
		<table border="1">
			<tr style="background: #809A9D">
				<th>Alumno</th>
				<th>NaciÃ³ en:</th>
			</tr>
			{
				for $alumno in //alumno
				let $nombre := string($alumno/nombre)
				let $fecha := concat("19",substring($alumno/@cial,2,2))
				order by $alumno/nombre
				return 			<tr>
				<td>{$nombre}</td>
				<td>{$fecha}</td>
			</tr>

			}
			

		</table>
		
	</body>
</html>
:)


(:
 <html>
	<head>
		<title>Practica 05</title>

	</head>
	<body>
		<!-- <h4>Hay { count(//alumno) } alumnos </h4>  -->
		
		<table border="1">
			<tr>
				<th> Alumno </th>
				<th> Materias aprobadas </th>
			</tr>
			{
				for $alumno in //alumno
				
				let $nom := string($alumno/nombre)
				
				let $materiasAprobadas := count($alumno//nota[number(.) >= 5])  
				where $materiasAprobadas > 2

				order by $nom 
				return 
					<tr>
						<td> {$nom} </td>
						<td> {$materiasAprobadas}  </td>
					</tr>
			}
			
		</table>
	</body>
</html>
:)



(:
 <html>
	<head>
		<title>practica 4</title>
	</head>
	<body>
		<h4>Hay { count(//alumno) } alumnos </h4>
		<table border="1">
			<tr>
				<th> Alumno </th>
				<th> Materias aprobadas </th>
			</tr>
			{
				for $alumno in //alumno
				let $id := string($alumno/@cial)
				let $nom := string($alumno/nombre)
				let $curso := string($alumno/ancestor::curso/@nombre)
				let $materiasAprobadas := count($alumno//nota[number(.) >= 5])
				where $materiasAprobadas > 2 
				order by $nom
				return 
					<tr>
						<td> {$nom} </td>
						<td> {$materiasAprobadas} materias </td>
					</tr>
			}
			
		</table>
	</body>
</html>
:)


(: 
<html>
<head>
	<title>practica 3</title>
</head>
<body>
	<h3>hay {count(//alumno)} alumnos</h3>
	<ol type="1">
	{
		for $alumno in //alumno
		let $cial := $alumno/@cial
		let $nombre := string($alumno//nombre
)
		let $curso := string($alumno/ancestor::curso/@nombre
)
		return 
		<li id="{$cial}">
			{$nombre} del curso {$curso}
		</li>
	}
	</ol>
</body>
</html>
:)	







(:

declare default element namespace "http://misitio.com"; 
declare copy-namespaces no-preserve, no-inherit;
<alumnos>
{
for $variable at $pos in //alumno
let $num := $variable//asignatura
where not($num[6])

return <eso> {$variable}  <numero> {$pos} </numero> </eso>
}
</alumnos>

:)
