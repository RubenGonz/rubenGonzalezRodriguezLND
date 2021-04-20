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
                        <td>Codigo</td>
                        <td>Nombre</td>
                    </tr>
                    <xsl:apply-templates select="//curso"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="curso">
        <tr>
            <td>
                <xsl:number value="position()" format="1"/>
            </td>
            <td>
                <xsl:value-of select = "./@nombre"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet> 
