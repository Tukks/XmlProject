<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html"/>

    <xsl:template match="/">

        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th>Nom des hotels</th>
                    <th>Adresse</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
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
            </tbody>
        </table>
   
    </xsl:template>

</xsl:stylesheet>