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
                <h1>Lista de nombres y apellidos</h1>
                <xsl:apply-templates select="//alumno"/>
                <h1>Lista de ciales y curso</h1>
                <xsl:apply-templates select="//alumno" mode="ciales"></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="alumno">
        <table>
            <tr>
                <th>Nombre</th>
                <th>Apellidos</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="./nombre"/>
                </td>
                <td>
                    <xsl:value-of select="./apellidos"/>
                </td>
            </tr>
        </table>
        <br/>
    </xsl:template>

    <xsl:template match="alumno" mode="ciales">

        <table>
            <caption>
                <xsl:number count="//alumno" level="any" format="1"></xsl:number>
            </caption>
            <tr>
                <th>Cial</th>
                <th>Curso</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="./@cial"></xsl:value-of>
                </td>
                <td>
                    <xsl:value-of select="../@nombre"></xsl:value-of>
                </td>
            </tr>
        </table>
        <br/>
    </xsl:template>

</xsl:stylesheet> 