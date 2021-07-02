import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class AdminLoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            String sql = "select * from adminlogin where username = '" + username + "' and password ='" + password + "'";
            ResultSet rs = stm.executeQuery(sql);
            if(rs.next())
            {
                HttpSession session = request.getSession();
                session.setAttribute("username",username);
                session.setAttribute("uid",rs.getString("id"));
                response.sendRedirect("aDashboard.jsp");
            }
            else
            {
                response.getWriter().println("Login fail as Admin login");
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
