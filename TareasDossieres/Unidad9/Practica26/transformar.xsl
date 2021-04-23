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
                        <td>Alumno</td>
                        <td>Materias</td>
                    </tr>
                    <xsl:apply-templates select="//curso[@nombre='1º ASIR']/alumno"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="alumno">
        <tr>
            <td rowspan="{count(.//asignatura)}" class="fondoGris">
                <xsl:number value="position()" format="1"/>
            </td>
            <td rowspan="{count(.//asignatura)}">
                <xsl:value-of select = "./nombre"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select = "./apellidos"/>
            </td>
            <td>
                <xsl:value-of select = ".//asignatura[1]"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select = ".//nota[1]"/>
            </td>
        </tr>
        <xsl:apply-templates select=".//nota"/>
    </xsl:template>

    <xsl:template match="nota">
        <tr>
            <td>
                <xsl:value-of select = "./preceding-sibling::*[1]"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select = "."/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet> 
