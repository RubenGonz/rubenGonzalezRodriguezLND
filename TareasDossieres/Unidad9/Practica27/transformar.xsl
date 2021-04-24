<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:variable name="Aprobado" select="5"/>
    
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
            <td class="fondoGris alineado">
                <xsl:number value="position()" format="1"/>
            </td>
            <td class="alineado">
                <xsl:value-of select = "./nombre"/>
                <xsl:text></xsl:text>
                <xsl:value-of select = "./apellidos"/>
            </td>
            <td>
                <p>
                    <xsl:apply-templates select=".//nota[.&lt;$Aprobado]"/>
                </p>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="nota">
        <xsl:value-of select = "./preceding-sibling::*[1]"/>
        <xsl:text>: </xsl:text>
        <xsl:value-of select = "."/>
        <br/>
    </xsl:template>

</xsl:stylesheet> 
