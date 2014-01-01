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
                <table cellpadding="1" cellspacing="1" border="1" class="table table-striped table-bordered" id="example">
                    <xsl:for-each select="/entry">
               
                        <div id="nom">
                            <tr>
                                <td>
                                    <xsl:value-of select="name_fr"/>                        
                                </td>
                            </tr>
                        </div>
                        <div id="adresse">
                    
                            <tr>
                                <xsl:for-each select="address">                                      
                                    <td>
                                        <xsl:value-of select="address_line1"/>
                                        <br/>
                                        <xsl:value-of select="address_line2"/>
                                        <br/>
                                        <xsl:value-of select="address_line3"/>
                                    </td>  
                                    <td>
                                        <xsl:value-of select="zip"/>
                                        <br/>
                                        <xsl:value-of select="city"/>
                                    </td> 
                                </xsl:for-each>                                         
                            </tr> 
                        </div>
                        <div id= "contact">    
                            <tr>                   
                                <td>
                                    <xsl:value-of select="phone"/>
                                    <br/>                  
                                    <xsl:value-of select="fax"/>
                                    <br/>                  
                                    <xsl:value-of select="email"/>
                                    <br/>                 
                                    <xsl:value-of select="website"/>
                                </td>
                            </tr>
                        </div> 
                        <div id = "payments">
                            <tr>
                                        
                    
                        
                                <td>
                                    <xsl:value-of select="payments"/> 
                                    <br/>                           
                                </td>
                  
                            </tr>  
                        </div> 
                        <div id = "languages">
                            <tr>
                    
                                <td>
                                    <xsl:value-of select="languages"/> 
                                </td>
                   
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
                   
                                <td>
                                    <xsl:value-of select="amenities"/> 
                                </td>
                    
                            </tr>  
                        </div> 
                        <div id = "profiles">
                            <tr>
                    
                                <td>
                                    <xsl:value-of select="profiles"/> 
                                </td>
                    
                            </tr>  
                        </div>
                        <div id = "location">
                            <tr>
                    
                                <td>
                                    <xsl:value-of select="locations"/> 
                                </td>
                   
                            </tr>  
                        </div>
                        <div id = "categories">
                            <tr>
                    
                                <td>
                                    <xsl:value-of select="categories"/> 
                                </td>
                   
                            </tr>  
                        </div>
                        <div id = "station">
                            <tr>
                  
                                <td>
                                    <xsl:value-of select="stations"/> 
                                </td>
                   
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
                   
                                <td>
                                    <xsl:value-of select="options"/> 
                                </td>
                    
                            </tr>  
                        </div>
                        <div id="publications">
                            <tr>
                    
                                <td>
                                    <xsl:value-of select="publications"/> 
                                </td>
                    
                            </tr>  
                        </div>
                        <div id="common_tags">
                            <tr>
                   
                                <td>
                                    <xsl:value-of select="common_tags"/> 
                                </td>
                   
                            </tr>  
                        </div>
                
                        <div id="images">
                            <tr>
                                <xsl:for-each select="images">
                                    <td>
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="image"/>
                                            </xsl:attribute>
                                        </img>
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
                                <xsl:for-each select="tariffs">
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
                            <tr>
                                <td>
                                    <xsl:value-of select="closures"/>
                                </td>
                            </tr> 
                        </div>
                        <div id="spaces">
                            <tr>
                                <td>
                                    <xsl:value-of select="spaces"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="opening">
                            <tr>
                                <td>
                                    <xsl:value-of select="opening"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="closure">
                            <tr>
                                <td>
                                    <xsl:value-of select="closure"/>
                                </td> 
                            </tr>
                        </div>
                        <div id="note">
                            <tr>
                                <td>
                                    <xsl:value-of select="note"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="niceres_availability">
                            <tr>
                                <td>
                                    <xsl:value-of select="closure"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="niceres_id">
                            <tr>
                                <td>
                                    <xsl:value-of select="niceres_id"/>
                                </td>
                            </tr> 
                        </div>
                        <div id="created">
                            <tr>
                                <td>
                                    <xsl:value-of select="created"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="updated">
                            <tr>
                                <td>
                                    <xsl:value-of select="updated"/> 
                                </td>
                            </tr>
                        </div>
                       
                    </xsl:for-each>  
                </table> 
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
