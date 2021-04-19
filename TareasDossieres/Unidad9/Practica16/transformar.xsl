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
                <h3>Lista de cursos disponibles:</h3>
                <xsl:apply-templates select="//curso"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="curso">
        <xsl:number value="position()" format="a)"/>
        <xsl:value-of select = "./@nombre"/>
        <br/>
        <xsl:apply-templates select="./alumno"/>
    </xsl:template>

    <xsl:template match="alumno">
        <xsl:number value="position()" format="1)"/>
        <xsl:value-of select = "./nombre"/>
        <br/>
    </xsl:template>

</xsl:stylesheet> 
