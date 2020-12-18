<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/BannerList">
		<div class="img">
			<xsl:apply-templates select="Banner"></xsl:apply-templates>
		</div>
		<div class="box-text">
			<h2 class="title-line">
				<xsl:value-of disable-output-escaping="yes" select="ZoneTitle"></xsl:value-of>
			</h2>
		</div>
	</xsl:template>
	<xsl:template match="Banner">
		<img >
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		</img>
	</xsl:template>
</xsl:stylesheet>