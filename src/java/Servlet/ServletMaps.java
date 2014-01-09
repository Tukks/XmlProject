/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Query.Query;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MoMo
 */
public class ServletMaps extends HttpServlet {

    public String LATITUDE_RESULT = "latituderesult";
    public String LONGITUDE_RESULT = "longituderesult";
    public String HOTEL_INFO = "hotelinfo";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext webApp = this.getServletContext();

        try {

            HttpSession session = request.getSession();

            String latitudeQuery = new Query().latitudeMaps();
            String[] latitudeS = latitudeQuery.split("\\s");
            float[] latitude = new float[latitudeS.length];
            for (int i = 0; i < latitudeS.length; i++) {
                latitude[i] = Float.parseFloat(latitudeS[i]);
            }
            String longitudeQuery = new Query().longitudeMaps();
            String[] longitudeS = longitudeQuery.split("\\s");
            float[] longitude = new float[longitudeS.length];
            for (int i = 0; i < longitudeS.length; i++) {
                longitude[i] = Float.parseFloat(longitudeS[i]);
            }
            String hotelinfoQuery = new Query().infoHotel();
            String[] hotelInfoEns = hotelinfoQuery.split("#");
            session.setAttribute("hotelinfo", hotelInfoEns);

            session.setAttribute("latituderesult", latitude);
            session.setAttribute("longituderesult", longitude);

            RequestDispatcher dispatcher = webApp.getRequestDispatcher("/maps.jsp");

            response.setContentType("text/html");
            dispatcher.forward(request, response);

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

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
        return "Hotels";
    }

}
