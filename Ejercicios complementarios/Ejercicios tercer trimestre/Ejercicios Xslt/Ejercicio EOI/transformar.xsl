<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>Calendario de examenes</title>
                <link rel="stylesheet" href="miestilo.css"/>
            </head>
            <body>
                <h2>Calendario de examenes</h2>

                <h3>Mayo</h3>

                <xsl:for-each-group select="//examen[contains(text(),'Mayo')]/ancestor::idioma" group-by="@codigo">
                    <table>
                        <tr>
                            <td colspan="4" class="encabezadosTabla">
                                <xsl:value-of select="./@codigo"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="encabezadosTabla">Nivel</td>
                            <td class="encabezadosTabla">Modalidad</td>
                            <td class="encabezadosTabla">Lugar</td>
                            <td class="encabezadosTabla">Fecha</td>
                        </tr>
                        <xsl:for-each select=".//examen[contains(text(),'Mayo')]">
                            <tr>
                                <td>
                                    <xsl:value-of select="./ancestor::nivel/@certificacion"/>
                                </td>
                                <td>
                                    <xsl:value-of select="./@tipo"/>
                                </td>
                                <td>
                                    <xsl:value-of select="./ancestor::escuela/@sede"/>
                                </td>
                                <td><xsl:value-of select="."/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each-group>

                <h3>Junio</h3>

                <xsl:for-each-group select="//examen[contains(text(),'Junio')]/ancestor::idioma" group-by="@codigo">
                    <table>
                        <tr>
                            <td colspan="4" class="encabezadosTabla">
                                <xsl:value-of select="./@codigo"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="encabezadosTabla">Nivel</td>
                            <td class="encabezadosTabla">Modalidad</td>
                            <td class="encabezadosTabla">Lugar</td>
                            <td class="encabezadosTabla">Fecha</td>
                        </tr>
                        <xsl:for-each select=".//examen[contains(text(),'Junio')]">
                            <tr>
                                <td>
                                    <xsl:value-of select="./ancestor::nivel/@certificacion"/>
                                </td>
                                <td>
                                    <xsl:value-of select="./@tipo"/>
                                </td>
                                <td>
                                    <xsl:value-of select="./ancestor::escuela/@sede"/>
                                </td>
                                <td><xsl:value-of select="."/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet> 
