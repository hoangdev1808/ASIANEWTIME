<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="cc-content-newsdetail mrt30">
      <div class="container">
        <div class="row">
          <div class="item mrb30">
            <h3>
              <xsl:value-of select="/NewsDetail/Title"></xsl:value-of>
              <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h3>
            <time>
              <i class="fa fa-calendar"></i>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/NewsDetail/CreatedDate"></xsl:value-of>
            </time>
            <div class="desc">
              <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
          </div>
          <nav class="social">
            <button href="#" class="btn btn-default toggle">
              <i class="fa fa-share-alt"></i>
              <ul class="list-inline">
                <li>
                  <xsl:value-of select="/NewsDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
                </li>
                <li>
                  <xsl:value-of select="/NewsDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
                </li>
                <li>
                  <xsl:value-of select="/NewsDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
                </li>
              </ul>
            </button>
          </nav>
          <xsl:if test="count(/NewsDetail/NewsOther)>0">
            <div class="cc-content-newsfade mrt30">
              <h4>
                <xsl:value-of select="/NewsDetail/NewsOtherText"></xsl:value-of>
              </h4>
              <div class="row">
                <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
              </div>
            </div>
          </xsl:if>
        </div>
      </div>
    </section>
    <!--<xsl:if test="count(/NewsDetail/NewsImages)>0">
      <xsl:apply-templates select="/NewsDetail/NewsImages"></xsl:apply-templates>
    </xsl:if>
    <xsl:if test="count(/NewsDetail/NewsAttributes)>0">
      <xsl:apply-templates select="/NewsDetail/NewsAttributes" mode="tabs"></xsl:apply-templates>
      <xsl:apply-templates select="/NewsDetail/NewsAttributes" mode="tabcontent"></xsl:apply-templates>
    </xsl:if>-->
  </xsl:template>
  <xsl:template match="NewsOther">
    <div class="col-md-3">
      <div class="item">
        <figure>
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <div class="desc">
              <h5>
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
                <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
              </h5>
            </div>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>

  <!--<xsl:template match="NewsAttributes" mode="tabs">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:text>#tab</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
    </li>
  </xsl:template>
  <xsl:template match="NewsAttributes" mode="tabcontent">
    <div class="tab-content">
      <xsl:attribute name="id">
        <xsl:text>tab</xsl:text>
        <xsl:value-of select="position()"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
    </div>
  </xsl:template>
  <xsl:template match="NewsImages">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <img width="80" height="71">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </a>
    </li>
  </xsl:template>-->
</xsl:stylesheet>