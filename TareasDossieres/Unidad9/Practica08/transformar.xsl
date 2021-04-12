<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml"/>

    <xsl:template match="/">
        <cartas>
            <xsl:apply-templates select="//alumno[contains(apellidos,'Pérez')]"/>
        </cartas>
    </xsl:template>

    <xsl:template match="alumno">
        <invitacion>
            <destinatario>
                <xsl:value-of select="./nombre"/> - <xsl:value-of select="./apellidos"/>
            </destinatario>
            <evento>
                1ª Congregación de los Pérez
            </evento>
        </invitacion>
    </xsl:template>
</xsl:stylesheet>
