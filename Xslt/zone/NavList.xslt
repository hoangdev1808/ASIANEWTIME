<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <div class="zone-nav">
            <div class="categroly transition">
                <div class="box-category">
                    <em class="material-icons">expand_more</em>
                </div>
                <ul class="transition">
                    <xsl:apply-templates select="Zone"></xsl:apply-templates>
                </ul>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Zone">
        <li class="d-flex align-center justify-center transition">
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text>d-flex align-center justify-center transition active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <a class="nav-link fw-700 f-14">
                <xsl:attribute name="href">
                    <xsl:text disable-output-escaping="yes">#about-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>