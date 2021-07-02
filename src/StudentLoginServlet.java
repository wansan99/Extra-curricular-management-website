import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class StudentLoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");


            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                Statement stm = conn.createStatement();
                String sql = "select * from studentlogin where username = '" + username + "' and password ='" + password + "'";
                ResultSet rs = stm.executeQuery(sql);
                if(rs.next())
                {
                    HttpSession session = request.getSession();
                    session.setAttribute("username",username);
//                    addstudentfullname
                    session.setAttribute("sid",rs.getString("id"));
//                    response.sendRedirect("dashboard.jsp?sid="+ rs.getString("id"));
                    response.sendRedirect("dashboard.jsp");
                }
                else
                {
                    response.sendRedirect("index.jsp");
                }
            }
            catch (Exception ex) {
                ex.printStackTrace();
            }

//        Map<String, String> errors = new HashMap<String, String>();
//
//        String origin = request.getParameter("origin");
//        if (origin does not validate) {
//            errors.put("origin", "Put error message here.");
//        }
//
//        // Repeat for all parameters.
//
//        if (errors.isEmpty()) {
//            // No errors, redirect to Amtrak.
//            response.sendRedirect("http://amtrak.com");
//        } else {
//            // Put errors in request scope and forward back to JSP.
//            request.setAttribute("errors", errors);
//            request.getRequestDispatcher("FareFinder.jsp").forward(request, response);
//        }
        }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
