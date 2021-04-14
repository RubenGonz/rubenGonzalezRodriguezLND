<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>Noticias</title>
                <link rel="stylesheet" href="miestilo.css"/>
            </head>
            <body>
                <xsl:apply-templates select="//item"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="item">
        <table>
            <tr>
                <td>
                    <xsl:value-of select="./title"/>
                </td>
            </tr>
        </table>
        <br/>
    </xsl:template>
</xsl:stylesheet> 
