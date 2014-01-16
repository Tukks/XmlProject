package Query;

import BDD.BaseXClient;
import java.io.IOException;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author giuse_000
 */
public class Query {

    private final BaseXClient session;

    public static void main(String[] args) throws IOException {
        Query q = new Query();
        System.out.println(q.chartFOP());
    }

    public Query() throws IOException {
        super();
        this.session = new BaseXClient("localhost", 1984, "admin", "admin");
    }

    public String hotel() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "for $hotel in doc('data/entries_hotels.xml') return $hotel";
            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    public String pieChartXML() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "let $doc := doc('data/entries_hotels.xml')\n"
                    + "return\n"
                    + "let $total := count($doc//e:entry)\n"
                    + "return\n"
                    + "let $un := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '1 étoile'])div $total * 100\n"
                    + "let $deux := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '2 étoiles'])div $total * 100\n"
                    + "let $trois := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '3 étoiles'])div $total * 100\n"
                    + "let $quatre := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '4 étoiles'])div $total * 100\n"
                    + "let $cinq := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '5 étoiles'])div $total * 100\n"
                    + "return \n"
                    + "<pie>\n"
                    + "<x>1 étoile</x><y>{round($un)}</y>\n"
                    + "<x>2 étoiles</x><y>{round($deux)}</y>\n"
                    + "<x>3 étoiles</x><y>{round($trois)}</y>\n"
                    + "<x>4 étoiles</x><y>{round($quatre)}</y>\n"
                    + "<x>5 étoiles</x><y>{round($cinq)}</y>\n"
                    + "</pie>\n";

            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    public String barChartXML() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "let $Doc := doc('data/entries_hotels.xml')\n"
                    + "return\n"
                    + "let $Anglais := count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Anglais'])\n"
                    + "let $Allemand :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Allemand'])\n"
                    + "let $Espagnol :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Espagnol'])\n"
                    + "let $Italien :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Italien'])\n"
                    + "let $Russe :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Russe'])\n"
                    + "let $Français :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Français'])\n"
                    + "let $Néerlandais :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Néerlandais'])\n"
                    + "let $Arabe :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Arabe'])\n"
                    + "let $Finois :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Finois'])\n"
                    + "let $Portugais :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Portugais'])\n"
                    + "let $Lituanien :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Lituanien'])\n"
                    + "return\n"
                    + "\n"
                    + "<bar>\n"
                    + "<x>Anglais</x>\n"
                    + "<x>Francais</x>\n"
                    + "<x>Italien</x>\n"
                    + "<x>Espagnol</x>\n"
                    + "<x>Allemand</x>\n"
                    + "<x>Russe</x>\n"
                    + "<x>Arabe</x>\n"
                    + "<x>Portugais</x>\n"
                    + "<x>Finois</x>\n"
                    + "<x>Néerlandais</x>\n"
                    + "<x>Lituanien</x>\n"
                    + "<y>{round($Anglais)}</y>\n"
                    + "<y>{round($Allemand)}</y>\n"
                    + "<y>{round($Espagnol)}</y>\n"
                    + "<y>{round($Italien)}</y>\n"
                    + "<y>{round($Russe)}</y>\n"
                    + "<y>{round($Français)}</y>\n"
                    + "<y>{round($Néerlandais)}</y>\n"
                    + "<y>{round($Arabe)}</y>\n"
                    + "<y>{round($Finois)}</y>\n"
                    + "<y>{round($Portugais)}</y>\n"
                    + "<y>{round($Lituanien)}</y>\n"
                    + "</bar>";

            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    public String chartFOP() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";\n"
                    + "let $doc := doc('data/entries_hotels.xml')\n"
                    + "let $UneEtoile := $doc/e:entries/e:entry[e:standings_levels/e:standings_level = '1 étoile']\n"
                    + "let $prixUneEtoile :=  avg($UneEtoile/e:tariffs/e:tariff/e:min)               "
                    + "let $DeuxEtoile := $doc/e:entries/e:entry[e:standings_levels/e:standings_level = '2 étoiles']\n"
                    + "let $prixDeuxEtoile :=  avg($DeuxEtoile/e:tariffs/e:tariff/e:min)\n"
                    + "let $TroisEtoile := $doc/e:entries/e:entry[e:standings_levels/e:standings_level = '3 étoiles']\n"
                    + "let $prixTroisEtoile :=  avg($TroisEtoile/e:tariffs/e:tariff/e:min)  \n"
                    + "let $QuattreEtoile := $doc/e:entries/e:entry[e:standings_levels/e:standings_level = '4 étoiles']\n"
                    + "let $prixQuattreEtoile :=  avg($QuattreEtoile/e:tariffs/e:tariff/e:min) \n"
                    + "let $CinqEtoile := $doc/e:entries/e:entry[e:standings_levels/e:standings_level = '5 étoiles']\n"
                    + "let $prixCinqEtoile :=  avg($CinqEtoile/e:tariffs/e:tariff/e:min) \n"
                    + "let $Anglais := count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Anglais'])\n"
                    + "let $Allemand :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Allemand'])\n"
                    + "let $Espagnol :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Espagnol'])\n"
                    + "let $Italien :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Italien'])\n"
                    + "let $Russe :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Russe'])\n"
                    + "let $Français :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Français'])\n"
                    + "let $Néerlandais :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Néerlandais'])\n"
                    + "let $Arabe :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Arabe'])\n"
                    + "let $Finois :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Finois'])\n"
                    + "let $Portugais :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Portugais'])\n"
                    + "let $Lituanien :=count($doc/e:entries/e:entry/e:languages/e:language[text() eq 'Lituanien'])\n"
                    + "\n"
                    + "let $total := count($doc//e:entry)\n"
                    + "return\n"
                    + "let $un := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '1 étoile'])div $total * 100\n"
                    + "let $deux := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '2 étoiles'])div $total * 100\n"
                    + "let $trois := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '3 étoiles'])div $total * 100\n"
                    + "let $quatre := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '4 étoiles'])div $total * 100\n"
                    + "let $cinq := count($doc/e:entries/e:entry/e:standings_levels/e:standings_level[text() eq '5 étoiles'])div $total * 100\n"
                    + "\n"
                    + "return\n"
                    + "<data>\n"
                    + "<line>\n"
                    + "<x>5 étoiles</x>\n"
                    + "<x>4 étoiles</x>\n"
                    + "<x>3 étoiles</x>\n"
                    + "<x>2 étoiles</x>\n"
                    + "<x>1 étoile</x>\n"
                    + "<y>{$prixUneEtoile}</y>\n"
                    + "<y>{$prixDeuxEtoile}</y>\n"
                    + "<y>{$prixTroisEtoile}</y>\n"
                    + "<y>{$prixQuattreEtoile}</y>\n"
                    + "<y>{$prixCinqEtoile}</y>\n"
                    + "</line>\n"
                    + "<bar>\n"
                    + "<x>Anglais</x>\n"
                    + "<x>Francais</x>\n"
                    + "<x>Italien</x>\n"
                    + "<x>Espagnol</x>\n"
                    + "<x>Allemand</x>\n"
                    + "<x>Russe</x>\n"
                    + "<x>Arabe</x>\n"
                    + "<x>Portugais</x>\n"
                    + "<x>Finois</x>\n"
                    + "<x>Néerlandais</x>\n"
                    + "<x>Lituanien</x>\n"
                    + "<y>{round($Anglais)}</y>\n"
                    + "<y>{round($Allemand)}</y>\n"
                    + "<y>{round($Espagnol)}</y>\n"
                    + "<y>{round($Italien)}</y>\n"
                    + "<y>{round($Russe)}</y>\n"
                    + "<y>{round($Français)}</y>\n"
                    + "<y>{round($Néerlandais)}</y>\n"
                    + "<y>{round($Arabe)}</y>\n"
                    + "<y>{round($Finois)}</y>\n"
                    + "<y>{round($Portugais)}</y>\n"
                    + "<y>{round($Lituanien)}</y>\n"
                    + "</bar>\n"
                    + "<pie>\n"
                    + "<x>1 étoile</x><y>{round($un)}</y>\n"
                    + "<x>2 étoiles</x><y>{round($deux)}</y>\n"
                    + "<x>3 étoiles</x><y>{round($trois)}</y>\n"
                    + "<x>4 étoiles</x><y>{round($quatre)}</y>\n"
                    + "<x>5 étoiles</x><y>{round($cinq)}</y>\n"
                    + "</pie>\n"
                    + "</data>";

            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    public String lineChartXML() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";\n"
                    + "\n"
                    + "let $entries := doc('data/entries_hotels.xml')/e:entries\n"
                    + "let $UneEtoile := $entries/e:entry[e:standings_levels/e:standings_level = '1 étoile']\n"
                    + "let $prixUneEtoile :=  avg($UneEtoile/e:tariffs/e:tariff/e:min) \n"
                    + "let $DeuxEtoile := $entries/e:entry[e:standings_levels/e:standings_level = '2 étoiles']\n"
                    + "let $prixDeuxEtoile :=  avg($DeuxEtoile/e:tariffs/e:tariff/e:min) \n"
                    + "let $TroisEtoile := $entries/e:entry[e:standings_levels/e:standings_level = '3 étoiles']\n"
                    + "let $prixTroisEtoile :=  avg($TroisEtoile/e:tariffs/e:tariff/e:min) \n"
                    + "let $QuattreEtoile := $entries/e:entry[e:standings_levels/e:standings_level = '4 étoiles']\n"
                    + "let $prixQuattreEtoile :=  avg($QuattreEtoile/e:tariffs/e:tariff/e:min) \n"
                    + "let $CinqEtoile := $entries/e:entry[e:standings_levels/e:standings_level = '5 étoiles']\n"
                    + "let $prixCinqEtoile :=  avg($CinqEtoile/e:tariffs/e:tariff/e:min) \n"
                    + "return\n"
                    + "<line>\n"
                    + "<x>5 étoiles</x>\n"
                    + "<x>4 étoiles</x>\n"
                    + "<x>3 étoiles</x>\n"
                    + "<x>2 étoiles</x>\n"
                    + "<x>1 étoile</x>\n"
                    + "<y>{$prixUneEtoile}</y>\n"
                    + "<y>{$prixDeuxEtoile}</y>\n"
                    + "<y>{$prixTroisEtoile}</y>\n"
                    + "<y>{$prixQuattreEtoile}</y>\n"
                    + "<y>{$prixCinqEtoile}</y>\n"
                    + "</line>";

            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    public String latitudeMaps() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "for $var in doc('data/entries_hotels.xml') /e:entries/e:entry/e:latitude return data($var)";

            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    public String longitudeMaps() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "for $var in doc('data/entries_hotels.xml') /e:entries/e:entry/e:longitude return data($var)";

            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    /**
     * Prend l'ID d'un hotel et retourne toute les infos associées
     *
     * @param id l'id de l'hotel
     * @return toute les infos de de l'hotel
     */
    public String hotelById(String id) throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "for $hotel in doc('data/entries_hotels.xml')/e:entries/e:entry where $hotel/e:ID = " + id + " return $hotel";
            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;

    }

    public String coordoById(String id) throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "for $hotel in doc('data/entries_hotels.xml')/e:entries/e:entry where $hotel/e:ID = " + id + " return data(concat($hotel/e:longitude,\":\",$hotel/e:latitude))";

            BaseXClient.Query query = session.query(input);

            // loop through all results
            while (query.more()) {
                result = result + query.next() + "\n";
            }

            // close query instance
            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;

    }

    public String infoHotel() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";"
                    + "for $var in doc('data/entries_hotels.xml') /e:entries/e:entry where not(empty($var/e:longitude)) and  not(empty($var/e:latitude))"
                    + "return data(concat('<div id=infoBulle><p><b>', $var/e:name_fr,'</b><br /><img src=',subsequence($var/e:images/e:image,1,1),' width=200 height=200><br />', $var/e:address/e:address_line1, $var/e:address/e:address_line2,'<br />',$var/e:address/e:zip,'<br />', $var/e:address/e:city,'<br /> Telephone ',$var/e:phone,'<br /><a href=./hotel.html?hotel=',$var/e:ID,'>More info</a></p></div>', '#'))";

            BaseXClient.Query query = session.query(input);
            // loop through all results
            int i = 0;
            while (query.more()) { // le if est la pour ne pas avoir le null au debut de ma chaine
                if (i != 0) {
                    result = result + query.next();
                } else {
                    result = query.next();
                    i++;
                }
            }
            System.out.println(result);
            // close query instance

            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }

    public String stats() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";\n"
                    + "let $entries := doc('data/entries_hotels.xml')/e:entries/e:entry\n"
                    + "let $nombreHotel := count($entries)\n"
                    + "let $nombreHotelHandicapé := count($entries[e:options/e:option = 'Accès handicapés'])\n"
                    + "let $totalLangueParlee := count(distinct-values($entries/e:languages/e:language))\n"
                    + "let $totalNombrePaiment := count(distinct-values($entries/e:payments/e:payment))\n"
                    + "let $totalChambreHotel := sum($entries/e:living/e:room_count)\n"
                    + "let $prixMoyenChambre := avg($entries/e:tariffs/e:tariff/e:min)\n"
                    + "\n"
                    + "let $UneEtoile := $entries[e:standings_levels/e:standings_level = '1 étoile']\n"
                    + "let $nombreHotel1 := count($UneEtoile)\n"
                    + "let $nombreHotelHandicapé1 := count($UneEtoile[e:options/e:option = 'Accès handicapés'])\n"
                    + "let $totalLangueParlee1 := count(distinct-values($UneEtoile/e:languages/e:language))\n"
                    + "let $totalNombrePaiment1 := count(distinct-values($UneEtoile/e:payments/e:payment))\n"
                    + "let $totalChambreHotel1 := sum($UneEtoile/e:living/e:room_count)\n"
                    + "let $prixMoyenChambre1 := avg($UneEtoile/e:tariffs/e:tariff/e:min)\n"
                    + "\n"
                    + "let $DeuxEtoile := $entries[e:standings_levels/e:standings_level = '2 étoiles']\n"
                    + "let $nombreHotel2 := count($DeuxEtoile)\n"
                    + "let $nombreHotelHandicapé2 := count($DeuxEtoile[e:options/e:option = 'Accès handicapés'])\n"
                    + "let $totalLangueParlee2 := count(distinct-values($DeuxEtoile/e:languages/e:language))\n"
                    + "let $totalNombrePaiment2 := count(distinct-values($DeuxEtoile/e:payments/e:payment))\n"
                    + "let $totalChambreHotel2 := sum($DeuxEtoile/e:living/e:room_count)\n"
                    + "let $prixMoyenChambre2 := avg($DeuxEtoile/e:tariffs/e:tariff/e:min)\n"
                    + "\n"
                    + "let $TroisEtoile := $entries[e:standings_levels/e:standings_level = '3 étoiles']\n"
                    + "let $nombreHotel3 := count($TroisEtoile)\n"
                    + "let $nombreHotelHandicapé3 := count($TroisEtoile[e:options/e:option = 'Accès handicapés'])\n"
                    + "let $totalLangueParlee3 := count(distinct-values($TroisEtoile/e:languages/e:language))\n"
                    + "let $totalNombrePaiment3 := count(distinct-values($TroisEtoile/e:payments/e:payment))\n"
                    + "let $totalChambreHotel3 := sum($TroisEtoile/e:living/e:room_count)\n"
                    + "let $prixMoyenChambre3 := avg($TroisEtoile/e:tariffs/e:tariff/e:min)\n"
                    + "\n"
                    + "let $QuatreEtoile := $entries[e:standings_levels/e:standings_level = '4 étoiles']\n"
                    + "let $nombreHotel4 := count($QuatreEtoile)\n"
                    + "let $nombreHotelHandicapé4 := count($QuatreEtoile[e:options/e:option = 'Accès handicapés'])\n"
                    + "let $totalLangueParlee4 := count(distinct-values($QuatreEtoile/e:languages/e:language))\n"
                    + "let $totalNombrePaiment4 := count(distinct-values($QuatreEtoile/e:payments/e:payment))\n"
                    + "let $totalChambreHotel4 := sum($QuatreEtoile/e:living/e:room_count)\n"
                    + "let $prixMoyenChambre4 := avg($QuatreEtoile/e:tariffs/e:tariff/e:min)\n"
                    + "\n"
                    + "let $CinqEtoile := $entries[e:standings_levels/e:standings_level = '5 étoiles']\n"
                    + "let $nombreHotel5 := count( $CinqEtoile)\n"
                    + "let $nombreHotelHandicapé5 := count($CinqEtoile[e:options/e:option = 'Accès handicapés'])\n"
                    + "let $totalLangueParlee5 := count(distinct-values( $CinqEtoile/e:languages/e:language))\n"
                    + "let $totalNombrePaiment5 := count(distinct-values( $CinqEtoile/e:payments/e:payment))\n"
                    + "let $totalChambreHotel5 := sum( $CinqEtoile/e:living/e:room_count)\n"
                    + "let $prixMoyenChambre5 := avg( $CinqEtoile/e:tariffs/e:tariff/e:min)\n"
                    + "\n"
                    + "return\n"
                    + "<stat>\n"
                    + "<hotel>{$nombreHotel1}</hotel>\n"
                    + "<hotel>{$nombreHotel2}</hotel>\n"
                    + "<hotel>{$nombreHotel3}</hotel>\n"
                    + "<hotel>{$nombreHotel4}</hotel>\n"
                    + "<hotel>{$nombreHotel5}</hotel>\n"
                    + "<hotel>{$nombreHotel}</hotel>\n"
                    + "\n"
                    + "<handi>{$nombreHotelHandicapé1}</handi>\n"
                    + "<handi>{$nombreHotelHandicapé2}</handi>\n"
                    + "<handi>{$nombreHotelHandicapé3}</handi>\n"
                    + "<handi>{$nombreHotelHandicapé4}</handi>\n"
                    + "<handi>{$nombreHotelHandicapé5}</handi>\n"
                    + "<handi>{$nombreHotelHandicapé}</handi>\n"
                    + "\n"
                    + "<langue>{$totalLangueParlee1}</langue>\n"
                    + "<langue>{$totalLangueParlee2}</langue>\n"
                    + "<langue>{$totalLangueParlee3}</langue>\n"
                    + "<langue>{$totalLangueParlee4}</langue>\n"
                    + "<langue>{$totalLangueParlee5}</langue>\n"
                    + "<langue>{$totalLangueParlee}</langue>\n"
                    + "\n"
                    + "<chambre>{$totalChambreHotel1}</chambre>\n"
                    + "<chambre>{$totalChambreHotel2}</chambre>\n"
                    + "<chambre>{$totalChambreHotel3}</chambre>\n"
                    + "<chambre>{$totalChambreHotel4}</chambre>\n"
                    + "<chambre>{$totalChambreHotel5}</chambre>\n"
                     + "<chambre>{$totalChambreHotel}</chambre>\n"
                    + "\n"
                    + "<prix>{round($prixMoyenChambre1)}</prix>\n"
                    + "<prix>{round($prixMoyenChambre2)}</prix>\n"
                    + "<prix>{round($prixMoyenChambre3)}</prix>\n"
                    + "<prix>{round($prixMoyenChambre4)}</prix>\n"
                    + "<prix>{round($prixMoyenChambre5)}</prix>\n"
                    + "<prix>{round($prixMoyenChambre)}</prix>\n"
                    + "\n"
                    + "<paie>{$totalNombrePaiment1}</paie>\n"
                    + "<paie>{$totalNombrePaiment2}</paie>\n"
                    + "<paie>{$totalNombrePaiment3}</paie>\n"
                    + "<paie>{$totalNombrePaiment4}</paie>\n"
                    + "<paie>{$totalNombrePaiment5}</paie>\n"
                    + "<paie>{$totalNombrePaiment}</paie>\n"
                    + "\n"
                    + "</stat>";
            BaseXClient.Query query = session.query(input);
            // loop through all results
            int i = 0;
            while (query.more()) { // le if est la pour ne pas avoir le null au debut de ma chaine
                if (i != 0) {
                    result = result + query.next();
                } else {
                    result = query.next();
                    i++;
                }
            }
            System.out.println(result);
            // close query instance

            query.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        // close session
        this.session.close();

        return result;
    }
}
