package Query;

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

public class Servlet extends HttpServlet {

    public String XSLT_PATH = "XML/hotels.xsl";

    public String XML_PATH = "XML/hotels.xml";

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
            // Get concrete implementation
            TransformerFactory tFactory = TransformerFactory.newInstance();
            // Create a reusable templates for a particular stylesheet
            Templates templates = tFactory.newTemplates(new StreamSource(webApp.getRealPath(XSLT_PATH)));
            // Create a transformer
            Transformer transformer = templates.newTransformer();

            // Get concrete implementation
            DocumentBuilderFactory dFactory = DocumentBuilderFactory.newInstance();
            // Need a parser that support namespaces
            dFactory.setNamespaceAware(true);
            // Create the parser
            DocumentBuilder parser = dFactory.newDocumentBuilder();
            // Parse the XML document
            Document doc = parser.parse(new Query().hotel());
            // Get the XML source
            Source xmlSource = new DOMSource();

            response.setContentType("text/html");
            // Transform input XML doc in HTML stream
            transformer.transform(xmlSource, new StreamResult(response.getWriter()));
            
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
        return "XSLT";
    }
}
