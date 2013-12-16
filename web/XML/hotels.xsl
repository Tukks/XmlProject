<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Hotels</title>
                 <link rel="stylesheet" href="../LIB/bootstrap/css/bootstrap.min.css"></link>
                 <link rel="stylesheet" href="../LIB/bootstrap/css/bootstrap-theme.min.css"></link>
            </head>
            <body>
                <table class="table table-hover">
                    <tr bgcolor="#F0F0F0">
                        <td>Nom des hotels</td>
                        
                    </tr>
                    <xsl:for-each select="entries/entry">
                        <tr>
                            <td>
                                <xsl:value-of select="name_fr"/>
                            </td>
                            <td>
                                <xsl:value-of select="ID"/>
                            </td>
                            <td>
                                <xsl:value-of select="phone"/>
                            </td>
                            <td>
                                <xsl:value-of select="labels/label"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>