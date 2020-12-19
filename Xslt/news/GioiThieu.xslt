<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <xsl:apply-templates select="Zone"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:if test="position()=1">
            <section class="about-1 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">about-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="setBackground">
                    <xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="row">
                        <xsl:apply-templates select="News" mode="CauChuyen"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=2">
            <section class="about-page-2 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">about-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <div class="bg-about" setBackground="/Data/Sites/1/skins/default/img/about/about-page-1.png"></div>
                <div class="container">
                    <xsl:apply-templates select="News" mode="TamNhin-SuMenh"></xsl:apply-templates>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=3">
            <section class="about-page-3 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">about-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="setBackground">
                    <xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="main-title text-uppercase text-main text-center">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </div>
                    <div class="row">
                        <xsl:apply-templates select="News" mode="LinhVuc"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="CauChuyen">
        <div class="col-lg-8 col-md-6">
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
        <div class="col-lg-4 col-md-6">
            <div class="col-content">
                <div class="main-title text-white">
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </div>
                <div class="desc color-white f-18">
                    <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                </div>
                <a class="btn btn-view-more" href="">Xem chi tiết</a>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="TamNhin-SuMenh">
        <div class="list-items">
            <div class="row">
                <div class="col-lg-7">
                    <div class="item-img">
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
                <div class="col-lg-5">
                    <div class="item-content d-flex justify-center flex-column">
                        <div class="main-title text-uppercase text-main">
                            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        </div>
                        <div class="desc f-16 fw-700">
                            <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="LinhVuc">
        <div class="col-lg-4">
            <div class="item zoom-img">
                <div class="item-img">
                    <img class="lazyload">
                        <xsl:attribute name="data-src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                    </img>
                </div>
                <div class="item-content d-flex align-center justify-center">
                    <div class="desc f-16 fw-900 text-main text-uppercase text-center">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>