package controller.artists;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtistsController extends HttpServlet implements Servlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		String path;
		if(command.equals("/arts/artsList.arts")) {
			ArtistsList action = new ArtistsList();
			action.execute(request);
			path = "/management_board/artist_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);						
		}
		else if(command.equals("/arts/newArtistsRegist.arts")) {
			path = "/management_board/artist_write.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);						
			}
		else if(command.equals("/arts/artsRegisterPro.arts")) {
			ArtsRegPro action = new ArtsRegPro();
			action.execute(request);
			response.sendRedirect("artsList.arts");
		}
		else if(command.equals("/arts/artistDetailView.arts")) {
			ArtistsDetail action = new ArtistsDetail();
			action.execute(request);
			path = "/management_board/artist_view_detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);						
		}
		else if(command.equals("/arts/artistDetailViewCst.arts")) {
			ArtistsDetail action = new ArtistsDetail();
			action.execute(request);
			path = "/management_board/artist_view_detail_customer.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);						
		}
		else if(command.equals("/arts/artsDelete.arts")) {
			ArtistsDel action = new ArtistsDel();
			action.execute(request);
			response.sendRedirect("artsList.arts");
		}
		else if(command.equals("/arts/artsModify.arts")) {
			ArtistsDetail action = new ArtistsDetail();
			action.execute(request);
			path = "/management_board/artist_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);						
			
		}
		else if(command.equals("/arts/artsModPro.arts")) {
			ArtistsMod action = new ArtistsMod();			
			Long num = action.execute(request);
			response.sendRedirect("artistDetailView.arts?num="+num);			
		}
		else if(command.equals("/arts/artsListByinstrument.arts")) {
			InstrumentSel action = new InstrumentSel();
			action.execute(request);
			path = "/management_board/artist_list_instr.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);						
			
		}
		
		}
		

}
