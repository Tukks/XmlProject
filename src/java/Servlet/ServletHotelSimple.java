package Servlet;

import Query.Query;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import static java.lang.System.out;
import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;

/**
 * 
 * @author Nicolas
 */
public class ServletHotelSimple extends HttpServlet {

    public String XSLT_NAME = "xslt/hotel.xsl";
    public String COOR_RESULT = "hotelcoor";

    public String HTML_RESULT = "hotelresult";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws javax.servlet.ServletException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        ServletContext webApp = this.getServletContext();
       

        try {
            response.setContentType("text/html");
            String param = (String)request.getParameter("hotel"); // on récupére l'id de l'hotel dans l'url
            
            // Get concrete implementation
            TransformerFactory tFactory = TransformerFactory.newInstance();
            // Create a reusable templates for a particular stylesheet
            Templates templates = tFactory.newTemplates(new StreamSource(webApp.getRealPath(XSLT_NAME)));
            // Create a transformer
            Transformer transformer = templates.newTransformer();
            // Get concrete implementation
            DocumentBuilderFactory dFactory = DocumentBuilderFactory.newInstance();
            // Need a parser that support namespaces
            dFactory.setNamespaceAware(true);
            // Create the parser
            DocumentBuilder parser = dFactory.newDocumentBuilder();
            //Recupere l'id de l Hotel
            String id = request.getParameter("hotel");
            //Input source
            InputSource is = new InputSource(new StringReader(new Query().hotelById(id)));
            // Parse the XML document
            Document doc = parser.parse(is);
            //Create the stream that will receive the result of the transformation
            ByteArrayOutputStream htmlStreamResult = new ByteArrayOutputStream();            
            // Get the XML source
            Source xmlSource = new DOMSource(doc);      
            response.setContentType("text/html");
            // Transform input XML doc in HTML stream
            transformer.transform(xmlSource, new StreamResult(htmlStreamResult));
          
            request.setAttribute(HTML_RESULT, new Query().hotelById(param));
            String longitudeQuery = new Query().coordoById(param);
            String[] longitudeS = longitudeQuery.split(":");
            float[] coor = new float[longitudeS.length];
            for (int i = 0; i < longitudeS.length; i++) {
                coor[i] = Float.parseFloat(longitudeS[i]);
            }
            
            request.setAttribute(COOR_RESULT, coor);


            //Forward to the JSP
            webApp.getRequestDispatcher("/hotel.jsp").forward(request, response);
            
            
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return
     */
    @Override
    public String getServletInfo() {
        return "Hotel";
    }
}
