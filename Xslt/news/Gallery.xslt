<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="wrap-row-1">
			<div class="row">
				<div class="col-xl-6">
					<xsl:apply-templates select="News" mode="Big1"></xsl:apply-templates>
				</div>
				<div class="col-xl-6">
					<div class="row">
						<xsl:apply-templates select="News" mode="Small1"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
		<div class="wrap-row-1">
			<div class="row">
				<div class="col-xl-6">
					<div class="row">
						<xsl:apply-templates select="News" mode="Small2"></xsl:apply-templates>
					</div>
				</div>
				<div class="col-xl-6">
					<xsl:apply-templates select="News" mode="Big2"></xsl:apply-templates>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Big1">
		<xsl:if test="position() = 1">
			<a class="box-img-big">
				<xsl:attribute name="data-fancybox">
					<xsl:text>gallery</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
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
				<div class="icon">
					<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/gallery/icon-camera.png" alt=""/>
				</div>
				<div class="text">
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</div>
			</a>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Small1">
		<xsl:if test="position()&gt;1 and position()&lt;6">
			<div class="col-lg-6">
				<a class="box-img-small">
					<xsl:attribute name="data-fancybox">
						<xsl:text>gallery</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
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
					<div class="icon">
						<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/gallery/icon-camera.png" alt=""/>
					</div>
					<div class="text">
						<xsl:value-of select="Title"></xsl:value-of>
					</div>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Big2">
		<xsl:if test="position() = 6">
			<a class="box-img-big">
				<xsl:attribute name="data-fancybox">
					<xsl:text>gallery</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
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
				<div class="icon">
					<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/gallery/icon-camera.png" alt=""/>
				</div>
				<div class="text">
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</div>
			</a>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Small2">
		<xsl:if test="position()&gt;6">
			<div class="col-lg-6">
				<a class="box-img-small">
					<xsl:attribute name="data-fancybox">
						<xsl:text>gallery</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
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
					<div class="icon">
						<img class="lazyload" data-src="/Data/Sites/1/skins/default/img/gallery/icon-camera.png" alt=""/>
					</div>
					<div class="text">
						<xsl:value-of select="Title"></xsl:value-of>
					</div>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>