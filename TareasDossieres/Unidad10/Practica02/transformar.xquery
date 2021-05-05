xquery version "1.0";
<alumnos>
{
    for $alumno in //alumno[count(.//asignatura) < 4]
    return $alumno
}
</alumnos>