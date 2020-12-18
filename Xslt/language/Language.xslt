<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/LanguageList">
		<div class="language">
			<xsl:apply-templates select="Language"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Language">
		<a class="text-uppercase f-16" href="">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>text-uppercase f-16 active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</a>
	</xsl:template>
</xsl:stylesheet>