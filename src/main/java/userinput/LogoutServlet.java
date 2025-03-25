package userinput;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/public/html/logout")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Invalidating the session
        HttpSession session = req.getSession(false); // Get session if exists, else return null
        if (session != null) {
            session.invalidate(); // Destroy session
        }

        
        req.setAttribute("msg", "<div class='logout-success'>You have successfully logged out.</div>");
        req.getRequestDispatcher("userlogin.jsp").forward(req, res);
    }
}
