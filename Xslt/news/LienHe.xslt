<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/NewsList">
        <div class="title-select">ASIA NEW TIME
            
            <br>Real Estate Development</br>
        </div>
        <ul class="list-item type-none">
            <xsl:apply-templates select="News"></xsl:apply-templates>
        </ul>
    </xsl:template>
    <xsl:template match="News">
        <li class="item">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
            <xsl:attribute name="data-href">
                <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
            </xsl:attribute>
            <div class="title">
                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
            </div>
            <p class="location">
                <em class="mdi mdi-map-marker"></em>
                <xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
            </p>
            <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
        </li>
    </xsl:template>
</xsl:stylesheet>