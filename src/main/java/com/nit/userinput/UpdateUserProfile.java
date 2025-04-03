package com.nit.userinput;

import java.io.IOException;
import java.io.InputStream;

import com.nit.databasedao.UpdateUserProfileDao;
import com.nit.javabean.UserDataBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/update")
@MultipartConfig(maxFileSize = 16177215) // for file size limit
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

        InputStream inputStream = null; 
        Part filePart = req.getPart("profilePic"); 

        if (filePart != null && filePart.getSize() > 0) {
            inputStream = filePart.getInputStream();
        }

        pb.setFname(fname);
        pb.setLname(lname);
        pb.setUsername(uname);
        pb.setEmail(email);
        pb.setPhno(phno);
        pb.setProfilePic(inputStream); // Set profile picture

        int k = pdao.update(pb);
        if (k > 0) {
            req.setAttribute("msg", "Details Updated Successfully");
            System.out.println("Details updated.");
        } else {
            req.setAttribute("msg", "Details Not Updated");
        }

        req.getRequestDispatcher("/public/html/ViewUpdateUserProfile.jsp").forward(req, resp);
    }
}
