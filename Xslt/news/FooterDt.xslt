<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone/Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="list-partners">
			<div class="row">
				<div class="col-lg-2">
					<div class="col-title-partner d-flex align-center">
						<div class="title text-white f-24 text-uppercase fw-700">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</div>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="col-list-pertner d-flex align-center flex-row flex-wrap">
						<xsl:apply-templates select="News"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="item-partner d-flex align-center justify-center flex-">
			<div class="item-img">
				<img class="transition lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>