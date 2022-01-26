<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ig="http://ainq.com/ig-definition"
    exclude-result-prefixes="xs ig"
    version="2.0">

    <!-- Arrows -->
    <xsl:variable name="larr" select="'&#x2190;'"/>
    <xsl:variable name="uarr" select="'&#x2191;'"/>
    <xsl:variable name="rarr" select="'&#x2192;'"/>
    <xsl:variable name="darr" select="'&#x2193;'"/>
    <xsl:variable name="lrarr" select="'&#x2194;'"/>
    <xsl:variable name="udarr" select="'&#x2195;'"/>

    <xsl:output name='textoutput' method='text' encoding='UTF-8'/>

    <!-- Copy the content of ig:description or ig:overview if it does
        not have the file attribute.  Otherwise copy from the specified
        file.
    -->
    <xsl:template match="ig:description|ig:overview">
        <xsl:param name="indent"></xsl:param>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="$indent"/>
        <xsl:variable name='content'>
	        <xsl:choose>
	            <xsl:when test="@file">
	                <xsl:value-of select="translate(unparsed-text(resolve-uri(@file, base-uri())),'&#xD;','')"/>
	            </xsl:when>
	            <xsl:otherwise>
	                <xsl:apply-templates select="node()" mode='desc'/>
	            </xsl:otherwise>
	        </xsl:choose>
        </xsl:variable>
        <xsl:for-each select='tokenize($content, "&#xA;")'>
            <xsl:if test='starts-with(., " ") and matches(normalize-space(.),"^ +[\-\*1-9]")'><xsl:text>    </xsl:text></xsl:if>
            <xsl:value-of select='normalize-space(.)'/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="ig:ref" mode='desc'>
        <xsl:variable name='artifact' select='//ig:*[@id=current()/(@ref|@actor|@option|@tx)]'/>
        <xsl:text>[</xsl:text><xsl:value-of select="$artifact/ig:name"/>
        <xsl:text>](</xsl:text><xsl:value-of select='local-name($artifact)'/><xsl:text>s.html#</xsl:text>
        <xsl:value-of select="lower-case(translate($artifact/ig:name,' ','-'))"/>
        <xsl:text>)</xsl:text>
    </xsl:template>

    <xsl:template name="list-items">
        <xsl:param name="title"/>
        <xsl:param name="items" select="string(.)"/>
        <xsl:variable name="list" select="//*[@id=$items]"/>
        <xsl:if test="$list">
            <xsl:if test="$title">
                <xsl:text>&#xA;* </xsl:text>
                <xsl:value-of select="$title"/>
                <xsl:text>&#xA;</xsl:text>
            </xsl:if>
            <xsl:for-each select="$list">
                <xsl:text>&#xA;  - [</xsl:text>
                <xsl:value-of select="ig:name"/>
                <xsl:text>](</xsl:text>
                <xsl:call-template name='toFilename'>
                    <xsl:with-param name="item" select="."/>
                    <xsl:with-param name="index" select="position()"/>
                </xsl:call-template>
                <xsl:text>)&#xA;</xsl:text>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template name="toFilename">
        <xsl:param name="name"/>
        <xsl:param name="item"/>
        <xsl:param name="index"/>
        <xsl:choose>
            <xsl:when test="$name">
                <xsl:value-of select="translate($name,' &#x9;&#xA;\/','')"/>
                <xsl:text>.html</xsl:text>
            </xsl:when>
            <xsl:when test="$item and local-name($item) = 'actor'">
                <xsl:text>actors.html#</xsl:text>
                <xsl:value-of select="lower-case(translate($item/ig:name,' ','-'))"/>
            </xsl:when>
            <xsl:when test="$item and local-name($item) = 'transaction'">
                <xsl:text>transaction-</xsl:text>
                <xsl:value-of select="@id"/>
                <xsl:text>.html</xsl:text>
            </xsl:when>
            <xsl:when test="$item and local-name($item) = 'content'">
                <xsl:text>StructureDefinition-</xsl:text>
                <xsl:value-of select="translate($item/@id,' ','-')"/>
                <xsl:text>.html</xsl:text>
            </xsl:when>
            <xsl:when test="not($item)">
                <xsl:value-of select="local-name($item)"/>
                <xsl:text>-</xsl:text>
                <xsl:value-of select="@id"/>
                <xsl:text>.html</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name='figureLink'>
        <xsl:param name="name"/>
        <xsl:param name="file"/>
        <xsl:param name="number"/>
        <xsl:variable name="title">
            <xsl:text>Figure </xsl:text>
            <xsl:value-of select="$number"/><xsl:text>: </xsl:text>
            <xsl:value-of select="$name"/>
        </xsl:variable>
        <xsl:text>&#xa;&lt;figure>&#xa;</xsl:text>
        <xsl:text>{% include </xsl:text><xsl:value-of select='$file'/><xsl:text>%}&#xa;</xsl:text>
        <xsl:text>&lt;figcaption>Figure </xsl:text><xsl:value-of select='$number'/><xsl:text>: </xsl:text><xsl:value-of select='$name'/><xsl:text> &lt;/figcaption>&#xa;</xsl:text>
        <xsl:text>&lt;/figure>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match='*' mode='copy-as-text'>
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:apply-templates select='@*' mode='copy-as-text'/>
        <xsl:text>&gt;</xsl:text>
        <xsl:apply-templates select='text()|*' mode='copy-as-text'/>
        <xsl:text>&lt;/</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&gt;</xsl:text>
    </xsl:template>

    <xsl:template match='text()' mode='copy-as-text'>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match='@*' mode='copy-as-text'>
        <xsl:text> </xsl:text>
        <xsl:value-of select='local-name()'/>
        <xsl:text>='</xsl:text>
        <xsl:value-of select='.'/>
        <xsl:text>' </xsl:text>
    </xsl:template>
    <xsl:template name="result-header-comment">
        <xsl:param name="source"/>
        <xsl:param name="by">actorsandtransactions.xslt</xsl:param>
        <xsl:param name="format">xml</xsl:param>
        <xsl:choose>
            <xsl:when test="$format = 'xml'"><xsl:text disable-output-escaping="yes">&lt;</xsl:text>!--&#xa;</xsl:when>
            <xsl:when test="$format = 'md'"><xsl:text disable-output-escaping="yes">&lt;</xsl:text>!--&#xa;</xsl:when>
            <xsl:when test="$format = 'fsh'"><xsl:text>/*&#xa;</xsl:text></xsl:when>
            <xsl:when test="$format = 'plantuml'"><xsl:text>/'&#xa;</xsl:text></xsl:when>
            <xsl:when test="$format = 'gherkin'"># </xsl:when>
        </xsl:choose>
        <xsl:text>    This content is automatically generated from </xsl:text><xsl:value-of select='/*/@id'/><xsl:text>.xml by </xsl:text><xsl:value-of select='$by'/><xsl:text>&#xa;</xsl:text>
        <xsl:choose>
            <xsl:when test="$format = 'xml'">--<xsl:text disable-output-escaping="yes">&gt;&#xa;</xsl:text></xsl:when>
            <xsl:when test="$format = 'fsh'"><xsl:text>*/&#xa;</xsl:text></xsl:when>
            <xsl:when test="$format = 'md'">--<xsl:text disable-output-escaping="yes">&gt;&#xa;</xsl:text></xsl:when>
            <xsl:when test="$format = 'plantuml'"><xsl:text>'/&#xa;</xsl:text></xsl:when>
            <xsl:when test="$format = 'gherkin'"></xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>