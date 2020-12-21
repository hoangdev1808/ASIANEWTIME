<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <ul class="tabs justify-center">
            <xsl:apply-templates select="Zone/Zone"></xsl:apply-templates>
        </ul>
    </xsl:template>
    <xsl:template match="Zone">
        <li class="item f-16">
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text>item f-16 active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="position()=2">
                <xsl:attribute name="class">
                    <xsl:text>item f-16 active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="rel">
                <xsl:text disable-output-escaping="yes">panel-</xsl:text>
                <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </li>
    </xsl:template>
</xsl:stylesheet>