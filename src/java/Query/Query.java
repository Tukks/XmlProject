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

    public Query() throws IOException {
        super();
        this.session = new BaseXClient("localhost", 1984, "admin", "admin");
    }

    public String hotel() throws IOException {
        String result = "";

        try {
            // create query instance
            String input = "for $hotel in doc('data/entries_hotels.xml') return $hotel";
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
            String input = "for $var in doc('data/entries_hotels.xml') /entries/entry/latitude return data($var)";
            //for $var in doc('data/entries_hotels.xml') /entries/entry/longitude return data($var)";
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
            String input = "for $var in doc('data/entries_hotels.xml') /entries/entry/longitude return data($var)";
            //for $var in doc('data/entries_hotels.xml') /entries/entry/longitude return data($var)";
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
            String input = "for $hotel in doc('data/entries_hotels.xml')/entries/entry where $hotel/ID = " + id + " return $hotel";
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
            String input = "for $var in doc('data/entries_hotels.xml') /entries/entry where not(empty($var/longitude)) and  not(empty($var/latitude))"
                    + "return data(concat(\"<p>\", $var/name_fr,\"</p><p>\", $var/address/address_line1,\"</p><p>\", $var/address/address_line2,\"</p><p>\",$var/address/zip,\"</p><p>\", $var/address/city,\"</p>\", \":\"))";
            //for $var in doc('data/entries_hotels.xml') /entries/entry/longitude return data($var)";
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

    public static void main(String[] args) throws IOException {
        Query a = new Query();

        a.infoHotel();
    }
}
