<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <xsl:apply-templates select="Zone"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:if test="psition()=1">
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
                        <div class="col-lg-8 col-md-6">
                            <div class="img">
                                <img class="lazyload" data-src="./img/index/bg-home-2.png"/>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="col-content">
                                <div class="main-title text-white">Câu chuyện Asia New Time</div>
                                <div class="desc color-white f-18">Với hơn 20.000 sản phẩm bất động sản đa dạng, thuộc các khu vực có tiềm năng phát triển nhất hiện nay, Asia New Time tự hào mang đến nhiều sự lựa chọn, phù hợp với nhu cầu đầu tư cũng như an cư của mọi khách hàng. Chúng tôi luôn nỗ lực hết mình để mang đến cho Qúy khách hàng những điều tốt đẹp nhất.</div>
                                <a class="btn btn-view-more" href="">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=2">
            <section class="about-page-2 kv-section" id="about-2">
                <div class="bg-about" setBackground="../img/about/about-page-1.png"></div>
                <div class="container">
                    <div class="list-items">
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/about/lookout.png" />
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="item-content d-flex justify-center flex-column">
                                    <div class="main-title text-uppercase text-main">Tầm nhìn</div>
                                    <div class="desc f-16 fw-700">Là một trong những sàn giao dịch BĐS có uy tín và tiềm năng, 
                                    
                                    
                                        
                                        <span>Asia New Time </span>đặt mục tiêu trở thành nhà đầu tư, kinh doanh trong tương lai cung cấp nhiều sản phẩm có giá trị cho thị trường BĐS.
                                
                                
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-items">
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/about/sumenh.png" />
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="item-content d-flex justify-center flex-column">
                                    <div class="main-title text-uppercase text-main">sứ mệnh</div>
                                    <div class="desc f-16 fw-700">Bằng những nổ lực không ngừng, 
                                    
                                    
                                        
                                        <span>Asia New Time </span>cung cấp các sản phẩm bất động sản với chất lượng và giá cả hợp lý để đáp ứng nhu cầu của khách hàng. 
                                
                                
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=3">
            <section class="about-page-3 kv-section" id="about-3" setBackground="../img/about/about-page-2.png">
                <div class="container">
                    <div class="main-title text-uppercase text-main text-center">lĩnh vực hoạt động</div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="item zoom-img">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/about/i-1.png" />
                                </div>
                                <div class="item-content d-flex align-center justify-center">
                                    <div class="desc f-16 fw-900 text-main text-uppercase text-center">kinh doanh & tiếp thị</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="item zoom-img">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/about/i-2.png" />
                                </div>
                                <div class="item-content d-flex align-center justify-center">
                                    <div class="desc f-16 fw-900 text-main text-uppercase text-center">ĐẦU TƯ & PHÁT TRIỂN DỰ ÁN</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="item zoom-img">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/about/i-3.png" />
                                </div>
                                <div class="item-content d-flex align-center justify-center">
                                    <div class="desc f-16 fw-900 text-main text-uppercase text-center">NGHIÊN CỨU THỊ TRƯỜNG</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>