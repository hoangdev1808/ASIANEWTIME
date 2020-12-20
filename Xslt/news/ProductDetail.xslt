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
            <section class="resale-detail-1 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="main-title center text-uppercase text-main">
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <xsl:apply-templates select="News" mode="LongThanh"></xsl:apply-templates>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=2">
            <section class="resale-detail-2 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
                <div class="container-fluid">
                    <div class="row">
                        <xsl:apply-templates select="News" mode="TongQuan"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=3">
            <section class="resale-detail-3 kv-section" id="pro-detail-2" setBackground="/Data/Sites/1/skins/default/img/product/detail-bg-1.png">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="row">
                        <xsl:apply-templates select="News" mode="ThongTin"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=4">
            <section class="resale-detail-4 kv-section" id="pro-detail-2">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="main-title fw-900 text-main text-uppercase center">
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <xsl:apply-templates select="News" mode="NoiThat"></xsl:apply-templates>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=5">
            <section class="resale-detail-5 kv-section" setBackground="/Data/Sites/1/skins/default/img/product/detail-bg-3.png">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="main-title fw-900 text-main text-uppercase center">
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <div class="desc text-center fw-700 f-16 color-text">
                        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <div class="list-wrapper">
                        <div class="row">
                            <xsl:apply-templates select="News" mode="TienIch"></xsl:apply-templates>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=6">
            <section class="resale-detail-6 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
                <div class="background">
                    <img class="lazyload" data-src="/Data/Sites/1/skins/default/img/product/detail-bg-2.png" alt=""/>
                </div>
                <div class="container-fluid p-0">
                    <div class="main-title fw-900 text-main text-uppercase center">
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <div class="image-map-wrapper">
                        <xsl:apply-templates select="News" mode="PhanLo"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=7">
            <section class="resale-detail-7 kv-section" id="pro-detail-2">
                <div class="container">
                    <div class="main-title text-main text-uppercase fw-900 center">
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <div class="img text-center">
                        <img class="lazyload">
                            <xsl:attribute name="data-src">
                                <xsl:value-of select="News/ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="News/Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </div>
                </div>
            </section>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="LongThanh">
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
    </xsl:template>
    <xsl:template match="News" mode="TongQuan">
        <div class="col-lg-5 p-0">
            <div class="content-wrapper d-flex flex-column justify-start" setBackground="/Data/Sites/1/skins/default/img/product/detail-bg.png">
                <div class="content">
                    <div class="main-title fw-700 text-main text-uppercase">
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <div class="desch f-16 fw-700 color-text">
                        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-7 p-0 zoom-img">
            <div class="img">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="SubTitle"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="data-fancybox">
                        <xsl:text disable-output-escaping="yes">Video</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:value-of select="Target"></xsl:value-of>
                    </xsl:attribute>
                    <img class="lazyload">
                        <xsl:attribute name="data-src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                    </img>
                    <div class="play-icon">
                        <img src="/Data/Sites/1/skins/default/img/icons/play-button.png" />
                    </div>
                </a>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="ThongTin">
        <div class="col-lg-7">
            <div class="content">
                <div class="main-title fw-900 text-main text-uppercase">
                    <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                </div>
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
        </div>
        <div class="col-lg-5">
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
    </xsl:template>
    <xsl:template match="News" mode="NoiThat">
        <div class="image-wrapper">
            <img class="lazyload">
                <xsl:attribute name="data-src">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
            </img>
        </div>
        <div class="list-wrapper">
            <div class="row">
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="TienIch">
        <xsl:apply-templates select="NewsImages"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="NewsImages">
        <xsl:if test="position()&lt;3">
            <div class="col-lg-6">
                <a class="big-img zoom-img">
                    <xsl:attribute name="href">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="data-fancybox">
                        <xsl:text disable-output-escaping="yes">Image</xsl:text>
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
                </a>
            </div>
        </xsl:if>
        <xsl:if test="position()&gt;2">
            <div class="col-lg-4">
                <a class="small-img zoom-img">
                    <xsl:attribute name="href">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="data-fancybox">
                        <xsl:text disable-output-escaping="yes">Image</xsl:text>
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
                </a>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="PhanLo">
        <img class="lazyload" usemap="#image-map">
            <xsl:attribute name="data-src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
        </img>
        <map name="image-map">
            <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
        </map>
    </xsl:template>
</xsl:stylesheet>