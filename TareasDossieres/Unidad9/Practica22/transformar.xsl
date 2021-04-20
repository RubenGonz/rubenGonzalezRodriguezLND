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
            <td rowspan="2">
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
        <tr>
            <xsl:apply-templates select=".//notas"/>
        </tr>
    </xsl:template>

    <xsl:template match="notas">
        <td colsspan="5">
            <xsl:text>Algo</xsl:text>
        </td>
        <td colsspan="2">
            <xsl:value-of select = "sum(.//nota) div count(.//nota)"/>
        </td>
    </xsl:template>

</xsl:stylesheet> 
