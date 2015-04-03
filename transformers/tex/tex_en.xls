<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
/**
 * @author Marcio Ribeiro (mribeiro (a) gmail com)
 * @created 2004-02-17
 * @version $Id: cvTexEn.xsl,v 1.1 2006/10/17 01:44:03 mmr Exp $
 */
-->
<xsl:transform version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mmr="http://cv.b1n.org">

<xsl:output method="text" encoding="ISO-8859-1" indent="no" />
<xsl:strip-space elements="*" />

<!-- Functions -->
<xsl:template name="formatDate" match="/">
    <xsl:param name="date" />
    <xsl:param name="format" />

    <xsl:if test="$date">
        <xsl:variable name="year"  select="substring($date, 1, 4)" />
        <xsl:variable name="month" select="substring($date, 6, 2)" />
        <xsl:variable name="day"   select="substring($date, 9, 2)" />
        <xsl:choose>
<!--
            <xsl:when test="$format = 'birthday'">
                <xsl:value-of select="concat($day, '.', $month, '.', $year)" />
            </xsl:when>
-->
            <xsl:when test="$format = 'school'">
                <xsl:value-of select="$year" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$month = 1">
                        <xsl:text>January</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 2">
                        <xsl:text>February</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 3">
                        <xsl:text>March</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 4">
                        <xsl:text>April</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 5">
                        <xsl:text>May</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 6">
                        <xsl:text>June</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 7">
                        <xsl:text>July</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 8">
                        <xsl:text>August</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 9">
                        <xsl:text>September</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 10">
                        <xsl:text>October</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 11">
                        <xsl:text>November</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month = 12">
                        <xsl:text>December</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$format = 'birthday'">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="$day" />

                        <!-- TODO (mmr) st, nd, th, etc should be calculated -->
                        <xsl:text>th of </xsl:text>
                        <xsl:value-of select="$year" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$year" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:if>
    <xsl:if test="$date = ''">
        <xsl:text>Present</xsl:text>    
    </xsl:if>
</xsl:template>

<!-- Personal Data -->
<xsl:template match="mmr:cv/mmr:personalData">
    \ecvlastname{<xsl:value-of select="mmr:lastName" />}
    \ecvfirstname{<xsl:value-of select="mmr:firstName" />}
    \ecvaddress{<xsl:value-of select="mmr:address" />}
    \ecvtelephone{
    <xsl:for-each select="mmr:phones/mmr:phone">
        <xsl:value-of select="." />
        <xsl:if test="position() &lt; last()"><xsl:text> / </xsl:text></xsl:if>
    </xsl:for-each>
    }
    \ecvemail{\href{mailto:<xsl:value-of select="mmr:email" />}{<xsl:value-of select="mmr:email" />}}
    <!--\ecvdateofbirth{<xsl:value-of select="mmr:birthday" />}-->
    \ecvdateofbirth{<xsl:call-template name="formatDate"><xsl:with-param name="format" select="'birthday'" /><xsl:with-param name="date" select="mmr:birthday" /></xsl:call-template>}
    \ecvcivilstate{<xsl:value-of select="mmr:civilState" />}
</xsl:template>

<!-- Professional Summary -->
<xsl:template match="mmr:cv/mmr:professionalSummary">
    <xsl:for-each select="mmr:company">
        \ecvitem*{Period}{\it <xsl:call-template name="formatDate"><xsl:with-param name="format" select="'work'" /><xsl:with-param name="date" select="mmr:dateIn" /></xsl:call-template> - <xsl:call-template name="formatDate"> <xsl:with-param name="format" select="'work'" /><xsl:with-param name="date" select="mmr:dateOut" /></xsl:call-template>}
         \ecvitem*{Company}{<xsl:value-of select="mmr:name" />}
         \ecvitem*{Position}{<xsl:value-of select="mmr:position" />}
         \ecvitem*[10pt]{Activities}{
             \begin{mmrList}
             <xsl:for-each select="mmr:activities/mmr:item">
                 \mmrItem{<xsl:value-of select="." />}
             </xsl:for-each>
             \end{mmrList}
         }
    </xsl:for-each>
</xsl:template>

<!-- School Summary -->
<xsl:template match="mmr:cv/mmr:schoolSummary">
    <xsl:for-each select="mmr:school">
        \ecvitem*{Institute}{<xsl:value-of select="mmr:name" />}
        \ecvitem*[10pt]{Course}{<xsl:value-of select="mmr:course" /> (<xsl:call-template name="formatDate"><xsl:with-param name="format" select="'school'" /><xsl:with-param name="date" select="mmr:dateOut" /></xsl:call-template>)}
    </xsl:for-each>
</xsl:template>

<!-- Languages -->
<xsl:template match="mmr:cv/mmr:languages">
    <xsl:for-each select="mmr:language">
        \ecvitem*{<xsl:value-of select="mmr:name" />}{<xsl:value-of select="mmr:level" />}
    </xsl:for-each>
</xsl:template>

<!-- Qualifications -->
<xsl:template match="mmr:cv/mmr:qualifications">
    <xsl:for-each select="mmr:qualification">
        \ecvitem*{<xsl:value-of select="@name" />}{
        \begin{mmrList}
        <xsl:for-each select="mmr:item">
            \mmrItem{<xsl:value-of select="." />}
        </xsl:for-each>
        \end{mmrList}
        }
    </xsl:for-each>
</xsl:template>

<!-- Certifications -->
<xsl:template match="mmr:cv/mmr:certifications">
    \ecvsection{Certifications}
    \ecvitem{}{
    \begin{mmrList}
    <xsl:for-each select="mmr:certification">
        \mmrItem{<xsl:value-of select="." />}
    </xsl:for-each>
    \end{mmrList}
    }
</xsl:template>

<!-- Misc -->
<xsl:template match="mmr:cv/mmr:misc">
    \ecvsection{Miscelania}
    \ecvitem{}{
    \begin{mmrList}
    <xsl:for-each select="mmr:item">
        \mmrItem{<xsl:value-of select="." />}
    </xsl:for-each>
    \end{mmrList}
    }
</xsl:template>

<!-- Cv -->
<xsl:template match="/">
    \documentclass[helvetica,noflag,english,narrow,openbib]{europecv}
    \usepackage[T1]{fontenc}
    \usepackage{ifpdf}
    \usepackage{bibentry}
    \usepackage[english]{babel}
    \usepackage[latin1]{inputenc}
    \usepackage[
      a4paper,
      tmargin=1in,
      bmargin=1in,
      lmargin=1in,
      rmargin=1in,
      headheight=0in,
      headsep=0in
    ]{geometry}
    \usepackage[
      a4paper=true,
      pdftitle=Marcio Ribeiro Curriculum Vitae,
      pdfsubject=Marcio Ribeiro Curriculum Vitae,
      pdfauthor=<xsl:value-of select="concat(mmr:cv/mmr:personalData/mmr:firstName, ' ', mmr:cv/mmr:personalData/mmr:lastName)" />
      pdfcreator=<xsl:value-of select="concat(mmr:cv/mmr:personalData/mmr:firstName, ' ', mmr:cv/mmr:personalData/mmr:lastName)" />
      pdftex=true,
      pdfnewwindow=true,
      bookmarksopen=true,
      bookmarksnumbered=true,
      colorlinks=true,
      linkcolor=black,
      urlcolor=black
    ]{hyperref}
    \ifpdf
      \usepackage[pdftex]{graphicx}
    \else
      \usepackage{graphicx}
    \fi
    \renewcommand{\ttdefault}{phv}
    \selectlanguage{english}
        <xsl:apply-templates select="mmr:cv/mmr:personalData" />
    \newcommand{\mmrItem}[1]{
      \vspace{-5pt} \item #1
    }
    \newenvironment{mmrList}{
      \vspace{-15pt}
      \begin{itemize}
    }{
      \end{itemize}
    }
    \begin{document}
    \ecvfootnote{For more info, please visit: \url{http://b1n.org/}}
    \begin{europecv}
    \ecvpersonalinfo
    \ecvsection{Professional Summary}
    <xsl:apply-templates select="mmr:cv/mmr:professionalSummary" />

    \ecvsection{School Summary}
    <xsl:apply-templates select="mmr:cv/mmr:schoolSummary" />

    \ecvsection{Languages}
    <xsl:apply-templates select="mmr:cv/mmr:languages" />

    \ecvsection{Qualifications and Expertise}
    <xsl:apply-templates select="mmr:cv/mmr:qualifications" />

    <xsl:apply-templates select="mmr:cv/mmr:certifications" />

    <xsl:apply-templates select="mmr:cv/mmr:misc" />

    \end{europecv}
    \end{document}
</xsl:template>
</xsl:transform>
