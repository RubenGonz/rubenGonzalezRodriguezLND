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
                <xsl:variable name="Asignatura">
                    <xsl:text>Redes</xsl:text>
                </xsl:variable>
                <h3><xsl:value-of select="$Asignatura"/></h3>
                <table>
                    <xsl:apply-templates select="//alumno[.//asignatura=$Asignatura]">
                        <xsl:sort select=".//nota[preceding-sibling::asignatura[1][.='Redes']]" data-type="number" order="descending"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="alumno">
        <tr>
            <td>
                <xsl:value-of select="./nombre"/>
                <xsl:text></xsl:text>
                <xsl:value-of select="./apellidos"/>
            </td>
            <td>
                <xsl:value-of select=".//nota[preceding-sibling::asignatura[1][.='Redes']]"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet> 
