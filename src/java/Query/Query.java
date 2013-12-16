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

    public Query() {
        super();
    }

    public String hotel() {
        String result = "";

        try {
            // create session
            BaseXClient session = new BaseXClient("localhost", 1984, "admin", "admin");

            try {
                // create query instance
                String input = "for $project in doc('data/entries_hotels.xml') /entries/entry/name_fr return $project";
                BaseXClient.Query query = session.query(input);
                
                // loop through all results
                while (query.more()) {
                    result = result + query.next() +"\n";
                }

                // print query info
                System.out.println(query.info());

                // close query instance
                query.close();

            } catch (final IOException ex) {
                // print exception
                ex.printStackTrace();
            }

            // close session
            session.close();

        } catch (final IOException ex) {
            // print exception
            ex.printStackTrace();
        }

        return result;
    }
}
