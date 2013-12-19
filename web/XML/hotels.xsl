<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html"/>

    <xsl:template match="/">
       
                <table class="table">
                    <tr>
                        <td>Nom des hotels</td>
                        <td>Adresse</td>
                        <td>Phone</td>
                    </tr>
                    <xsl:for-each select="entries/entry">
                        <tr>
                            <td>
                                <xsl:value-of select="name_fr"/>                                
                            </td>
                            <td>
                                <xsl:value-of select="address"/>
                            </td>
                            <td>
                                <xsl:value-of select="phone"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
         
    </xsl:template>

</xsl:stylesheet>