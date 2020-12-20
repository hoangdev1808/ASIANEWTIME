<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ProductList">
        <div class="filter-wrapper d-flex align-center">
            <div class="text f-20 fw-700 text-main">Bộ lọc</div>
            <div class="wrapper">
                <div class="dropdown d-flex align-center justify-between">
                    <a class="f-16 fw-500 text-main d-flex align-center" href="">
                        <em class="ri-building-2-fill"></em>
                        <div class="text">Khu vực</div>
                        <em class="ri-arrow-down-s-line"></em>
                    </a>
                    <div class="dropdown-menu">
                        <ul>
                            <li>
                                <a href="">Hà Nội</a>
                            </li>
                            <li>
                                <a href="">TP.Hồ Chí Minh</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper">
                <div class="dropdown d-flex align-center justify-between">
                    <a class="f-16 fw-500 text-main d-flex align-center" href="">
                        <em class="ri-shape-2-fill"></em>
                        <div class="text">Dựu án</div>
                        <em class="ri-arrow-down-s-line"></em>
                    </a>
                    <div class="dropdown-menu">
                        <ul>
                            <li>
                                <a href="">Căn hộ</a>
                            </li>
                            <li>
                                <a href="">Đất nền</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-wrapper">
            <div class="row">
                <xsl:apply-templates select="Product"></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Product">
        <div class="col-lg-4">
            <div class="item-product zoom-img">
                <a class="item-img">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
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
                </a>
                <div class="item-content">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:value-of select="Target"></xsl:value-of>
                        </xsl:attribute>
                        <div class="text text-capitalize f-18 text-main fw-700">
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                    </a>
                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>