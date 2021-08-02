<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ig="http://ainq.com/ig-definition"
    xmlns="http://ainq.com/ig-definition"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:include href="utility.xslt"/>
    <xsl:param name="org" select="/ig:profile/ig:domain/ig:org"/>
    <!-- Preserve spaces in markdown content elements -->
    <xsl:preserve-space elements="ig:description ig:overview"/>

    <!-- This template is overridden in generate.xsl.  It appears
        here to test JUST the generation of the index file.
    -->
    <xsl:template match="/">
        <xsl:call-template name="index"/>
    </xsl:template>

    <xsl:template name="index" match="/" mode="index">
        <xsl:param name="dest" select="pagecontent/index.md"/>
        <xsl:result-document href="pagecontent/index.md" method="text">
<xsl:apply-templates select="/ig:profile/ig:description"/>

### About This Guide


### Organization of This Guide
This guide is organized into four main sections:

1. Volume I: [Overview](overview.html) - Provides an overview of the challenges this effort is trying to address.
   1. [Technology Environment](technology_environment.html) - Describes the technology environment for uninitiated.
   2. [Architecture](architecture.html) - Illustrates the Microservice Architecture
   3. [Security Considerations](security_considerations.html) - Documents security concerns and mitigations
   4. [Use Cases](use_cases.html) - Illustrates key use cases
   5. [Actors](actors.html) - Provides an overview of technical components
<xsl:if test="/ig:profile/ig:transaction">
2. Volume II: [Transactions](transactions.html)
<xsl:for-each select="/ig:profile/ig:transaction">
    <xsl:text>   </xsl:text><xsl:value-of select='position()'/><xsl:text>. [</xsl:text>
    <xsl:value-of select="ig:name"/>
    <xsl:text> ](transaction-</xsl:text>
    <xsl:value-of select="@id"/>
    <xsl:text>.html)&#xA;</xsl:text>
</xsl:for-each>
</xsl:if>
<xsl:if test="/ig:profile/ig:transaction">
3. Volume III: Content Profiles
<xsl:for-each select="/ig:profile/ig:content">
    <xsl:text>   </xsl:text><xsl:value-of select="position()"/>. [<xsl:value-of select="ig:name"/>](StructureDefinition-<xsl:value-of select="lower-case(/ig:profile/@id)"/>-<xsl:value-of select="@id"/>.html)
</xsl:for-each>
4. Volume IV: Terminology
<xsl:for-each select="tokenize(/ig:profile/@codingsystems, ' ')">
    <xsl:text>   </xsl:text><xsl:value-of select="position()"/>. [<xsl:value-of select="."/> Coding System](CodeSystem-<xsl:value-of select="."/>.html)
</xsl:for-each>
<xsl:variable name='count' select="count(tokenize(/ig:profile/@valuesets, ' '))"/>
<xsl:for-each select="tokenize(/ig:profile/@valuesets, ' ')">
    <xsl:text>   </xsl:text><xsl:value-of select="position()+$count"/>. [<xsl:value-of select="."/> Value Set](ValueSet-<xsl:value-of select="."/>.html)
</xsl:for-each>

&#xA;
</xsl:if>
Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github.com/HL7/fhir-registry-protocols-ig](https://github.com/HL7/fhir-registry-protocols-ig).


        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>