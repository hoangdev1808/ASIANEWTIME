<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="tp-banner">
      <ul>
        <xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="Banner">
    <li data-transition="fade" data-slotamount="7" data-masterspeed="1500">
      <img data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">
        <xsl:attribute name="src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
      </img>
      <div class="tp-caption start" data-x="0" data-hoffset="0" data-y="center" data-voffset="0" data-speed="800" data-start="0" data-easing="Power4.easeOut" data-endspeed="300" data-endeasing="Power1.easeIn" data-captionhidden="off" style="z-index: 6">
        <!--<div class="container">
          <div class="col-md-6 col-md-offset-6">
            <div class="boxslder">
              <p>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </p>
              <p>
                <a class="btn btn-default readmore">
                  <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="title">
                    <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="/BannerList/Readmore" disable-output-escaping="yes"></xsl:value-of>
                </a>
              </p>
            </div>
          </div>
        </div>-->
      </div>
    </li>
  </xsl:template>
</xsl:stylesheet>