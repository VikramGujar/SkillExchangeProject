package userinput;

import java.io.IOException;
import java.sql.Blob;

import DatabaseDAO.UserProfileImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/userImage")
public class UserProfileImage extends HttpServlet {

	// Creating Class Ref
	UserProfileImageDAO userImgDao;

	public void init() {
		// Creating Object for DAO
		userImgDao = new UserProfileImageDAO();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			if (userImgDao == null) {
				userImgDao = new UserProfileImageDAO();
			}

			String username = req.getParameter("username");

			Blob imageBlob = userImgDao.getImage(username);

			if (imageBlob != null) {
				byte[] imgBytes = imageBlob.getBytes(1, (int) imageBlob.length());
				res.setContentType("image/jpeg");
				res.getOutputStream().write(imgBytes);
			} else {
				// Send a default image if user has no profile pic
				res.sendRedirect(req.getContextPath() + "/public/assets/image/profile/profile.png");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
