<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
 
	</xsl:template>
	<!-- <xsl:template match="/NewsDetail">
		<section class="new-detail">
			<div class="container">
				<div class="main-content">
					<div class="header-content">
						<h2 class="title">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h2>
						<div class="wrap-sub">
							<div class="date">
								<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
							</div>
							<div class="wrap-social">
								<a href="">
									<xsl:attribute name="href">
										<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
										<xsl:value-of select="FullUrl"/>
									</xsl:attribute>
									<em class="ri-facebook-fill"></em>
								</a>
								<a href="">
									<xsl:attribute name="href">
										<xsl:text>https://twitter.com/home?status=</xsl:text>
										<xsl:value-of select="FullUrl"/>
									</xsl:attribute>
									<em class="ri-twitter-fill"></em>
								</a>
							</div>
						</div>
					</div>
					<div class="content">
						<xsl:value-of select="FullContent"></xsl:value-of>
					</div>
				</div>
				<div class="wrap-list-tin">
					<h3 class="title-list">Tin liên quan</h3>
					<div class="wrap-slide">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="NewsOther"></xsl:apply-templates>
							</div>
						</div>
						<div class="wrap-button">
							<div class="button-prev swiper-button-prev-2"></div>
							<div class="button-next swiper-button-next-2"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="swiper-slide">
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
					<p class="lcl lcl-2">
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</p>
				</div>
				<div class="date">
					<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
				</div>
			</a>
		</div>
	</xsl:template>-->
</xsl:stylesheet>  
