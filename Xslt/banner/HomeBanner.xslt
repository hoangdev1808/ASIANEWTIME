<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/BannerList">
        <div class="swiper-container banner-wrapper">
            <div class="swiper-wrapper">
                <xsl:apply-templates select="Banner"></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Banner">
        <div class="swiper-slide">
            <div class="img">
                <img class="ovh lazyload">
                    <xsl:attribute name="data-src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                </img>
            </div>
            <div class="content">
                <div class="text">
                    <xsl:if test="Description != ''">
                        <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
                    </xsl:if>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>