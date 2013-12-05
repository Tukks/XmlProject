package BDD;

import java.io.*;

public class BDD {
     public static void main(final String[] args) {
    try {
      // initialize timer
      final long time = System.nanoTime();

      // create session
      final BaseXClient session = new BaseXClient("localhost", 1984, "admin", "admin");

      // version 1: perform command and print returned string
      System.out.println(session.execute("info"));

      // version 2 (faster): perform command and pass on result to output stream
      final OutputStream out = System.out;
      session.execute("xquery 1 to 10", out);

      // close session
      session.close();

      // print time needed
      final double ms = (System.nanoTime() - time) / 1000000d;
      System.out.println("\n\n" + ms + " ms");

    } catch(final IOException ex) {
      // print exception
      ex.printStackTrace();
    }
  }
    
}