<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <div class="row">
            <xsl:apply-templates select="Zone/Zone"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:if test="position()=1">
            <div class="col-lg-6">
                <div class="main-title text-uppercase">
                    <xsl:value-of select="Title"></xsl:value-of>
                </div>
                <xsl:apply-templates select="News[1]" mode="BigImg"></xsl:apply-templates>
                <div class="small-image">
                    <div class="row">
                        <xsl:apply-templates select="News[position()&gt;1 and position()&lt;4]" mode="Small"></xsl:apply-templates>
                    </div>
                </div>
                <a class="btn btn-view-more">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:text>Xem tất cả</xsl:text>
                </a>
            </div>
        </xsl:if>
        <xsl:if test="position()=2">
            <div class="col-lg-6">
                <div class="main-title text-uppercase">
                    <xsl:value-of select="Title"></xsl:value-of>
                </div>
                <xsl:apply-templates select="News[1]" mode="BigImg1"></xsl:apply-templates>
                <div class="small-image-more">
                    <div class="row">
                        <xsl:apply-templates select="News[position()&gt;1 and position()&lt;5]" mode="SmallImg1"></xsl:apply-templates>
                    </div>
                </div>
                 <a class="btn btn-view-more">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:text>Xem tất cả</xsl:text>
                </a>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="BigImg">
        <div class="big-image">
            <div class="item-news zoom-img zoom-img">
                <div class="item-img">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
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
                <div class="item-desc">
                    <a class="text f-18">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of select="Title"></xsl:value-of>
                    </a>
                    <div class="time">
                        <xsl:value-of select="CreatedDate"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="Small">
        <div class="col-lg-6">
            <div class="item-news zoom-img">
                <div class="item-img">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
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
                <div class="item-desc">
                    <a class="text f-16">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of select="Title"></xsl:value-of>
                    </a>
                    <div class="time">
                        <xsl:value-of select="CreatedDate"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="BigImg1">
        <div class="big-image">
            <div class="item-news zoom-img">
                <div class="item-img">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
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
                <div class="item-desc">
                    <a class="text f-16">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </a>
                    <div class="time">
                        <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="SmallImg1">
        <div class="col-lg-4">
            <div class="item-news zoom-img">
                <div class="item-img">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
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
                <div class="item-desc">
                    <a class="text f-16">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </a>
                    <div class="time">
                        <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>