package userinput;

import java.io.IOException;
import java.net.URLEncoder;

import DatabaseDAO.UpdateUserProfileDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import javabean.UserDataBean;

@SuppressWarnings("serial")
@WebServlet("/update")
@MultipartConfig(maxFileSize = 16177215)  // 16MB
public class UpdateUserProfile extends HttpServlet {

	UserDataBean pb = null;
	UpdateUserProfileDao pdao = null;

	public void init() {
		pb = new UserDataBean();
		pdao = new UpdateUserProfileDao();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String uname = req.getParameter("uname");
		String email = req.getParameter("email");
		long phno = Long.parseLong(req.getParameter("phno"));
		Part filePart = req.getPart("profileImage");
		
		//Storing into UserBean
		pb.setFname(fname);
		pb.setLname(lname);
		pb.setUsername(uname);
		pb.setEmail(email);
		pb.setPhno(phno);
		
		//Storing Image into UserBean
		if (filePart != null) {
            pb.setImage(filePart.getInputStream());
        }

		
		int k = pdao.update(pb);
		if (k > 0) {
			resp.sendRedirect("view?msg=" + URLEncoder.encode("*Profile Updated Successfully", "UTF-8")
		    + "&username=" + URLEncoder.encode(uname, "UTF-8"));

		} else {
			resp.sendRedirect("view?msg=" + URLEncoder.encode("*Details Not Updated", "UTF-8")
		    + "&username=" + URLEncoder.encode(uname, "UTF-8"));
		}
	}
}
