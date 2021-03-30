<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <title>Prueba de XPATH</title>
            </head>
            <body>
                <H1>Resultado de la consulta XPATH:</H1>
                <pre>
                    <xsl:apply-templates select="//alumno[./not(@cial='A18X111')]/nombre*/text()"/>
                </pre>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
