<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html"/>

    <xsl:template match="/">

        <div class="table-responsive">
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Stats des hotels</th>
                        <th>1 étoile</th>
                        <th>2 étoiles</th>
                        <th>3 étoiles</th>
                        <th>4 étoiles</th>
                        <th>5 étoiles</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                       
                        <td>
                            <b>Nombre d'hôtels</b>
                        </td>
                        <xsl:for-each select="stat/hotel">   
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </xsl:for-each>
                    </tr>
                    <tr>
                        <td>
                            <b>Hôtels avec accés handicapés</b>
                        </td>
                        <xsl:for-each select="stat/handi">   
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </xsl:for-each>
                    </tr>
                    <tr>
                        <td>
                            <b>Langues parlées</b>
                        </td>
                        <xsl:for-each select="stat/langue">   
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </xsl:for-each>
                    </tr>
                    <tr>
                        <td>
                            <b>Nombre de chambres</b>
                        </td>
                        <xsl:for-each select="stat/chambre">   
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </xsl:for-each>
                    </tr>
                    <tr>
                        <td>
                            <b>Prix moyen</b>
                        </td>
                        <xsl:for-each select="stat/prix">   
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </xsl:for-each>
                    </tr>
                    <tr>
                        <td>
                            <b>Nombre paiments</b>
                        </td>
                        <xsl:for-each select="stat/paie">   
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </xsl:for-each>
                    </tr>
   
                </tbody>
            </table>
        </div>
   
    </xsl:template>

</xsl:stylesheet>