package controller.centerBoard;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.CenterBoardDAO;
import model.DTO.CenterBoardDTO;

public class CenterBoardDelAction {
	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		String centerPass =
				request.getParameter("centerPass");
		HttpSession session = request.getSession();
		String userId= 
				(String)session.getAttribute("logId");
		CenterBoardDAO dao = new CenterBoardDAO();
		List<CenterBoardDTO> list =
				dao.cenSelectAll(1, 1, boardNum);
		int i = dao.centerboardDelete(boardNum,centerPass,
												userId );
		if(i >= 1) {
			String path = request.getServletContext()
					 .getRealPath("/center/upload");
			File file = 
				new File(path + "/" + list.get(0)
				                    .getStoreFileName() );
			if(file.exists()) file.delete();	
		}
	}
}

