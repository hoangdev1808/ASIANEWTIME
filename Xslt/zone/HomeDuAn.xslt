<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <xsl:apply-templates select="Zone/Zone" mode="LV1"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone" mode="LV1">
        <div class="panel">
            <xsl:attribute name="id">
                <xsl:text disable-output-escaping="yes">panel-</xsl:text>
                <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
            </xsl:attribute>
            <xsl:if test="position()=2">
                <xsl:attribute name="class">
                    <xsl:text>panel active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text>panel active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <div class="single-swiper">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <xsl:apply-templates select="Zone" mode="LV2"></xsl:apply-templates>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
            <div class="tab-button">
                <a class="btn btn-view-more">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:text disable-output-escaping="yes">Xem tất cả</xsl:text>
                </a>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="LV2">
        <div class="swiper-slide">
            <div class="project-item">
                <a class="item-link">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <div class="item-img">
                        <img class="lazyload">
                            <xsl:attribute name="data-src">
                                <xsl:value-of select="ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                        <div class="img-hover"></div>
                    </div>
                    <div class="item-desc">
                        <div class="text f-24 text-uppercase text-center">
                            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>