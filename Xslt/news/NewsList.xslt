<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="row news-wrap">
      <h1 class="col-sm-12 title-page">
        <span>
          <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </span>
      </h1>
      <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <div class="news-item mrb40 clearfix">
      <div class="col-sm-4 mrb10">
        <figure>
          <a class="ls-img center-block">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
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
          <figcaption></figcaption>
        </figure>
      </div>
      <div class="col-sm-8 news-content mrb10">
        <h2>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title"></xsl:value-of>
          </a>
          <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
        </h2>
        <div class="mrb10">
          <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
      <div class="col-sm-12 ">
        <div class="news-desc">
          <time>
            <xsl:value-of select="CreatedDate"></xsl:value-of>
          </time>
          <a class="readmore">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="/NewsList/ViewMore"></xsl:value-of>
            <xsl:text> </xsl:text>
            <i class="fa fa-angle-right"></i>
          </a>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>