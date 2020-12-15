<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <ul class="nav navbar-nav">
      <li class="active hidden-xs">
        <a href="/">
          <i class="fa fa-home"></i>
          <span class="sr-only">(current)</span>
        </a>
      </li>
      <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
    </ul>
  </xsl:template>

  <xsl:template match="Zone">
    <li>
      <xsl:choose>
        <xsl:when test="count(Zone)>0">
          <xsl:if test="IsActive='true'">
            <xsl:attribute name="class">
              <xsl:text>dropdown active</xsl:text>
            </xsl:attribute>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="IsActive='true'">
            <xsl:attribute name="class">
              <xsl:text>active</xsl:text>
            </xsl:attribute>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
      <a>
        <xsl:if test="count(Zone)>0">
          <xsl:attribute name="class">
            <xsl:text>dropdown-toggle</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="data-toggle">
            <xsl:text>dropdown</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="role">
            <xsl:text>button</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="aria-expanded">
            <xsl:text>false</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:text> </xsl:text>
        <xsl:if test="count(Zone) > 0">
          <i class="fa fa-plus"></i>
        </xsl:if>
      </a>
      <xsl:if test="count(Zone) > 0">
        <ul class="dropdown-menu" role="menu">
          <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
        </ul>
      </xsl:if>
    </li>
  </xsl:template>
  <xsl:template match="Zone" mode="Child">
    <li>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>