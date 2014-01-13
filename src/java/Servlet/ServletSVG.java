/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
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
/**
 *
 * @author MoMo
 */
public class ServletSVG extends HttpServlet {

    public String XSLT_PATH = "svg/ex/bar.xsl";

    public String XML_PATH = "svg/ex/sample.xml";

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
            Document doc = parser.parse(webApp.getRealPath(XML_PATH));
            // Get the XML source
            Source xmlSource = new DOMSource(doc);

            response.setContentType("image/svg+xml");
            // Transform input XML doc in HTML stream
            transformer.transform(xmlSource, new StreamResult(response.getWriter()));
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
      
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
