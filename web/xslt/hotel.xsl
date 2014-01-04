<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : hotel.xsl
    Created on : 23 décembre 2013, 15:43
    Author     : Nicolas
    Description:
        Purpose of transformation follows.
-->
<!-- Stack the columns on mobile by making one full-wclassth and the other half-wclassth -->


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html"/>
 
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
       
        <xsl:for-each select="/entry">
            <div class="row">
                <div class="col-xs-12 enTete">
                    <div class="nom">

                        <xsl:value-of select="name_fr"/> 
                        -  
                        <xsl:value-of select="address/city"/>
                        : 
                        <xsl:value-of select="standings_levels/standings_level"/>
 
                        <br/>
                    </div>
                    <div class="adresse">
                        <xsl:for-each select="address"> 
                            <xsl:value-of select="address_line1"/>,
                            <xsl:if test="address_line2 != ''">
                                <xsl:value-of select="address_line2"/>,
                            </xsl:if>
                            <xsl:if test="address_line3 != '' ">
                                <xsl:value-of select="address_line3"/>,
                            </xsl:if>
                            <xsl:value-of select="zip"/>, 
                            <xsl:value-of select="city"/>              
                        </xsl:for-each>
                    </div>
                </div>
            </div>

            <div class="row carrouselEtMap">
                <div class="col-xs-6 gauche">                                  
                    <div id="#myCarousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <xsl:for-each select="images/image">
                                <li data-target="#myCarousel">
                                    <xsl:attribute name="data-slide-to">
                                        <xsl:value-of select="position() - 1"/>
                                    </xsl:attribute> 
                                    <xsl:if test="position()-1 = 0">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if> 
                                </li>                     
                            </xsl:for-each>  
                        </ol>
                        <!-- Carousel items -->
                        <div class="carousel-inner">
                            <div class="active item">
                                <img>                                   
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="images/image"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt"></xsl:attribute>
                                </img>
                            </div>                           
                            <xsl:for-each select="images/image">                              
                                <xsl:if test="position() != 1">
                                    <div class="item">
                                        <img>                                   
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt"></xsl:attribute>
                                        </img>
                                    </div>
                                </xsl:if>                              
                            </xsl:for-each>
                        </div>
                        <!-- Carousel nav -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>              
                <div class="col-xs-6 droite">
                    <div id="cadre">
                        <div id="map">
                            <p>Veuillez patienter pendant le chargement de la carte...</p>
                        </div>
                    </div>
            
                </div>             
            </div>           
            <br />
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <div class= "contact">               
                        <h2>
                            Contact
                        </h2>
                        <br/>
                        <xsl:value-of select="phone"/>
                        <br/>
                        <xsl:value-of select="fax"/>
                        <br/>
                        <xsl:value-of select="email"/>
                        <br/>
                        <xsl:value-of select="website"/>
                    </div>  
                
            
            
                    <div class="labels">
                        <h2>
                            Labels
                        </h2>
                        <br/>
                        <xsl:for-each select="labels/label">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </div>
                </div>
               
            </div>
            <br/>
            <br/>
        

            <div class="row caracteristiques">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-2">
                            <h4>
                                Amenities
                            </h4>
                            <br/>
                            <div class = "amenities">                       
                                <xsl:for-each select="amenities/amenity">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>                    
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class = "payments">  
                                <h4>
                                    Paiements
                                </h4>
                                <br/>              
                                <xsl:for-each select="payments/payment">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>             
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class = "locations">   
                                <h4>
                                    Proche
                                </h4>
                                <br/>             
                                <xsl:for-each select="locations/location">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>             
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class = "profiles">
                                <h4>
                                    Profiles
                                </h4>
                                <br/>                            
                                <xsl:for-each select="profiles/profile">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>                             
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class = "options">
                                <h4>
                                    Options
                                </h4>
                                <br/>                            
                                <xsl:for-each select="options/option">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>                             
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class = "publications">
                                <h4>
                                    Publications
                                </h4>
                                <br/>                            
                                <xsl:for-each select="publications/publication">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>                             
                            </div>
                        </div>
                    </div>                   
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <table class="table table-striped">
                        <th>
                            Type
                        </th>
                        <th>
                            Unique
                        </th>
                        <th>
                            Prix minimum
                        </th>
                        <th>
                            Prix maximum
                        </th>
                        <th>
                            Prix moyen
                        </th>
                        <th>
                            Prix fixe
                        </th>
                        <xsl:for-each select="tariffs/tariff">
                            <tr>
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>
                                <td>
                                    <xsl:value-of select="unique"/>
                                </td>
                                <td>
                                    <xsl:value-of select="min"/>
                                </td>
                                <td>
                                    <xsl:value-of select="max"/>
                                </td>
                                <td>
                                    <xsl:value-of select="average"/>
                                </td>
                                <td>
                                    <xsl:value-of select="fixe"/>
                                </td>
                                
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </div>
    
            <div class="row">
                <div class="col-xs-12">
                    <table class="table table-striped livings">
                        <tr>
                        <th>
                            Nombre de chambres
                        </th>
                        <th>
                            Nombre de salles de bains
                        </th>
                        <th>
                            Nombre de douches
                        </th>
                        <th>
                            Nombre de suites
                        </th>
                        <th>
                            Nombre de studios
                        </th>
                        <th>
                            Nombre d'appartements
                        </th>
                        <th>
                            Nombre de chambres pour handicapées
                        </th>
                         <th>
                            Nombre de chambres simples
                         </th>
                        <th>
                            Nombre de chambres doubles
                        </th>
                        <th>
                            Nombre de chambres triple
                        </th>
                        <th>
                            Nombre de chambres jumelles
                        </th>
                        <th>
                            Nombre de chambres familiales 
                        </th>
                        <th>
                            Nombre de zones
                        </th>
                        <th>
                            Types
                        </th>
                        <th>
                            Etages
                        </th>
                         <th>
                            Nombre de chambres à coucher
                         </th>
                         <th>
                             Nombres de "sleeps"
                         </th>
                         <th>
                             Nombres de chambres meublées
                         </th>
                     </tr>
                        <xsl:for-each select="living">
                            <tr>                           
                                <td>
                                    <xsl:value-of select="room_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="room_bath_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="room_shower_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="suite_count"/>
                                </td>
                            
                             
                                <td>
                                    <xsl:value-of select="studio_count"/>
                                </td>
                                <td>
                                    <xsl:value-of select="apartment_room"/>
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
                            </tr>                          
                        </xsl:for-each>
                    </table>
                </div>
            </div>
           
            
            
    
            <div class = "categories">
                <div class="span12">
                    <xsl:for-each select="categories/categorie">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </div>
            </div>
            <div class = "station">
                <div class="span12">
                    <xsl:for-each select="stations/station">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </div>
            </div>
            <div class = "standing_levels">
                <div class="span12">
                    <xsl:value-of select="standing_levels"/>
                </div>
            </div>
            <div class="common_tags">
                <div class="span12">
                    <xsl:value-of select="common_tags"/>
                </div>
            </div>
            <div class="capacity">
                <div class="span12">
                    <xsl:for-each select="capacities/capacity">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </div>
            </div>
            <div class="closures">
                <div class="span12">
                    <xsl:value-of select="closures"/>
                </div>
            </div>
            <div class="spaces">
                <div class="span12">
                    <xsl:value-of select="spaces"/>
                </div>
            </div>
            <div class="opening">
                <div class="span12">
                    <xsl:value-of select="opening"/>
                </div>
            </div>
            <div class="closure">
                <div class="span12">
                    <xsl:value-of select="closure"/>
                </div>
            </div>
            <div class="note">
                <div class="span12">
                    <xsl:value-of select="note"/>
                </div>
            </div>
            <div class="niceres_availability">
                <div class="span12">
                    <xsl:value-of select="niceres_availability"/>
                </div>
            </div>
            <div class="niceres_class">
                <div class="span12">
                    <xsl:value-of select="niceres_class"/>
                </div>
            </div>
            <div class="created">
                <div class="span12">
                    <xsl:value-of select="created"/>
                </div>
            </div>
            <div class="updated">
                <div class="span12">
                    <xsl:value-of select="updated"/>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>