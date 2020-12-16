<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<h2 class="main-title center color-title">
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</h2>
		<div class="wrap-list-td">
			<div class="row">
				<xsl:apply-templates select="News" mode="Mt2"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Mt2">
		<div class="col-lg-6">
			<a class="box-td">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<p class="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</p>
				<p class="location">
					<em class="ri-map-pin-2-fill"></em>
					<xsl:value-of select="SubTitle"></xsl:value-of>
				</p>
				<div class="wrap-end">
					<div class="wrap-md">
						<p class="money">
							<em class="mdi mdi-currency-usd"></em>
							<xsl:value-of select="BriefContent"></xsl:value-of>
						</p>
						<p class="date">
							<em class="ri-calendar-check-fill"></em>
							<xsl:value-of select="EndDate"></xsl:value-of>
						</p>
					</div>
					<p class="xemthem">
						<xsl:text>Xem thêm</xsl:text>
					</p>
				</div>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>