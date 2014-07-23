<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
    <!ENTITY nbsp   "&#160;">
    <!ENTITY copy   "&#169;">
    <!ENTITY reg    "&#174;">
    <!ENTITY trade  "&#8482;">
    <!ENTITY mdash  "&#8212;">
    <!ENTITY ldquo  "&#8220;">
    <!ENTITY rdquo  "&#8221;"> 
    <!ENTITY pound  "&#163;">
    <!ENTITY yen    "&#165;">
    <!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes"/>
<xsl:template match="system-index-block">
    <xsl:variable name="identifier">
        <xsl:choose>
        <xsl:when test="/system-index-block/calling-page/system-page/name = 'about'">1</xsl:when>
        <xsl:when test="/system-index-block/calling-page/system-page/name = 'departments'">2</xsl:when>
        <xsl:when test="/system-index-block/calling-page/system-page/name = 'students'">3</xsl:when>
        <xsl:when test="/system-index-block/calling-page/system-page/name = 'community'">4</xsl:when>
        <xsl:when test="/system-index-block/calling-page/system-page/name = 'employees'">5</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <ol>
        <xsl:attribute name="id">navLev<xsl:value-of select="$identifier"/></xsl:attribute>
        <xsl:apply-templates select="system-page[display-name != ''] | system-folder[display-name != ''] | system-symlink[display-name != '']">
            <xsl:with-param select="number($identifier*100)" name="identifier"/>
        </xsl:apply-templates>
    </ol>
</xsl:template>
<xsl:template match="system-page">
    <xsl:param name="identifier"/>
    <xsl:variable name="identifier" select="number($identifier*.01)"/>
    <xsl:if test="name != 'index' and name != 'introduction'">
      <li><a><xsl:attribute name="href"><xsl:value-of select="path"/><xsl:if test="ancestor-or-self::system-folder[@reference]">?navRef=<xsl:value-of select="$identifier"/></xsl:if></xsl:attribute><xsl:value-of select="display-name"/></a></li>
    </xsl:if>
  </xsl:template>
  <xsl:template match="system-symlink">
    <xsl:if test="name != 'index' and name != 'introduction'">
      <li><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="display-name"/></a></li>
    </xsl:if>
  </xsl:template>
  <xsl:template match="system-folder">
    <xsl:param name="identifier"/>
    <xsl:variable name="identifier" select="$identifier+position()"/>
    <li><xsl:if test="@reference"><xsl:attribute name="class">isRef</xsl:attribute></xsl:if>
      <xsl:choose>
          <xsl:when test="dynamic-metadata[name='excludeSitemap']/value = 'Exclude'">
          </xsl:when>
          <xsl:otherwise>
          <xsl:if test="system-page[name != 'index' and name != 'introduction'] | system-folder">
          [system-view:external]
      <xsl:comment>#START-CODE<![CDATA[<?php echo '<a href="#]]>#END-CODE</xsl:comment>navLev<xsl:value-of select="$identifier"/><xsl:comment>#START-CODE<![CDATA[a" id="]]>#END-CODE</xsl:comment>navLev<xsl:value-of select="$identifier"/><xsl:comment>#START-CODE<![CDATA[a"  onclick="toggleElementNav(\']]>#END-CODE</xsl:comment>navLev<xsl:value-of select="$identifier"/><xsl:comment>#START-CODE<![CDATA[\')" class="' . (strpos($_SERVER['REQUEST_URI'],']]>#END-CODE</xsl:comment><xsl:value-of select="path"/><xsl:comment>#START-CODE<![CDATA[') !== false ? 'expanded' : 'expand') . '" title="expand '.str_replace("'","","]]>#END-CODE</xsl:comment><xsl:value-of select="display-name"/><xsl:comment>#START-CODE<![CDATA[").' section"><img src="/images/' . (strpos($_SERVER['REQUEST_URI'],']]>#END-CODE</xsl:comment><xsl:value-of select="path"/><xsl:comment>#START-CODE<![CDATA[') !== false ? 'levelCollapse' : 'levelExpand') . '.png" height="14" width="14" alt="expand '.str_replace("'","","]]>#END-CODE</xsl:comment><xsl:value-of select="display-name"/><xsl:comment>#START-CODE<![CDATA[").' section"/></a>'; ?>]]>#END-CODE</xsl:comment>
      [/system-view:external]
      </xsl:if>
      </xsl:otherwise>
      </xsl:choose>
      <a><xsl:attribute name="href"><xsl:value-of select="path"/>/index<xsl:if test="ancestor-or-self::system-folder[@reference]">?navRef=<xsl:value-of select="$identifier"/></xsl:if></xsl:attribute><xsl:value-of select="display-name"/></a>
      <xsl:choose>
          <xsl:when test="dynamic-metadata[name='excludeSitemap']/value = 'Exclude'">
          </xsl:when>
          <xsl:otherwise>
          <xsl:if test="system-page[name != 'index' and name != 'introduction'] | system-folder">
          <ol>
              <xsl:attribute name="id">navLev<xsl:value-of select="$identifier"/></xsl:attribute>
          <xsl:apply-templates select="system-page[display-name != ''] | system-folder[display-name != ''] | system-symlink[display-name != '']"><xsl:with-param select="$identifier*100" name="identifier"/></xsl:apply-templates>
          </ol>
          </xsl:if>
          </xsl:otherwise>
          </xsl:choose>
    </li>
  </xsl:template>
</xsl:stylesheet>
