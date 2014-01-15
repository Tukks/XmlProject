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

    public static void main(String[] args) throws IOException {
        Query q = new Query();
        System.out.println(q.barChartXML());
    }

    private final BaseXClient session;

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
                    + "let $Néerlandais :=count($Doc/e:entries/e:entry/languages/e:language[text() eq 'Néerlandais'])\n"
                    + "let $Arabe :=count($Doc/e:entries/e:entry/languages/e:language[text() eq 'Arabe'])\n"
                    + "let $Finois :=count($Doc/e:entries/e:entry/languages/e:language[text() eq 'Finois'])\n"
                    + "let $Portugais :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Portugais'])\n"
                    + "let $Lituanien :=count($Doc/e:entries/e:entry/e:languages/e:language[text() eq 'Lituanien'])\n"
                    + "return\n"
                    + "\n"
                    + "<bar>\n"
                    + "<x>Anglais</x>\n"
                    + "<x>Allemand</x>\n"
                    + "<x>Espagnol</x>\n"
                    + "<x>Italien</x>\n"
                    + "<x>Russe</x>\n"
                    + "<x>Francais</x>\n"
                    + "<x>Néerlandais</x>\n"
                    + "<x>Arabe</x>\n"
                    + "<x>Finois</x>\n"
                    + "<x>Portugais</x>\n"
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
                    + "\n"
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
            String input = "declare namespace e = \"http://ref.otcnice.com/webservice/\";\n" +
"for $hotel in doc('data/entries_hotels.xml')/e:entries/e:entry where $hotel/e:ID = \"1024\" return $hotel";
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
}
