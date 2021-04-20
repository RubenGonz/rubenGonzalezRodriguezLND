<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>Alumnos</title>
                <link rel="stylesheet" href="miestilo.css"/>
            </head>
            <body>
                <h3>Lista de cursos ofertados:</h3>
                <table>
                    <tr>
                        <td>Numero</td>
                        <td>Curso</td>
                        <td>Cial</td>
                        <td>Nombre</td>
                        <td>Apellidos</td>
                        <td>Repetidor</td>
                        <td>Total de puntos</td>
                        <td>Nota media</td>
                    </tr>
                    <xsl:apply-templates select="//alumno"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="alumno">
        <tr>
            <td rowspan="5" class="fondoAzul">
                <xsl:number value="position()" format="1"/>
            </td>
            <td>
                <xsl:value-of select = "../@nombre"/>
            </td>
            <td>
                <xsl:value-of select = "./@cial"/>
            </td>
            <td>
                <xsl:value-of select = "./nombre"/>
            </td>
            <td>
                <xsl:value-of select = "./apellidos"/>
            </td>
            <td>
                <xsl:value-of select = "./repetidor"/>
            </td>
            <td>
                <xsl:value-of select = "sum(.//nota)"/>
            </td>
            <td>
                <xsl:value-of select = "sum(.//nota) div count(.//nota)"/>
            </td>
        </tr>
        <xsl:apply-templates select=".//nota"/>
    </xsl:template>

    <xsl:template match="nota">
    <tr>
        <td colspan="5">
            <xsl:number value="position()" format="a)"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select = "./preceding-sibling::*[1]"/>
        </td>
        <td colspan="2">
            <xsl:value-of select = "."/>
        </td>
    </tr>
    </xsl:template>

</xsl:stylesheet> 
