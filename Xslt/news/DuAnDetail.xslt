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
            <section class="pro-detail-1 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <div class="background">
                    <img class="lazyload" data-src="/Data/Sites/1/skins/default/img/project/bg-1.png"/>
                </div>
                <div class="container">
                    <xsl:apply-templates select="News" mode="TongQuan"></xsl:apply-templates>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=2">
            <section class="pro-detail-2 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <div class="container-fluid">
                    <xsl:apply-templates select="News" mode="ViTri"></xsl:apply-templates>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=4">
            <section class="pro-detail-3 kv-section" setBackground="/Data/Sites/1/skins/default/img/project/detail-bg-3.png">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="main-title fw-900 text-main text-uppercase center">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </div>
                    <div class="swiper-column">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <xsl:apply-templates select="News" mode="TienIch"></xsl:apply-templates>
                            </div>
                        </div>
                        <div class="wrap-button">
                            <div class="button-prev swiper-button-prev-2"></div>
                            <div class="button-next swiper-button-next-2"></div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=5">
            <section class="pro-detail-4 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <div class="container">
                    <div class="main-title text-main text-uppercase fw-900 center">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </div>
                    <div class="img text-center">
                        <xsl:apply-templates select="News" mode="Matbang"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=6">
            <section class="pro-detail-5 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <div class="background">
                    <img class="lazyload" data-src="/Data/Sites/1/skins/default/img/project/bg-2.png" />
                </div>
                <div class="container">
                    <div class="main-title text-main text-uppercase fw-900 center">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </div>
                    <xsl:apply-templates select="News" mode="CanHoMau"></xsl:apply-templates>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=7">
            <section class="pro-detail-6 kv-section">
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">detail-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <div class="background">
                    <img class="lazyload" data-src="/Data/Sites/1/skins/default/img/project/bg-3.png" />
                </div>
                <div class="container">
                    <div class="list-wrapper" id="pro-detail-5">
                        <div class="row">
                            <div class="col-lg-7 pr-0 zoom-img">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/project/canhomau-4.png" />
                                </div>
                            </div>
                            <div class="col-lg-5 pl-0">
                                <div class="project-content d-flex justify-center flex-column">
                                    <div class="content">
                                        <div class="main-title fw-900 text-uppercase text-main">KHU ECO – SMART CITY</div>
                                        <div class="desc">
                                            <div class="text fw-700 f-16 fw-700 color-text fw-700 color-text">Đây là khu vực phát triển khu dân cư sinh thái, mang tính chất hiện đại nhưng vẫn gần gũi với thiên nhiên. Các mẫu nhà được thiết kế mật độ thấp, bố trí nhiều cây xanh cảnh quan từ những khu vườn nhỏ tạo thành một khu vườn lớn biến ECO – SMART CITY trở thành một lá phổi xanh cho Ky Co Gateway.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-wrapper" id="pro-detail-6">
                        <div class="row">
                            <div class="col-lg-7 zoom-img">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/project/canhomau-5.png" />
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="project-content d-flex justify-center flex-column">
                                    <div class="content">
                                        <div class="main-title fw-900 text-uppercase text-main">KHU OCEAN VIEW</div>
                                        <div class="desc">
                                            <div class="text fw-700 f-16 fw-700 color-text">Khu Ocean View hay còn gọi là Deluxe – town: đây là khu trung tâm nghỉ dưỡng ven Hồ vô cực (Swan Lake) – Safari Quy Nhơn – Sân Golf 36 lỗ chuẩn PGA. Đây là nơi bố trí các Biệt thự vườn – Biệt thự nghỉ dưỡng kiểu Nhật mang tính Zen – Theme. Đây là nơi chủ nhân có thể sở hữu – nghỉ ngơi – xác định đẳng cấp – riêng tư – phục hồi hoàn hảo cho sức khoẻ. Và trên hết, Khu Ocean View là điểm ngắm hệ sinh thái biển kỳ quan đẹp nhất nhì Việt Nam là Kỳ Co – Eo Gió. Khu Ocean View - Dự án Kỳ Co Gateway</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-wrapper" id="pro-detail-7">
                        <div class="row">
                            <div class="col-lg-7 zoom-img">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/project/canhomau-6.png" />
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="project-content d-flex justify-center flex-column">
                                    <div class="content">
                                        <div class="main-title fw-900 text-uppercase text-main">KHU central</div>
                                        <div class="desc">
                                            <div class="text fw-700 f-16 fw-700 color-text">Khu Central hay còn gọi là Vibe Town: Với chức năng là trung tâm tiện ích của Kỳ Co Gateway và là nơi tập trung tiện ích của cả Khu đô thị sinh thái Nhơn Hội. Đây là khu vực bố trí dày các tiện ích: khu thể thao – khu công viên – khu hồ bơi – khu mua sắm – các Boutique Shophouse phục vụ cho nhu cầu trải nghiệm, Trung tâm điều dưỡng sức khoẻ quốc tế, trường kỹ năng quốc tế, nhà trẻ dành cho chuyên gia quốc tế.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-wrapper" id="pro-detail-8">
                        <div class="row">
                            <div class="col-lg-7 zoom-img">
                                <div class="item-img">
                                    <img class="lazyload" data-src="./img/project/canhomau-7.png" />
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="project-content d-flex justify-center flex-column">
                                    <div class="content">
                                        <div class="main-title fw-900 text-uppercase text-main">pháp lý của kỳ co</div>
                                        <div class="desc">
                                            <ul>
                                                <li>
                                                    <p>Hiện dự án đã bàn giao sổ đỏ từng nền theo từng phân khu</p>
                                                </li>
                                                <li>
                                                    <p>Quy đất đô thị ven biển, xây tự do có quy hoạch khan hiếm</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="TongQuan">
        <div class="main-title center text-uppercase text-main">
            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </div>
        <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
    </xsl:template>
    <xsl:template match="News" mode="ViTri">
        <xsl:if test="position() = 1">
            <div class="list-wrapper">
                <div class="row">
                    <div class="col-lg-5 p-0">
                        <div class="content-wrapper d-flex flex-column justify-center" setBackground="/Data/Sites/1/skins/default/img/project/detail-bg-2.png">
                            <div class="content">
                                <div class="main-title fw-700 text-main text-uppercase">
                                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                                </div>
                                <div class="desc color-text">
                                    <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 p-0 zoom-img">
                        <div class="img">
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="data-fancybox">
                                    <xsl:text disable-output-escaping="yes">Vị trí</xsl:text>
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
                </div>
            </div>
        </xsl:if>
        <xsl:if test="position() != 1">
            <div class="list-wrapper">
                <div class="row">
                    <div class="col-lg-5 p-0">
                        <div class="content-wrapper d-flex flex-column justify-center" setBackground="/Data/Sites/1/skins/default/img/project/detail-bg-1.png">
                            <div class="content">
                                <div class="main-title fw-700 text-white text-uppercase">
                                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                                </div>
                                <div class="desc color-white">
                                    <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 p-0 zoom-img">
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
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="TienIch">
        <div class="swiper-slide">
            <div class="item-ult zoom-img">
                <a class="item-img">
                    <xsl:attribute name="href">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="data-fancybox">
                        <xsl:text disable-output-escaping="yes">TienIch</xsl:text>
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
                    <div class="title f-18 color-text fw-700 text-center">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="Matbang">
        <img class="lazyload">
            <xsl:attribute name="data-src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
        </img>
    </xsl:template>
    <xsl:template match="News" mode="CanHoMau">
        <div class="kv-swiper">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <xsl:apply-templates select="NewsImages"></xsl:apply-templates>
                </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </xsl:template>
    <xsl:template match="NewsImages">
        <div class="swiper-slide zoom-img">
            <a class="img opacity transition">
                <xsl:attribute name="data-fancybox">
                    <xsl:text disable-output-escaping="yes">CanHoMau</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
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
    </xsl:template>
</xsl:stylesheet>