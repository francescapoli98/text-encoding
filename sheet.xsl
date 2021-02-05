<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.w3.org/1999/xhtml" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <!--Progetto per l'esame di Codifica di Testi, aa 2019/20
    Codifica di cartoline storiche della Grande Guerra
    A cura di: Francesca Poli, mat. 560190-->

<!--SERIE DI TEMPLATES-->
    <xsl:template match="/">
        <html lang="ita">
            <head>
                <title>
                    <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>

                <xsl:element name="meta">
                    <xsl:attribute name="name">author</xsl:attribute>
                    <xsl:attribute name="content">  <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt[1]/tei:persName"/>   </xsl:attribute>
                </xsl:element>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
                <script src="https://rawgit.com/kemayo/maphilight/master/jquery.maphilight.min.js" type="text/javascript"></script>
				<link rel="stylesheet" href="styling.css"/>
                <link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet'/>
                <script src="functions.js"/>
            </head>

            <body>
                <header>
                    <xsl:comment>
                        Progetto per l'esame di Codifica di Testi, aa 2019/20
                        Codifica di cartoline storiche della Grande Guerra
                        A cura di: Francesca Poli, mat. 560190
                    </xsl:comment>
                    <h1>    <xsl:value-of select="//tei:titleStmt/tei:title"/>   </h1>
                    <xsl:element name="h4">
                        Cartoline da <xsl:value-of select="//tei:sourceDesc/tei:listPerson/tei:person[@role='sender']/tei:persName"/> a <xsl:value-of select="//tei:sourceDesc/tei:listPerson/tei:person[@role='addressee']/tei:persName"/>
                    </xsl:element>
                    <h4>    <xsl:value-of select="//tei:titleStmt/tei:respStmt"/>    </h4>
                </header>

               

                <xsl:element name="div">
                    <xsl:attribute name="class">cartolina</xsl:attribute>
                    <xsl:attribute name="id"> <xsl:value-of select="/tei:TEI/tei:TEI[1]/@xml:id"/> </xsl:attribute>
                    <xsl:element name="h2">
                        <xsl:attribute name="class">nomecart</xsl:attribute>
                        <xsl:value-of select="/tei:TEI/tei:TEI[@xml:id='c105']/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </xsl:element>
                    <xsl:apply-templates select="/tei:TEI/tei:TEI[1]"/>
                    
                    
                    
                </xsl:element>

                <xsl:element name="div">
                    <xsl:attribute name="class">cartolina</xsl:attribute>
                    <xsl:attribute name="id"><xsl:value-of select="/tei:TEI/tei:TEI[2]/@xml:id"/></xsl:attribute>
                    <xsl:element name="h1">
                        <xsl:attribute name="class">nomecart</xsl:attribute>
                        <xsl:value-of select="/tei:TEI/tei:TEI[@xml:id='c192']/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </xsl:element>
    
                    <xsl:apply-templates select="/tei:TEI/tei:TEI[2]"/>
                    
                </xsl:element>

                <footer>
                 <div class="info" style="float: right; text-align: right; width: 40%">
                        <!--lista responsabili-->
                        <h4>Responsabili progetto:</h4>
                        <xsl:for-each select="tei:TEI/tei:teiHeader[1]/tei:fileDesc[1]/tei:editionStmt[1]//tei:respStmt/tei:resp">
                            <p> <strong><xsl:value-of select="../tei:resp"/>:</strong> <xsl:value-of select="../tei:name"/> </p>
                        </xsl:for-each>
                    </div>
                    <div class="info" style="float: left; text-align: left; width: 60%;">
                        <h4>Dati editoriali:</h4>
                        <!--edizione a cura di...-->
                        <xsl:element name="p">
                            <strong>Edizione a cura di: </strong>
                            <xsl:value-of select="//tei:fileDesc/tei:editionStmt//tei:edition"/>.
                        </xsl:element>
                        <!--luogo di pubblicazione-->
                        <xsl:element name="p">
                            <strong>Pubblicato presso: </strong>
                            <xsl:value-of select="tei:TEI//tei:fileDesc/tei:publicationStmt/tei:publisher"/>
                            <xsl:value-of select="tei:TEI//tei:fileDesc/tei:publicationStmt/tei:distributor"/>
                        </xsl:element>
                        <xsl:element name="p">
                            <strong><xsl:value-of select="tei:TEI//tei:sourceDesc/tei:bibl/tei:respStmt[1]/tei:resp"/></strong>
                            <xsl:value-of select="tei:TEI//tei:sourceDesc/tei:bibl/tei:respStmt[1]/tei:name"/>
                        </xsl:element>
                        <xsl:element name="p">
                            <xsl:value-of select="tei:TEI//tei:sourceDesc/tei:bibl/tei:respStmt[2]/tei:resp"/>
                            <xsl:value-of select="tei:TEI//tei:sourceDesc/tei:bibl/tei:respStmt[2]/tei:name"/>
                        </xsl:element>
                    </div>
                
                </footer>
            </body>
        </html>
    </xsl:template>


    <!--CARTOLINE-->
    <xsl:template match="/tei:TEI/tei:TEI">
        <div class="desc">
            <xsl:element name="h4">
                <xsl:choose>
                    <xsl:when test="./@xml:id='c105'">
                        <xsl:value-of select="./tei:text[@xml:id='nostalgia']//tei:opener/tei:dateline"/>
                    </xsl:when>
                    <xsl:otherwise>
                       - <xsl:value-of select="./tei:text[@xml:id='pensiero']//tei:opener/tei:dateline"/> -
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
    
            <xsl:choose>
                <xsl:when test="./@xml:id='c105'">
    
                    <button id="moreon105" onclick="gestoreClick(event)"> alcune informazioni aggiuntive </button>

                     <xsl:element name="div">
                        <xsl:attribute name="id">text_moreon105</xsl:attribute>
                        <xsl:attribute name="class"> comparsa is-hidden </xsl:attribute>
                            <p>
                                <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msContents/tei:summary"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msContents/tei:textLang"/>
                            </p>
                            <p>
                                <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:material"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:height"/>x<xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:width"/>
                            </p>
                            <p>
                                <xsl:value-of select=".//tei:notesStmt//tei:note"/>
                            </p>
                            <p>
                                <strong>Conservazione: </strong> <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:country"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:settlement"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:repository"/>
                            </p>
                            <p> 
                                <strong>Numero identificativo per l'archivio: </strong> <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:idno"/> 
                            </p>
                            <strong>Persone:</strong>
                            <xsl:for-each select=".//tei:listPerson/tei:person">
                                <h5><xsl:value-of select="./tei:persName"/></h5>
                                <p>Sesso: <xsl:value-of select="./tei:sex"/></p>
                                <p>Nazionalità: <xsl:value-of select="./tei:nationality"/></p>
                                <xsl:if test="./tei:langKnowledge">
                                    <p>Lingua: <xsl:value-of select="./tei:langKnowledge"/></p>
                                </xsl:if>
                                <xsl:if test="./tei:occupation">
                                    <p>Professione: <xsl:value-of select="./tei:occupation"/></p>
                                </xsl:if>
                            </xsl:for-each>
                    </xsl:element> 

                </xsl:when>
                <xsl:otherwise>

                    <button id="moreon192" onclick="gestoreClick(event)"> alcune informazioni aggiuntive </button>
                    
                    <xsl:element name="div">
                        <xsl:attribute name="id">text_moreon192</xsl:attribute>
                        <xsl:attribute name="class"> comparsa is-hidden</xsl:attribute>
                            <p>
                                <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msContents/tei:summary"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msContents/tei:textLang"/>
                            </p>
                            <p>
                                <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:material"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:height"/>x<xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:width"/>
                            </p>
                            <p>
                                <xsl:value-of select=".//tei:notesStmt//tei:note"/>
                            </p>
                            <p>
                                <strong>Conservazione: </strong> <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:country"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:settlement"/>, <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:repository"/>
                            </p>
                            <p> 
                                <strong>Numero identificativo per l'archivio: </strong> <xsl:value-of select=".//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:idno"/> 
                            </p>
                            <strong>Persone:</strong>
                            <xsl:for-each select=".//tei:listPerson/tei:person">
                                <h5><xsl:value-of select="./tei:persName"/></h5>
                                <p>Sesso: <xsl:value-of select="./tei:sex"/></p>
                                <p>Nazionalità: <xsl:value-of select="./tei:nationality"/></p>
                                <xsl:if test="./tei:langKnowledge">
                                    <p>Lingua: <xsl:value-of select="./tei:langKnowledge"/></p>
                                </xsl:if>
                                <xsl:if test="./tei:occupation">
                                    <p>Professione: <xsl:value-of select="./tei:occupation"/></p>
                                </xsl:if>
                            </xsl:for-each>
                    </xsl:element> 
            
                </xsl:otherwise>
            </xsl:choose>
            
        </div>

<!--DIV contenente le cartoline e lo spazio per gli elementi stampati a comparsa (js)-->
        <div class="wrapper">
           <div class="images">
                <xsl:apply-templates select="tei:facsimile"/>
            </div>
            <div class="elements">
             <h3 class="el">Elementi stampati</h3>
             <h6 class="el">clicca su un'area della cartolina</h6>
                <xsl:choose>
                    <xsl:when test="./@xml:id='c105'">
                        <xsl:apply-templates select="//tei:text[@xml:id='descdisegno']"/>
                        <xsl:apply-templates select="//tei:text[@xml:id='timbri']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="//tei:text[@xml:id='piazza']"/>
                        <xsl:apply-templates select="//tei:text[@xml:id='posta']"/>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            
        </div>
<!--DIV con i testi-->
        <div class="wrapper">
            <div class="text1">
                <h4>Descrizione del fronte:</h4>
                <xsl:apply-templates select="./tei:teiHeader//tei:sourceDesc/tei:bibl"/>
            </div>
            <div class="text2">
                <xsl:choose>
                    <xsl:when test="./@xml:id='c105'">
                        <xsl:apply-templates select="./tei:text[@xml:id='nostalgia']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="./tei:text[@xml:id='pensiero']"/>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <div class="text3">
                <xsl:choose>
                    <xsl:when test="./@xml:id='c105'">
                        <xsl:apply-templates select="./tei:text[@xml:id='address105']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="./tei:text[@xml:id='address192']"/>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>

    </xsl:template>

        <!--TEMPLATE FACSIMILE (img + mappa)-->
    <xsl:template match="tei:facsimile">
        <xsl:choose>
            <xsl:when test="../@xml:id='c105'">
                <div class="facsfronte facsimile">
                    <h6>Fronte</h6>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:surface[@xml:id='c105_fronte']/tei:graphic/@url"/>
                            </xsl:attribute>
                            <xsl:attribute name="usemap">
                                <xsl:value-of select="concat('#',tei:surface[1]/@xml:id)"/>
                            </xsl:attribute>
                            <xsl:attribute name="id">fronte105</xsl:attribute>
                            <xsl:attribute name="class">map</xsl:attribute>
                        </xsl:element>

                        <xsl:element name="map">
                            <xsl:attribute name="name">
                                <xsl:value-of select="tei:surface[1]/@xml:id"/>
                            </xsl:attribute>
                        <xsl:for-each select="tei:surface[1]//tei:zone">
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                        </xsl:element>
                </div>

                <div class="facsretro facsimile">
                    <h5>Retro</h5>
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                               <xsl:value-of select="tei:surface[@xml:id='c105_retro']/tei:graphic/@url"/>
                           </xsl:attribute>
                            <xsl:attribute name="usemap">
                                <xsl:value-of select="concat('#',tei:surface[2]/@xml:id)"/>
                            </xsl:attribute>
                        <xsl:attribute name="id">retro105</xsl:attribute>
                        <xsl:attribute name="class">map</xsl:attribute>

                    </xsl:element>

                        <xsl:element name="map">
                            <xsl:attribute name="name">
                                <xsl:value-of select="tei:surface[2]/@xml:id"/>
                            </xsl:attribute>
                            <xsl:for-each select="tei:surface[2]//tei:zone">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:element>



                </div>
            </xsl:when>

            <xsl:when test="../@xml:id='c192'">
                <div class="facsfronte facsimile">
                    <h5>Fronte</h5>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:surface[@xml:id='c192_fronte']/tei:graphic/@url"/>
                            </xsl:attribute>
                            <xsl:attribute name="usemap">
                                <xsl:value-of select="concat('#',tei:surface[1]/@xml:id)"/>
                            </xsl:attribute>
                            <xsl:attribute name="id">fronte192</xsl:attribute>
                            <xsl:attribute name="class">map</xsl:attribute>

                        </xsl:element>

                    <xsl:element name="map">
                        <xsl:attribute name="name">
                            <xsl:value-of select="tei:surface[1]/@xml:id"/>
                        </xsl:attribute>
                        <xsl:for-each select="tei:surface[@xml:id='c192_fronte']//tei:zone">
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                    </xsl:element>

                </div>

                <div class="facsretro facsimile">
                    <h5>Retro</h5>
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="tei:surface[@xml:id='c192_retro']/tei:graphic/@url"/>
                        </xsl:attribute>

                        <xsl:attribute name="usemap">
                            <xsl:value-of select="concat('#',tei:surface[2]/@xml:id)"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">retro192</xsl:attribute>
                        <xsl:attribute name="class">map</xsl:attribute>

                    </xsl:element>

                    <xsl:element name="map">
                        <xsl:attribute name="name">
                            <xsl:value-of select="tei:surface[2]/@xml:id"/>
                        </xsl:attribute>
                        <xsl:for-each select="tei:surface[@xml:id='c192_retro']//tei:zone">
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                    </xsl:element>

                </div>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

<!--Template per le aree della mappa-->
   <xsl:template match="tei:zone">
        <xsl:element name="area">
            <xsl:attribute name="id">
                <xsl:value-of select="./@xml:id"/>
            </xsl:attribute>

            <xsl:attribute name="class">
                <xsl:if test="../@xml:id='c105_fronte'">
                    area1
                </xsl:if>
                <xsl:if test="../@xml:id='c105_retro'">
                    area2
                </xsl:if>
                <xsl:if test="../@xml:id='c192_fronte'">
                    area3
                </xsl:if>
                <xsl:if test="../@xml:id='c192_retro'">
                    area4
                </xsl:if>
            </xsl:attribute>
       
            <xsl:attribute name="shape">rect</xsl:attribute>
            <xsl:attribute name="coords">
                <xsl:value-of select="./@ulx"/>,  <xsl:value-of select="./@uly"/>,  <xsl:value-of select="./@lrx"/>,  <xsl:value-of select="./@lry"/>
            </xsl:attribute>
            <xsl:if test="(./@xml:id ='quadro') or (./@xml:id ='didascalia') or (./@xml:id ='carte') or (./@xml:id ='stamps192') or (./@xml:id ='ns192') or (./@xml:id ='ns105') or (./@xml:id ='diritti192') or (./@xml:id ='diritti105') or (./@xml:id ='Schenone') or (./@xml:id ='artista') or (./@xml:id ='disegno') or (./@xml:id ='stamps105')">
                <xsl:attribute name='onclick'>
                    gestoreClick(event)
                </xsl:attribute>
            </xsl:if>
            
        </xsl:element>
       
    </xsl:template>


    <!--Template per la trascrizione di testi-->
    <xsl:template match="tei:text">
        <xsl:choose>
            <xsl:when test="./@xml:id='nostalgia'">
                <xsl:element name="p">
                    <xsl:attribute name="id">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(//tei:opener/tei:dateline/@facs, '#')"/>
                    </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>

                    <xsl:attribute name="class"> transcription </xsl:attribute>
                    <xsl:value-of select="//tei:opener/tei:dateline"/>
                </xsl:element>

                <xsl:for-each select="//tei:p/tei:s">
                    <xsl:element name="p">
                    <xsl:attribute name="id">
                       <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(./tei:lb/@facs, '#')"/>
                    </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription </xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:element name="p">
                    <xsl:attribute name="id">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(//tei:closer/tei:signed/@facs, '#')"/>
                    </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription </xsl:attribute>
                    <xsl:value-of select="//tei:closer/tei:signed"/>
                </xsl:element>
            </xsl:when>

            <xsl:when test="./@xml:id='address105'">
                <xsl:apply-templates/>
            </xsl:when>

            <xsl:when test="./@xml:id='pensiero'">
                <xsl:element name="p">
                    <xsl:attribute name="id">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(.//tei:opener/tei:dateline/@facs, '#')"/>
                    </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription </xsl:attribute>
                    <xsl:value-of select=".//tei:opener/tei:dateline"/>
                </xsl:element>

                <xsl:element name="p">
                    <xsl:attribute name="id">
                     <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(//tei:div[@facs='#dolce']/@facs, '#')"/>
                    </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription </xsl:attribute>
                    <xsl:value-of select="//tei:div[@facs='#dolce']/tei:p"/>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="id">
                     <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(//tei:closer/tei:salute/@facs, '#')"/>
                    </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription </xsl:attribute>
                    <xsl:value-of select="//tei:closer/tei:salute"/>
                </xsl:element>
                <xsl:element name="p">
                 <xsl:attribute name="id">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(.//tei:closer/tei:signed/@facs, '#')"/>
                    </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription </xsl:attribute>
                    <xsl:value-of select=".//tei:closer/tei:signed"/>
                </xsl:element>
            </xsl:when>

            <xsl:when test="./@xml:id='address192'">
                <xsl:apply-templates/>
            </xsl:when>
        <!--Templates per elementi stampati a comparsa-->
            <xsl:when test="./@xml:id='descdisegno'">
                <xsl:element name="p">
                    <xsl:attribute name="id">
                        <xsl:variable name="facs">
                            <xsl:value-of select="substring-after(./tei:body/tei:div/@facs, '#')"/>
                        </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                      <xsl:value-of select=".//tei:figure/tei:figDesc"/>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="id">
                        <xsl:variable name="facs">
                            <xsl:value-of select="substring-after(./tei:body/tei:div/tei:p/@facs, '#')"/>
                        </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                      Firma dell'autore del disegno, <xsl:value-of select=".//tei:p"/>
                </xsl:element>
            </xsl:when>

            <xsl:when test="./@xml:id='timbri'">
                <xsl:element name="div">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(./tei:body/tei:div/@facs, '#')"/>
                    </xsl:variable>
                    <xsl:attribute name="id">
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                        <xsl:for-each select=".//tei:div/tei:div[1]/tei:p/tei:stamp[@type='postmark']/tei:stamp">
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                    <p><xsl:value-of select=".//tei:div/tei:div[2]/tei:p"/></p>
                </xsl:element>

                <xsl:element name="p">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(./tei:body/tei:div[@facs='#ns105']/@facs, '#')"/>
                    </xsl:variable>
                    <xsl:attribute name="id">
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                        <xsl:value-of select="./tei:body/tei:div[@facs='#ns105']/tei:p"/>
                </xsl:element>

                <xsl:element name="p">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(./tei:body/tei:div[@facs='#diritti105']/@facs, '#')"/>
                    </xsl:variable>
                    <xsl:attribute name="id">
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                        <xsl:value-of select="./tei:body/tei:div[@facs='#diritti105']/tei:p"/>
                </xsl:element>
            </xsl:when>

            <xsl:when test="./@xml:id='piazza'">
                <xsl:element name="p">
                    <xsl:attribute name="id">
                        <xsl:variable name="facs">
                            <xsl:value-of select="substring-after(./tei:body/tei:div/@facs, '#')"/>
                        </xsl:variable>
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                    <xsl:value-of select=".//tei:figure//tei:desc"/>
                </xsl:element>
                 <xsl:element name="p">
                    <xsl:variable name="facs">
                        <xsl:value-of select="substring-after(./tei:body/tei:div[@facs='#didascalia']/@facs, '#')"/>
                    </xsl:variable>
                    <xsl:attribute name="id">
                        <xsl:value-of select="concat('text_', $facs)"/>
                    </xsl:attribute>
                     <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                   La didascalia riporta: "<xsl:value-of select=".//tei:head"/>"
                </xsl:element>
        
            </xsl:when>
            <xsl:when test="./@xml:id='posta'">
                <xsl:for-each select="./tei:body/tei:div">
                    <xsl:element name="div">
                        <xsl:attribute name="id">
                            <xsl:variable name="facs">
                                <xsl:value-of select="substring-after(./@facs, '#')"/>
                            </xsl:variable>
                            <xsl:value-of select="concat('text_', $facs)"/>
                        </xsl:attribute>
                         <xsl:attribute name="class"> transcription is-hidden</xsl:attribute>
                        <xsl:for-each select="./tei:p"/>
                        <xsl:element name="p">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>

        </xsl:choose>
    </xsl:template>

<!--ALTRI TEMPLATES VARI-->
    <xsl:template match="tei:bibl">
        <xsl:element name="p">
            <xsl:value-of select="./tei:title"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="./tei:author"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="./tei:date"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:addrLine">
        <xsl:for-each select=".">
            <xsl:element name="p">
           <xsl:attribute name="id">
                <xsl:variable name="facs">
                <xsl:value-of select="substring-after(./@facs, '#')"/>
                </xsl:variable>
                <xsl:value-of select="concat('text_', $facs)"/>
            </xsl:attribute> 
             <xsl:attribute name="class"> transcription </xsl:attribute>
            <xsl:apply-templates /> 
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

     <xsl:template match="tei:street">
        <xsl:element name="p">
           <xsl:attribute name="id">
                <xsl:variable name="facs">
                <xsl:value-of select="substring-after(./@facs, '#')"/>
                </xsl:variable>
                <xsl:value-of select="concat('text_', $facs)"/>
            </xsl:attribute> 
             <xsl:attribute name="class"> transcription </xsl:attribute>
            <xsl:apply-templates /> 
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:c">
        <xsl:value-of select="./@corresp"/>
        <span style="color:darkred;"> [orig.: <xsl:value-of select="."/>] </span>
    </xsl:template>

    <xsl:template match="tei:choice">
       <xsl:value-of select="./tei:orig"/>
        <span style="color:darkred;"> [interpret.: <xsl:value-of select="./tei:corr"/>] </span>
    </xsl:template>

   
</xsl:stylesheet>