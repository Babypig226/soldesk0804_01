package controller.concerts;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ConcertsDAO;
import model.DTO.ConcertsDTO;

public class CctDelete {

	public void execute(HttpServletRequest request) {
		String cctNum = request.getParameter("num");
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		String path = "/concert_board/upload";
		String realPath = request.getServletContext().getRealPath(path);
		ConcertsDAO dao = new ConcertsDAO();
		ConcertsDTO dto = dao.detail(cctNum); 
		int i = dao.delete(cctNum);
		if (i>=1) {
			File file1 = new File(realPath + "/" + dto.getStrDetail());
			if(file1.exists()) {
				file1.delete();
			}
			File file2 = new File(realPath + "/" + dto.getStrPoster());
			if(file2.exists()) {
				file2.delete();
			}
		}
		
	}
	

}
