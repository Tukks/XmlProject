<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : hotel.xsl
    Created on : 23 décembre 2013, 15:43
    Author     : Nicolas
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>hotel.xsl</title>
            </head>
            <body>
                <div id="nom">
                <tr>
                    <td>
                        <xsl:value-of select="name_fr"/>
                    </td>
                </tr>
                </div>
                <div id="adresse">
                <tr>
                    <td>
                        <xsl:value-of select="address_line1"/>
                    </td>  
                    <td>
                        <xsl:value-of select="address_line2"/>
                    </td> 
                    <td>
                        <xsl:value-of select="address_line3"/>
                    </td>  
                    <td>
                        <xsl:value-of select="zip"/>
                    </td>  
                    <td>
                        <xsl:value-of select="city"/>
                    </td>                                     
                </tr> 
                </div>
                <div id= "contact">    
                <tr>
                    <td>
                        <xsl:value-of select="phone"/>
                    </td> 
                    <td>
                        <xsl:value-of select="fax"/>
                    </td>
                    <td>
                        <xsl:value-of select="email"/>
                    </td>
                    <td>
                        <xsl:value-of select="website"/>
                    </td>
                </tr>
                </div> 
                <div id = "payments">
                <tr>
                    <xsl:for-each select="payments">
                        <td>
                            <xsl:value-of select="payments"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div> 
                <div id = "languages">
                <tr>
                    <xsl:for-each select="languages">
                        <td>
                            <xsl:value-of select="languages"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div> 
                <div id="labels">
                    <tr>
                        <td>
                            <xsl:value-of select="labels"/>
                        </td>
                    </tr>
                </div>
                <div id = "amenities">
                <tr>
                    <xsl:for-each select="amenities">
                        <td>
                            <xsl:value-of select="amenities"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div> 
                <div id = "profiles">
                <tr>
                    <xsl:for-each select="profiles">
                        <td>
                            <xsl:value-of select="profiles"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                 <div id = "location">
                <tr>
                    <xsl:for-each select="location">
                        <td>
                            <xsl:value-of select="location"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                 <div id = "categories">
                <tr>
                    <xsl:for-each select="categories">
                        <td>
                            <xsl:value-of select="categories"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                 <div id = "station">
                <tr>
                    <xsl:for-each select="station">
                        <td>
                            <xsl:value-of select="station"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                <div id = "standing_levels">
                <tr>             
                    <td>
                        <xsl:value-of select="standing_levels"/> 
                    </td>
                </tr>  
                </div>
                <div id = "options">
                <tr>
                    <xsl:for-each select="option">
                        <td>
                            <xsl:value-of select="option"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                <div id="publications">
                <tr>
                    <xsl:for-each select="publication">
                        <td>
                            <xsl:value-of select="publication"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                <div id="common_tags">
                <tr>
                    <xsl:for-each select="common_tag">
                        <td>
                            <xsl:value-of select="common_tag"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                <div id="images">
                <tr>
                    <xsl:for-each select="image">
                        <td>
                            <xsl:value-of select="image"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                <div id="living">
                <tr>
                    <xsl:for-each select="living">
                        <td>
                            <xsl:value-of select="room_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="room_bath_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="suite_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="studio_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="apartment_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="room_accessible_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="single_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="double_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="triple_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="twins_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="family_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="area"/> 
                        </td>
                        <td>
                            <xsl:value-of select="type"/> 
                        </td>
                        <td>
                            <xsl:value-of select="floor"/> 
                        </td>
                        <td>
                            <xsl:value-of select="bedroom_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="sleeps_count"/> 
                        </td>
                        <td>
                            <xsl:value-of select="furnished_room_count"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                <div id="tariffs">
                <tr>
                    <xsl:for-each select="tariff">
                        <td>
                            <xsl:value-of select="tariff"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                 <div id="capacity">
                <tr>
                    <xsl:for-each select="capacity">
                        <td>
                            <xsl:value-of select="capacity"/> 
                        </td>
                    </xsl:for-each>
                </tr>  
                </div>
                <div id="closures">
                    <xsl:value-of select="closures"/> 
                </div>
                <div id="spaces">
                    <xsl:value-of select="spaces"/> 
                </div>
                <div id="opening">
                    <xsl:value-of select="opening"/> 
                </div>
                <div id="closure">
                    <xsl:value-of select="closure"/> 
                </div>
                <div id="note">
                    <xsl:value-of select="note"/> 
                </div>
                <div id="niceres_availability">
                    <xsl:value-of select="closure"/> 
                </div>
                <div id="niceres_id">
                    <xsl:value-of select="niceres_id"/> 
                </div>
                <div id="created">
                    <xsl:value-of select="created"/> 
                </div>
                <div id="updated">
                    <xsl:value-of select="updated"/> 
                </div>
             
                                       
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
