<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <div class="project-wrapper">
            <xsl:apply-templates select="Zone"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:apply-templates select="News"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="News">
        <div class="list-project">
            <div class="row">
                <div class="col-lg-7 zoom-img">
                    <div class="item-img">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="SubTitle"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <img class="lazyload">
                                <xsl:attribute name="data-src">
                                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="Title"></xsl:value-of>
                                </xsl:attribute>
                            </img>
                        </a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="project-content d-flex justify-center flex-column">
                        <div class="main-title fw-900 text-main text-uppercase">
                            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        </div>
                        <div class="desc">
                            <div class="text fw-700 f-16 text-main lcl lcl-3">
                                <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                            </div>
                            <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
                        </div>
                        <a class="btn btn-view-more">
                            <xsl:attribute name="href">
                                <xsl:value-of select="SubTitle"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:text disable-output-escaping="yes">Xem tất cả</xsl:text>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>