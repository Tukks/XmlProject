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
                <table cellpadding="1" cellspacing="1" border="1" class="table table-striped table-bordered" id="hotelTable">
                    <xsl:for-each select="/entry">
               
                        <div id="nom">
                            <tr>
                                <th>
                                    Nom
                                </th>
                                <td>
                                    <xsl:value-of select="name_fr"/>                        
                                </td>
                            </tr>
                        </div>
                        <div id="adresse">
                    
                            <tr>
                                <th>
                                    Adresses
                                </th>                                
                                <xsl:for-each select="address">                                      
                                    <td>
                                        <xsl:value-of select="address_line1"/>
                                <xsl:if test="address_line2 != ''">
                                    <br/>
                                    <xsl:value-of select="address_line2"/>
                                    <br/>
                                </xsl:if>

                                <xsl:if test="address_line3 != '' ">
                                    <xsl:value-of select="address_line3"/>
                                    <br/>
                                </xsl:if>
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
                                <th>
                                    Contact
                                </th>                 
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
                                <th>
                                    Paiement
                                </th>
                                <xsl:for-each select="payments/payment">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr>  
                        </div> 
                        <div id = "languages">
                            <tr> 
                                <th>
                                    Languages
                                </th>
                                <xsl:for-each select="languages/language">                                                
                                <td>
                                     <xsl:choose>
                                         <xsl:when test=". = 'Anglais'">
                                             <img src="lib\drapeaux\england.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Allemand'">
                                             <img src="lib\drapeaux\germany.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Espagnol'">
                                             <img src="lib\drapeaux\spain.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Italien'">
                                             <img src="lib\drapeaux\italy.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Russe'">
                                             <img src="lib\drapeaux\russia.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Français'">
                                             <img src="lib\drapeaux\france.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Néerlandais'">
                                             <img src="lib\drapeaux\netherlands.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Arabe'">
                                             <img src="lib\drapeaux\arab.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Finois'">
                                             <img src="lib\drapeaux\finland.png" class="img-thumbnail"/>
                                         </xsl:when>
                                         <xsl:when test=". = 'Portugais'">
                                             <img src="lib\drapeaux\portugal.png" class="img-thumbnail"/>
                                         </xsl:when>
                                     </xsl:choose>                  
                                </td>
                                </xsl:for-each> 
                            </tr>   
                        </div> 
                        <div id="labels">
                            <tr> 
                                <th>
                                    Labels
                                </th>
                                <xsl:for-each select="labels/label">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr> 
                        </div>
                        <div id = "amenities">
                            <tr> 
                                <th>
                                    Amenities
                                </th>
                                <xsl:for-each select="amenities/amenity">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr>
                        </div> 
                        <div id = "profiles">
                            <tr> 
                                <th>
                                    Profiles
                                </th>
                                <xsl:for-each select="profiles/profile">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr> 
                        </div>
                        <div id = "location">
                            <tr> 
                                <th>
                                    Location
                                </th>
                                <xsl:for-each select="locations/location">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr> 
                        </div>
                        <div id = "categories">
                            <tr> 
                                <th>
                                    Categories
                                </th>
                                <xsl:for-each select="categories/categorie">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr>  
                        </div>
                        <div id = "station">
                            <tr> 
                                <th>
                                    Stations
                                </th>
                                <xsl:for-each select="stations/station">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr> 
                        </div>
                        <div id = "standing_levels">
                            <tr>   
                                <th>
                                    Standing level
                                </th>          
                                <td>
                                    <xsl:value-of select="standing_levels"/> 
                                </td>
                            </tr>  
                        </div>
                        <div id = "options">
                            <tr> 
                                <th>
                                    Option
                                </th>
                                <xsl:for-each select="options/option">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr> 
                        </div>
                        <div id="publications">
                            <tr> 
                                <th>
                                    Publications
                                </th>
                                <xsl:for-each select="publications/publication">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr> 
                        </div>
                        <div id="common_tags">
                            <tr>
                                <th>
                                    Common tags
                                </th>
                   
                                <td>
                                    <xsl:value-of select="common_tags"/> 
                                </td>
                   
                            </tr>  
                        </div>
                
                        <div id="images">
                            <tr>
                                <th>
                                    Images
                                </th>
                                <xsl:for-each select="images/image">
                                    <td>
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="."/>
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
                                <th>
                                    Tariffs
                                </th>
                                <xsl:for-each select="tariffs/tariff">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr>  
                        </div>
                        <div id="capacity">
                            <tr> 
                                <th>
                                    Capacitees
                                </th>
                                <xsl:for-each select="capacities/capacity">                                                
                                <td>
                                    <xsl:value-of select="."/>                           
                                </td>
                                </xsl:for-each> 
                            </tr>  
                        </div>
                        <div id="closures">
                            <tr>
                                <th>
                                    Closures
                                </th>
                                <td>
                                    <xsl:value-of select="closures"/>
                                </td>
                            </tr> 
                        </div>
                        <div id="spaces">
                            <tr>
                                <th>
                                    Spaces
                                </th>
                                <td>
                                    <xsl:value-of select="spaces"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="opening">
                            <tr>
                                <th>
                                    Ouverture
                                </th>
                                <td>
                                    <xsl:value-of select="opening"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="closure">
                            <tr>
                                <th>
                                    Fermeture
                                </th>
                                <td>
                                    <xsl:value-of select="closure"/>
                                </td> 
                            </tr>
                        </div>
                        <div id="note">
                            <tr>
                                <th>
                                    Note
                                </th>
                                <td>
                                    <xsl:value-of select="note"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="niceres_availability">
                            <tr>
                                <th>
                                    niceres_availability
                                </th>
                                <td>
                                    <xsl:value-of select="niceres_availability"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="niceres_id">
                            <tr>
                                <th>
                                    niceres_id
                                </th>
                                <td>
                                    <xsl:value-of select="niceres_id"/>
                                </td>
                            </tr> 
                        </div>
                        <div id="created">
                            <tr>
                                <th>
                                    Crée le
                                </th>
                                <td>
                                    <xsl:value-of select="created"/> 
                                </td>
                            </tr>
                        </div>
                        <div id="updated">
                            <tr>
                                <th>
                                    Mise à jour le
                                </th>
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
 <!-- TODO customize transformation rules
         syntax recommendation http://www.w3.org/TR/xslt
    -->
   <!-- <xsl:template match="/">
        <xsl:for-each select="/entry">

            <div class ="nom">
                <xsl:value-of select="name_fr"/>
            </div>
            <div class ="address">
                <table>

                        <xsl:for-each select="address">
                            <td>
                            
                                <xsl:value-of select="address_line1"/>
                                <xsl:if test="address_line2 != ''">
                                    <br/>
                                    <xsl:value-of select="address_line2"/>
                                    <br/>
                                </xsl:if>

                                <xsl:if test="address_line3 != '' ">
                                    <xsl:value-of select="address_line3"/>
                                    <br/>
                                </xsl:if>
                            </td>
                            <td>
                                
                                    <td>
                                        <xsl:value-of select="zip"/>
                                    </td>
                                
                                
   
                                
                                    <td>
                                        <xsl:value-of select="city"/>
                                    </td>
                               
                            </td>
                        </xsl:for-each>

                </table>


            </div>
            <div class = "contact">
                <xsl:value-of select="phone"/>
                <br/>
                <xsl:value-of select="fax"/>
                <br/>
                <xsl:value-of select="email"/>
                <br/>
                <xsl:value-of select="website"/>


            </div>
            <div class = "payments">



                <xsl:for-each select="payments/payment">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class = "languages">




                <xsl:for-each select="languages/language">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class ="labels">




                <xsl:for-each select="labels/label">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class = "amenities">



                <xsl:for-each select="amenities/amenity">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class = "profiles">


                <xsl:for-each select="profiles/profile">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class = "location">




                <xsl:for-each select="locations/location">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class = "categories">




                <xsl:for-each select="categories/categorie">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class = "station">



                <xsl:for-each select="stations/station">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class = "standing_levels">





                <xsl:value-of select="standing_levels"/>


            </div>
            <div class = "options">




                <xsl:for-each select="options/option">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class ="publications">




                <xsl:for-each select="publications/publication">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class ="common_tags">




                <xsl:value-of select="common_tags"/>



            </div>

            <div class ="images">



                <xsl:for-each select="images/image">

                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </img>

                </xsl:for-each>

            </div>
            <div class ="living">

                <xsl:for-each select="living">

                    <xsl:value-of select="room_count"/>


                    <xsl:value-of select="room_bath_count"/>


                    <xsl:value-of select="suite_count"/>


                    <xsl:value-of select="studio_count"/>


                    <xsl:value-of select="apartment_count"/>


                    <xsl:value-of select="room_accessible_count"/>


                    <xsl:value-of select="single_count"/>


                    <xsl:value-of select="double_count"/>


                    <xsl:value-of select="triple_count"/>


                    <xsl:value-of select="twins_count"/>


                    <xsl:value-of select="family_count"/>


                    <xsl:value-of select="area"/>


                    <xsl:value-of select="type"/>


                    <xsl:value-of select="floor"/>


                    <xsl:value-of select="bedroom_count"/>


                    <xsl:value-of select="sleeps_count"/>


                    <xsl:value-of select="furnished_room_count"/>

                </xsl:for-each>

            </div>
            <div class ="tariffs">



                <xsl:for-each select="tariffs/tariff">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class ="capacity">



                <xsl:for-each select="capacities/capacity">

                    <xsl:value-of select="."/>

                </xsl:for-each>

            </div>
            <div class ="closures">




                <xsl:value-of select="closures"/>


            </div>
            <div class ="spaces">



                <xsl:value-of select="spaces"/>


            </div>
            <div class ="opening">



                <xsl:value-of select="opening"/>


            </div>
            <div class ="closure">




                <xsl:value-of select="closure"/>


            </div>
            <div class ="note">




                <xsl:value-of select="note"/>


            </div>
            <div class ="niceres_availability">



                <xsl:value-of select="niceres_availability"/>


            </div>
            <div class ="niceres_id">


                <xsl:value-of select="niceres_id"/>


            </div>
            <div class ="created">


                <xsl:value-of select="created"/>


            </div>
            <div class ="updated">


                <xsl:value-of select="updated"/>


            </div>
        </xsl:for-each>
    </xsl:template>
-->