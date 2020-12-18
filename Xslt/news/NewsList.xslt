<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="row">
			<xsl:apply-templates select="News" mode="Big"></xsl:apply-templates>
			<xsl:apply-templates select="News" mode="Small"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Big">
		<xsl:if test="position()&lt;3">
			<div class="col-lg-6">
				<a class="box-post-big zoom-img">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
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
					<div class="title">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</p>
					</div>
					<div class="date">
						<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
					</div>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Small">
		<xsl:if test="position()&gt;2">
			<div class="col-lg-3 col-md-6">
				<a class="box-post-small zoom-img">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
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
					<div class="title">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</p>
					</div>
					<div class="date">
						<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
					</div>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>