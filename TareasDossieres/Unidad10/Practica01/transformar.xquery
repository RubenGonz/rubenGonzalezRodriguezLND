xquery version "1.0";
declare copy-namespaces no-preserve, no-inherit;
<repetidores>
{
    for $variable in /instituto/curso/alumno
    where $variable/repetidor = "True"
    order by $variable/apellidos
    return $variable/apellidos
}
</repetidores>