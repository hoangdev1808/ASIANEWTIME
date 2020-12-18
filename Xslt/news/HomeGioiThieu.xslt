<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <xsl:apply-templates select="Zone"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:if test="position()=1">
            <div class="row">
                <div class="col-lg-8"></div>
                <xsl:apply-templates select="News"></xsl:apply-templates>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News">
        <div class="col-lg-4">
            <div class="col-content">
                <div class="main-title text-white text-uppercase">
                    <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                </div>
                <div class="desc color-white f-18">
                    <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
                <a class="btn btn-view-more">
					<xsl:attribute name="href">
						<xsl:text disable-output-escaping="yes">/gio-thieu#about-1</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:text disable-output-escaping="yes">Xem chi tiết</xsl:text>
				</a>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>