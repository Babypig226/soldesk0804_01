package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.glass.ui.Window;

public class MemberController extends HttpServlet implements Servlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/mem/memberAgree.mem")) { // 회원가입 버튼 클릭 시 약관 동의 페이지로 이동
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/agree.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/memberRegist.mem")) { // 약관 다 체크 후 회원가입 페이지로 이동
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/memberForm.jsp");
			dispatcher.forward(req, resp);

		} else if (command.equals("/mem/memberOk.mem")) { // 회원가입 성공시 일단 둘다 main.jsp로 이동
			MemberOkAction action = new MemberOkAction();
			action.execute(req);
			HttpSession session = req.getSession();
			if (session.getAttribute("logId") != null) {
				resp.sendRedirect("../main.main");
			} else {
				resp.sendRedirect("../main.main");
			}
		} else if (command.equals("/mem/myPage.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/myPage.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/comeHere.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/guideBook/comeHere.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/userConfirm.mem")) { // 아이디 중복확인 버튼 클릭 시 팝업 뜸
			MemberConfirmAction action = new MemberConfirmAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/userConfirm.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/memberJoinOk.mem")) { //
			System.out.println("프론트 컨트롤러입니다.");
			MemberJoinOkAction action = new MemberJoinOkAction();
			String path = action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/memberDetail.mem")) { // 내정보 클릭 시 내 상세 정보 나오게
			MemberDetailAction action = new MemberDetailAction();
			action.execute(req);
			String path = "/member/memberDetail.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/memberPw.mem")) { // 상세정보에서 수정 버튼클릭 시 비번 확인 으로 이동
			String path = "/member/memberInfoPw.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/memberInfoCng.mem")) { // 비번 확인을 하고 나면 회원정보 수정 페이지로 이동
			MemberInfoCngAction action = new MemberInfoCngAction();
			Integer i = action.execute(req);
			if (i == 1) {
				MemberDetailAction action1 = new MemberDetailAction();
				action1.execute(req);
				req.setAttribute("memChk", "true");
				String path = "/member/memberInfoPro.jsp";
				RequestDispatcher dispatcher = req.getRequestDispatcher(path);
				dispatcher.forward(req, resp);
			} else if (i == 0) {
				// req.setAttribute("chk", 0);
				resp.sendRedirect("memberPw.mem");
			}
		} else if (command.equals("/mem/memberInfoModifyPro.mem")) { // 수정페이지에서 수정 다 하고 나서 수정 버튼 클릭 시
			MemberInfoModifyAction action = new MemberInfoModifyAction();
			action.execute(req);
			if (req.getParameter("memChk") != null && req.getParameter("memChk").equals("true")) {
				resp.sendRedirect("memberDetail.mem");
			} else {
				resp.sendRedirect("memberInfo.mem?userId=" + req.getParameter("id"));
			}
		} else if (command.equals("/mem/memberPwForm.mem")) { // 내 상세정보 비밀번호 버튼 클릭 시 비밀번호 확인
			String path = "/member/pwModify.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/pwModify1.mem")) { // 비밀번호 확인 후 동일 비번이면 비번 바꾸는 페이지로 이동, 비번 틀리면 비번 확인 페이지 뜸
			PwModifyAction action = new PwModifyAction();
			Integer i = action.execute(req);
			if (i == 1) {
				String path = "/member/pwModify_1.jsp";
				RequestDispatcher dispatcher = req.getRequestDispatcher(path);
				dispatcher.forward(req, resp);
			} else if (i == 0) {
				resp.sendRedirect("memberPwForm.mem");
			}
		} else if (command.equals("/mem/pwModifyPro.mem")) { // 비밀번호 변경 버튼 클릭 시 비번 바꾸고 메인 총총
			PwModifyProAction action = new PwModifyProAction();
			Integer i = action.execute(req);
			if (i == 1) {
				String path = "/member/pwModifyOk.jsp";
				RequestDispatcher dispatcher = req.getRequestDispatcher(path);
				dispatcher.forward(req, resp);
			} else if (i == 0) {
				resp.sendRedirect("memberPwForm.mem");
			}
		} else if (command.equals("/mem/memberUserDel.mem")) { // memberDetail.jsp 탈퇴 버튼 클릭 시 비번 확인
			String path = "/member/userDeletePw.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/memberUserDelPro.mem")) {
			MemberUserDelAction action = new MemberUserDelAction();
			action.execute(req);
			resp.sendRedirect("../login/logOutPro.main");
//		} else if (command.equals("/mem/memberInfo.mem")) {
//			MemberInfoAction action = new MemberInfoAction();
//			action.execute(req);
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/memberInfo.jsp");
//			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/idCk.mem")) { // 로그인 화면에서 아이디 찾기 누르면 아이디 찾기 페이지 뜸
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/idCk.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/mem/idCkPro.mem")) { // 이메일 정보 입력하고 버튼 클릭 시
			IdCkProAction action = new IdCkProAction();
			Integer i = action.execute(req);
			if (i == 1) {// 아이디가 있습니다.
				RequestDispatcher dispatcher = req.getRequestDispatcher("/member/idConfirm.jsp");
				dispatcher.forward(req, resp);
			} else {// 아이디가 없습니다.
				resp.sendRedirect("idCk.mem");
			}
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
