package com.java.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.dao.AdminLoginDao;
import com.java.dao.ConstitutionDao;
import com.java.dao.ConstitutionLogin;
import com.java.dao.DivisionDao;
import com.java.dao.DivisionLogin;
import com.java.dao.EditAdminDao;
import com.java.dao.EditConstitutionDao;
import com.java.dao.EditDivisionDao;
import com.java.dao.EditProblemDao;
import com.java.dao.ProblemDao;
import com.java.userbean.Userbean;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");

		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String constitution = request.getParameter("constitution");
		String division = request.getParameter("division");
		String firstname = request.getParameter("firstname");
		String middlename = request.getParameter("middlename");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String problemtype = request.getParameter("problemtype");
		String textarea = request.getParameter("textarea");

		Userbean user = new Userbean();
		Userbean user1 = new Userbean();

		if (name.equals("admin")) {
			if ((username != null) && (password != null)) {
				user.setUsername(username);
				user.setPassword(password);
				AdminLoginDao.insert(user);
				Boolean adminstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (adminstatus) {
					HttpSession session = request.getSession(true);
					session.setAttribute("AdminSession", user);
					response.sendRedirect("AdminHome.jsp");
				} else {
					response.sendRedirect("AdminLoginFailure.jsp");
				}
			} else {

				response.sendRedirect("AdminLoginFailure.jsp");

			}

		} else if (name.equals("division")) {
			if ((username != null) && (password != null)) {
				user.setUsername(username);
				user.setPassword(password);

				DivisionLogin.insert(user);
				Boolean adminstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (adminstatus) {
					HttpSession session = request.getSession(true);
					session.setAttribute("DivisionSession", user);
					response.sendRedirect("DivisionHome.jsp");
				} else {
					response.sendRedirect("DivisionLoginFailure.jsp");
				}
			} else {
				response.sendRedirect("DivisionLoginFailure.jsp");
			}

		} else if (name.equals("constitution")) {
			if ((username != null) && (password != null)) {
				user.setUsername(username);
				user.setPassword(password);

				ConstitutionLogin.insert(user);
				Boolean adminstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (adminstatus) {
					HttpSession session = request.getSession(true);
					session.setAttribute("ConstitutionSession", user);
					response.sendRedirect("ConstitutionHome.jsp");
				} else {
					response.sendRedirect("ConstitutionLoginFailure.jsp");
				}

			} else {
				response.sendRedirect("ConstitutionLoginFailure.jsp");

			}
		} else if (name.equals("conreg")) {

			if ((constitution != null) && (username != null) && (password != null) && (firstname != null)
					&& (lastname != null) && (email != null) && (gender != null) && (mobile != null)) {

				user.setConstitution(constitution);
				user.setFirstname(firstname);
				user.setMiddlename(middlename);
				user.setLastname(lastname);
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);
				user.setGender(gender);
				user.setMobile(Long.parseLong(mobile));
				ConstitutionDao.insert(user);
				Boolean regstatus1 = user.isValid1();
				if (regstatus1) {
					Boolean regstatus = user.isValid();
					// System.out.println("adminstatus:::"+adminstatus);
					if (regstatus) {

						user1.setValid(true);
						
						try {
							Email1.mail(user);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						response.sendRedirect("AdminHome2.jsp");
					} else {
						user1.setValid(false);
						response.sendRedirect("AddConstitutions2.jsp");
					}
				}
				else {

					response.sendRedirect("AddConstitutions1.jsp");
				}
			} else {

				response.sendRedirect("AddConstitutions1.jsp");
			}

		} else if (name.equals("divreg")) {

			if ((constitution != null) && (division != null) && (username != null) && (password != null)
					&& (firstname != null) && (lastname != null) && (email != null) && (gender != null)
					&& (mobile != null)) {

				user.setConstitution(constitution);
				user.setDivision(division);
				user.setFirstname(firstname);
				user.setMiddlename(middlename);
				user.setLastname(lastname);
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);
				user.setGender(gender);
				user.setMobile(Long.parseLong(mobile));
				DivisionDao.insert(user);
				Boolean regstatus1 = user.isValid1();
				System.out.println(regstatus1);
				if (regstatus1) {
					Boolean regstatus = user.isValid();
					// System.out.println("adminstatus:::"+adminstatus);
					if (regstatus) {
						try {
							Email1.mail(user);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						response.sendRedirect("AdminHome3.jsp");
					} else {
						response.sendRedirect("AddDivisions1.jsp");
					}

				} else {

					response.sendRedirect("AddDivisions2.jsp");
				}
			} else {

				response.sendRedirect("AddDivisions1.jsp");
			}

		} else if (name.equals("regProblem")) {

			if ((constitution != null) && (division != null) && (firstname != null) && (lastname != null)
					&& (email != null) && (gender != null) && (mobile != null) && (problemtype != null)
					&& (textarea != null)) {

				user.setConstitution(constitution);
				user.setDivision(division);
				user.setFirstname(firstname);
				user.setMiddlename(middlename);
				user.setLastname(lastname);
				user.setEmail(email);
				user.setGender(gender);
				user.setMobile(Long.parseLong(mobile));
				user.setProblemtype(problemtype);
				user.setTextarea(textarea);
				ProblemDao.insert(user);
				Boolean regstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (regstatus) {

					response.sendRedirect("DivisionHome1.jsp");
				} else {
					response.sendRedirect("AddProblems1.jsp");
				}

			} else {
				response.sendRedirect("AddProblems.jsp");
			}
		} else if (name.equals("EditProblem")) {
			System.out.println(firstname);
			System.out.println(middlename);
			if ((firstname != null) && (lastname != null) && (mobile != null) && (email != null)
					&& (constitution != null) && (division != null) && (problemtype != null) && (textarea != null)) {

				user.setFirstname(firstname);
				user.setMiddlename(middlename);
				user.setLastname(lastname);
				user.setEmail(email);
				user.setMobile(Long.parseLong(mobile));

				user.setConstitution(constitution);
				user.setDivision(division);

				user.setProblemtype(problemtype);
				user.setTextarea(textarea);
				EditProblemDao.insert(user);
				Boolean regstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (regstatus) {

					response.sendRedirect("ViewDivisionProblems1.jsp");
				} else {
					// System.out.println("null");
					response.sendRedirect("ViewDivisionProblems.jsp");
				}

			} else {
				// System.out.println("failed");
				response.sendRedirect("EditProblem.jsp");
			}
		} else if (name.equals("editconsprofile")) {

			if ((constitution != null) && (username != null) && (password != null) && (firstname != null)
					&& (lastname != null) && (email != null) && (mobile != null)) {

				user.setConstitution(constitution);
				user.setFirstname(firstname);
				user.setMiddlename(middlename);
				user.setLastname(lastname);
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);

				user.setMobile(Long.parseLong(mobile));
				EditConstitutionDao.insert(user);
				Boolean regstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (regstatus) {
					HttpSession session = request.getSession(true);
					session.setAttribute("ConstitutionSession", user);
					response.sendRedirect("ConstitutionHome1.jsp");
				} else {
					response.sendRedirect("ConstitutionProfile1.jsp");
				}
			} else {

				response.sendRedirect("ConstitutionProfile1.jsp");
			}

		} else if (name.equals("editdivprofile")) {

			if ((constitution != null) && (division != null) && (username != null) && (password != null)
					&& (firstname != null) && (lastname != null) && (email != null) && (mobile != null)) {

				user.setConstitution(constitution);
				user.setDivision(division);
				user.setFirstname(firstname);
				user.setMiddlename(middlename);
				user.setLastname(lastname);
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);

				user.setMobile(Long.parseLong(mobile));
				EditDivisionDao.insert(user);
				Boolean regstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (regstatus) {
					HttpSession session = request.getSession(true);
					session.setAttribute("DivisionSession", user);
					response.sendRedirect("DivisionHome2.jsp");
				} else {
					response.sendRedirect("DivisionProfile1.jsp");
				}
			} else {

				response.sendRedirect("DivisionProfile1.jsp");
			}
		} else if (name.equals("editadminprofile")) {

			if ((username != null) && (password != null) && (firstname != null) && (lastname != null) && (email != null)
					&& (mobile != null) && (id != null)) {

				user.setId(Integer.parseInt(id));
				user.setFirstname(firstname);
				user.setMiddlename(middlename);
				user.setLastname(lastname);
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);

				user.setMobile(Long.parseLong(mobile));
				EditAdminDao.insert(user);
				Boolean regstatus = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (regstatus) {
					HttpSession session = request.getSession(true);
					session.setAttribute("AdminSession", user);
					response.sendRedirect("AdminHome1.jsp");
				} else {
					response.sendRedirect("AdminProfile1.jsp");
				}
			} else {

				response.sendRedirect("AdminProfile1.jsp");
			}
		}

	}
}
