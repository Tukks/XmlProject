<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : hotel.xsl
    Created on : 23 décembre 2013, 15:43
    Author     : Nicolas
    Description:
        Affichage des informations d'un hotel
-->
<!-- Stack the columns on mobile by making one full-wclassth and the other half-wclassth -->


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:e="http://ref.otcnice.com/webservice/" version="1.0">

    <xsl:output method="html"/>
 
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
       
        <xsl:for-each select="/e:entry">
            <div class="row">
                <div class="col-xs-12 enTete">
                    <div class="nom">

                        <xsl:value-of select="e:name_fr"/> 
                          
                        <xsl:value-of select="e:address/city"/>
                        : 
                        <xsl:value-of select="e:standings_levels/e:standings_level"/>
                        
                        <br/>
                    </div>
                    <div class="adresse">
                        <xsl:for-each select="e:address"> 
                            <xsl:value-of select="e:address_line1"/>,
                            <xsl:if test="address_line2 != ''">
                                <xsl:value-of select="e:address_line2"/>,
                            </xsl:if>
                            <xsl:if test="address_line3 != '' ">
                                <xsl:value-of select="e:address_line3"/>,
                            </xsl:if>
                            <xsl:value-of select="e:zip"/>, 
                            <xsl:value-of select="e:city"/>              
                        </xsl:for-each>
                        
                    </div>
                    <div>
                        <xsl:for-each select="e:categories/e:category"> 
                            
                                <xsl:value-of select="."/> 
                                <xsl:if test="position()!=last()">
                                    -
                                </xsl:if>

                        </xsl:for-each>
                    </div>
                     
                 
                </div>
            </div>
            <div class="row carrouselEtMap">
                <div class="col-xs-6 gauche">                                  
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <xsl:for-each select="e:images/e:image">
                                <li data-target="myCarousel">
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
                                <img style="height:auto; width:auto; max-width:500px; max-height:500px;">                                  
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="e:images/e:image"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt"></xsl:attribute>
                                </img>
                            </div>                           
                            <xsl:for-each select="e:images/e:image">                              
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
                
                <div id="cadre">
                    <div class="col-xs-6 droite">
                        <div id="map">
                            <p>Veuillez patienter pendant le chargement de la carte...</p>
                        </div>
                    </div>
            
                </div>             
            </div>           
            <br />
            <br />
            <div class="row notes">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-2">
                            <h4>
                                Note
                            </h4>
                            <br/>
                            <div class="note">
                                <xsl:value-of select="e:note"/> / 5
                            </div>
                        </div>  
                        <div class="col-xs-2">
                            <h4>
                                Langues parlées
                            </h4>
                            <br/>
                            <div class="languages">
                                <xsl:for-each select="e:languages/e:language">
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
                                </xsl:for-each>
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="labels">
                                <h4>
                                    Labels
                                </h4>
                                <br/>                    
                                <xsl:for-each select="e:labels/e:label">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </div> 
                        </div>
                        <div class="col-xs-2">
                            <h4>
                                Proche de
                            </h4>
                            <br/>
                            <xsl:for-each select="e:stations/e:station">
                                <li>
                                    <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                        </div>
                        <div class="col-xs-2">
                            <h4>
                                Adapté pour :
                            </h4>
                            <br/>
                            <xsl:for-each select="e:common_tags/e:common_tag">
                                <li>
                                    <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                            
                        </div> 
                        <div class="col-xs-2">
                            <div class= "contact">               
                                <h4>
                                    Contact
                                </h4>
                                <br/>
                                <xsl:value-of select="e:phone"/>
                                <br/>
                                <xsl:value-of select="e:fax"/>
                                <br/>
                                <xsl:element name="a">
                                    <xsl:attribute name="href">mailto:<xsl:value-of select="e:email"/></xsl:attribute>
                                    <xsl:value-of select="e:email"/>
                                </xsl:element>
                                <br/>
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="e:website"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="e:website"/>
                                </xsl:element>
                            </div> 
                        </div>                  
                    </div>
                    
                </div>
                            
            </div>

            <div class="row caracteristiques">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-2">
                            <h4>
                                Aménagements
                            </h4>
                            <br/>
                            <div class = "amenities">                       
                                <xsl:for-each select="e:amenities/e:amenity">
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
                                <xsl:for-each select="e:payments/e:payment">
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
                                <xsl:for-each select="e:locations/e:location">
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
                                <xsl:for-each select="e:profiles/e:profile">
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
                                <xsl:for-each select="e:options/e:option">
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
                                <xsl:for-each select="e:publications/e:publication">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>                             
                            </div>
                        </div>
                    </div>                   
                </div>
            </div>
            
            
            <br/>   
            <h2>
                Récapitulatif des chambres
            </h2> 
            <br/>
            <div class="row">
                <div class="col-xs-12">
                    <table class="table table-striped table-bordered">
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
                                Spécifiques
                            </th>
                            
                        </tr>
                        <xsl:for-each select="e:living">
                            <tr>                           
                                <td>
                                    <xsl:value-of select="e:room_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="e:room_bath_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="e:room_shower_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="e:suite_count"/>
                                </td>
                            
                             
                                <td>
                                    <xsl:value-of select="e:studio_count"/>
                                </td>
                                <td>
                                    <xsl:value-of select="e:apartment_count"/>
                                </td>
                            
                             
                                <td>
                                    <xsl:value-of select="e:room_accessible_count"/>
                                </td>                         
                                <td>
                                    <xsl:value-of select="e:type"/>
                                </td>
                            </tr>
                            <tr>
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
                            <tr>
                            
                                <td>
                                    <xsl:value-of select="e:floor"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="e:bedroom_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="e:sleeps_count"/>
                                </td>
                            
                            
                                <td>
                                    <xsl:value-of select="e:furnished_room_count"/>
                                </td>
                            </tr>                          
                        </xsl:for-each>
                    </table>
                </div>
            </div>
            <br/>
            <h2>
                Prix
            </h2>
        <br/>
           <div class="row">
                <div class="col-xs-12">
                    <table class="table table-striped table-bordered">
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
                        <xsl:for-each select="e:tariffs/e:tariff">
                            <tr>
                                <td>
                                    <xsl:value-of select="e:name"/>
                                </td>
                                <td>
                                    <xsl:value-of select="e:unique"/>
                                </td>
                                <td>
                                    <xsl:value-of select="e:min"/>
                                </td>
                                <td>
                                    <xsl:value-of select="e:max"/>
                                </td>                                
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </div> 
            
    
            <br/>
            <h2>
                Capacitées
            </h2>
            <br/>
            <div class="capacity">
                <div class="row">
                    <div class="col-xs-8">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>
                                    Total
                                </th>
                                <th>
                                    Intérieur
                                </th>
                                <th>
                                    Extérieur
                                </th>
                                <th>
                                    Groupe
                                </th>
                                <th>
                                    Nombre de chambres
                                </th>                             
                            </tr>
                            <tr>
                                <xsl:for-each select="e:capacity">
                                    <td>
                                        <xsl:value-of select="e:total"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="e:indoor"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="e:outdoor"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="e:group"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="e:room_count"/>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </table>
                    
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    Crée le : <xsl:value-of select="e:created"/>
                    <br/> Dernière mise-à-jour le : <xsl:value-of select="e:updated"/> 
                </div>
            </div>
           
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>