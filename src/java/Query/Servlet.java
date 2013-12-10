/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 *
 * @author MoMo
 */
public class Servlet extends HttpServlet {

    public String XSLT_NAME = "XML/";
    public String XML_NAME = "XML/entrier_hotels.xml";
    public String HTML_RESULT = "htmlResult";

    /**
     * Initializes the servlet.
     *
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
            String filePath = webApp.getRealPath(this.getInitParameter(XSLT_NAME));
            Templates templates = tFactory.newTemplates(new StreamSource(filePath));
            // Register the transformer to the Web app
            webApp.setAttribute(XSLT_NAME, templates);

            // Get concrete implementation
            DocumentBuilderFactory dFactory = DocumentBuilderFactory.newInstance();
            // Need a parser that support namespaces
            dFactory.setNamespaceAware(true);
            // Create the parser
            DocumentBuilder parser = dFactory.newDocumentBuilder();
            // Parse the XML document
            filePath = webApp.getRealPath(this.getInitParameter(XML_NAME));
            Document doc = parser.parse(filePath);
            // Register the XML doc to the Web app
            webApp.setAttribute(XML_NAME, new DOMSource(doc));
        } catch (TransformerConfigurationException ex) {
            throw new ServletException(ex);
        } catch (ParserConfigurationException ex) {
            throw new ServletException(ex);
        } catch (SAXException ex) {
            throw new ServletException(ex);
        } catch (IOException ex) {
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
            Templates templates = (Templates) webApp.getAttribute(XSLT_NAME);
            // Create a transformer
            Transformer transformer = templates.newTransformer();

            // Create the stream that will receive the result of the transformation
            ByteArrayOutputStream htmlStreamResult = new ByteArrayOutputStream();

            // Get the registered XML source
            Source xmlSource = (Source) webApp.getAttribute(XML_NAME);

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
     * @param response servlet respon
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
     */
    @Override
    public String getServletInfo() {
        return "Zoo";
    }

}
