<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ProductDetail">
        <section class="kv-section product-detail">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="swiper-product-wrapper">
                            <div class="swiper-product-thumb">
                                <div class="swiper-container-thumbs gallery-thumbs">
                                    <div class="swiper-wrapper">
                                        <xsl:apply-templates select="ProductImages" mode="Thumb"></xsl:apply-templates>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-product-main">
                                <div class="swiper-container gallery-top">
                                    <div class="swiper-wrapper">
                                        <xsl:apply-templates select="ProductImages" mode="Top"></xsl:apply-templates>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product-infor-wrapper">
                            <div class="product-title">
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
                                    <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                                </a>
                                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                            </div>
                            <div class="price-wrapper">
                                <div class="price">
                                    <span>Giá:</span>
                                    <div class="current">
                                        <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
                                    </div>
                                </div>
                                <div class="product-id">
                                    <div class="id">
                                        <xsl:value-of select="Code" disable-output-escaping="yes"></xsl:value-of>
                                    </div>
                                </div>
                            </div>
                            <div class="desc-wrapper">
                                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                            </div>
                            <div class="item-quantity">
                                <div class="input-group">
                                    <label for="">Số lượng:</label>
                                    <div class="input-group-btn">
                                        <div class="qty-minus btn-number">
                                            <em class="material-icons">remove</em>
                                        </div>
                                    </div>
                                    <input class="product-details-quantity form-control input-number" type="text" value="1"/>
                                    <div class="input-group-btn">
                                        <div class="qty-plus btn-number">
                                            <em class="material-icons">add</em>
                                        </div>
                                    </div>
                                </div>
                                <div class="add-shopping-cart">
                                    <a class="nav-link" href="">mua ngay
                                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <span class="lnr lnr-arrow-right"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="social-share">
                                <div class="fb-like" data-layout="button_count" data-action="like" data-size="small" data-share="true">
                                    <xsl:attribute name="data-href">
                                        <xsl:value-of select="FullUrl" disable-output-escaping="yes"></xsl:value-of>
                                    </xsl:attribute>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-panels">
                    <ul class="tabs">
                        <li class="item active" rel="panel-1">Thông tin chi tiết</li>
                        <li class="item" rel="panel-2">Bình luận</li>
                    </ul>
                    <div class="panel active" id="panel-1">
                        <div class="full-content">
                            <xsl:value-of select="ProductAttributes/Content" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                    </div>
                    <div class="panel" id="panel-2"></div>
                </div>
            </div>
        </section>
        <section class="kv-section product-other">
            <div class="container">
                <div class="caption">
                    <div class="title">Sản phẩm khác</div>
                </div>
                <div class="swiper-product-other">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <xsl:apply-templates select="ProductOther"></xsl:apply-templates>
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="ProductImages" mode="Thumb">
        <div class="swiper-slide">
            <div class="img">
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                </img>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="ProductImages" mode="Top">
        <div class="swiper-slide">
            <div class="img">
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                </img>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="ProductOther">
        <div class="swiper-slide">
            <div class="item-pro">
                <div class="img">
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
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="content">
                    <div class="product-title lcl lcl-2">
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
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </a>
                    </div>
                    <div class="price-wrapper">
                        <div class="current">
                            <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>