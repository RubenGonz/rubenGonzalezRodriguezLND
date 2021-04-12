<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml"/>

    <xsl:template match="/">
        <ciales>
            <xsl:apply-templates select="//alumno[contains(apellidos,'Pérez')]"/>
        </ciales>
    </xsl:template>

    <xsl:template match="alumno">
        <alumno>
            <cial>
                <xsl:value-of select="./@cial"/>
            </cial>
            <datos>
                <xsl:value-of select="./nombre"/>
                <xsl:text> -</xsl:text>
                <xsl:value-of select="/apellidos"/>
            </datos>
            <curso>
                <xsl:value-of select="../@nombre"/>
            </curso>
        </alumno>
    </xsl:template>
</xsl:stylesheet>
