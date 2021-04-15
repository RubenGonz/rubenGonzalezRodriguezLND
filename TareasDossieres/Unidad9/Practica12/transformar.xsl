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
                <xsl:apply-templates select="//curso"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="curso">
        <table>
            <tr>
                <th colspan="3">
                    <xsl:value-of select="./@nombre"/>
                </th>
            </tr>
            <tr>
                <td>CIAL:</td>
                <td>Nombre:</td>
                <td>Apellidos:</td>
            </tr>
            <xsl:apply-templates select=".//alumno"></xsl:apply-templates>
        </table>
        <br/>
    </xsl:template>

    <xsl:template match="alumno">
        <tr>
            <td>
                <xsl:value-of select="./@cial"/>
            </td>
            <td>
                <xsl:value-of select="./nombre"/>
            </td>
            <td>
                <xsl:value-of select="./apellidos"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet> 