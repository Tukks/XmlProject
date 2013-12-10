package Query;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletConfig;
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
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;

/**
 * A servlet to display the animals.
 *
 * @author Philippe Poulard
 * @version
 */
public class Servlet extends HttpServlet {

    public final static String /**
             * The path to the stylesheet.
             */
            XSLT_PATH = "XML/hotels.xsl",
            /**
             * The path to the XML doc.
             */
            XML_PATH = "XML/hotels.xml",
            /**
             * The name of the HTML stream.
             */
            HTML_RESULT = "htmlResult";

    /**
     * Initializes the servlet.
     * @param config
     * @throws javax.servlet.ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext webApp = this.getServletContext();

        try {
            // Get concrete implementation
            TransformerFactory tFactory = TransformerFactory.newInstance();
            // Create a reusable templates for a particular stylesheet
            String filePath = webApp.getRealPath(XSLT_PATH);
            Templates templates = tFactory.newTemplates(new StreamSource(filePath));
            // Register the transformer to the Web app
            webApp.setAttribute(XSLT_PATH, templates);

            // Get concrete implementation
            DocumentBuilderFactory dFactory = DocumentBuilderFactory.newInstance();
            // Need a parser that support namespaces
            dFactory.setNamespaceAware(true);
            // Create the parser
            DocumentBuilder parser = dFactory.newDocumentBuilder();
            // Parse the XML document
            filePath = webApp.getRealPath(XML_PATH);
            Document doc = parser.parse(filePath);
            // Register the XML doc to the Web app
            webApp.setAttribute(XML_PATH, new DOMSource(doc));
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

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
            // Get the registered transformer
            Templates templates = (Templates) webApp.getAttribute(XSLT_PATH);
            // Create a transformer
            Transformer transformer = templates.newTransformer();

            // Create the stream that will receive the result of the transformation
            ByteArrayOutputStream htmlStreamResult = new ByteArrayOutputStream();

            // Get the registered XML source
            Source xmlSource = (Source) webApp.getAttribute(XML_PATH);

            // Get the parameter to sort the list of animals
            String sort = request.getParameter("liste-par-nom");
            if (sort != null) {
                transformer.setParameter("liste-par-nom", Boolean.TRUE);
            }
            // Transform input XML doc in HTML stream
            transformer.transform(xmlSource, new StreamResult(htmlStreamResult));

            // Forward to the JSP
            request.setAttribute(HTML_RESULT, htmlStreamResult);
            webApp.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (IOException ex) {
            throw new ServletException(ex);
        } catch (ServletException ex) {
            throw new ServletException(ex);
        } catch (TransformerException ex) {
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
     * @return 
     */
    @Override
    public String getServletInfo() {
        return "Hotels";
    }

}
