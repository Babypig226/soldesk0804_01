package controller.loginout;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOutController extends HttpServlet implements Servlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/main.main")) { // 메인화면 띄우기
			CookieAction action = new CookieAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/main/main.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/login/login.main")) { // 로그인 클릭 시 로그인 페이지 이동
			RequestDispatcher dispatcher = req.getRequestDispatcher("/main/login.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/login/loginPro.main")) { 
			LoginProAction action = new LoginProAction();
			action.execute(req, resp);
		} else if (command.equals("/login/logOutPro.main")) {
			Cookie cookie = new Cookie("autoLogin", "");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			resp.addCookie(cookie);

			HttpSession session = req.getSession();
			session.invalidate();
			resp.sendRedirect("../main.main");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
