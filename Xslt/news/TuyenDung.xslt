<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="position() = 1">
			<xsl:apply-templates select="News" mode="Mt1"></xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Mt1">
		<div class="wrap-post">
			<div class="row">
				<div class="col-lg-6">
					<div class="img">
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="text">
						<h2 class="main-title color-title">
							<xsl:value-of select="Title"></xsl:value-of>
						</h2>
						<div class="des">
							<p>
								<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>