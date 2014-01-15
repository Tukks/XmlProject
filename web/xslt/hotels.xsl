<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:e="http://ref.otcnice.com/webservice/" version="1.0">

    <xsl:output method="html"/>

    <xsl:template match="/">

        <div class="table-responsive">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th>Nom des hotels</th>
                    <th>Adresse</th>
                    <th>Phone</th>
                    <th>Classification</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="e:entries/e:entry">
                    <tr>
                        <td>
                            <html>
                                <a href ="hotel.html?hotel={ID}"><xsl:value-of select="e:name_fr"/></a>
                            </html>                               
                        </td>
                        <td>
                            <xsl:value-of select="e:address"/>
                        </td>
                        <td>
                            <xsl:value-of select="e:phone"/>
                        </td>
                        <td>
                            <xsl:value-of select="e:standings_levels"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
        </div>
   
    </xsl:template>

</xsl:stylesheet>