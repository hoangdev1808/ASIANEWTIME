<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <h4>
      <xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
    </h4>
    <div class="row">
      <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <div class="col-md-3">
      <div class="item">
        <figure>
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <div class="desc">
              <time>
                <xsl:value-of select="CreatedDate"></xsl:value-of>
              </time>
              <h5>
                <a>
                  <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="Title"></xsl:value-of>
                </a>
              </h5>
              <div class="brief mrb5">
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <a class="btn btn-sm btn-default readmore">
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="/NewsList/ViewMore"></xsl:value-of>
                <xsl:text> </xsl:text>
                <i class="fa fa-arrow-right"></i>
              </a>
            </div>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>