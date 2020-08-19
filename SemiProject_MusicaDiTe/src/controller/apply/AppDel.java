package controller.apply;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import model.DAO.ApplyDAO;
import model.DTO.ApplyDTO;
import javax.servlet.http.HttpSession;

public class AppDel {

	public void execute(HttpServletRequest request) {
		String appTempNum = request.getParameter("num");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		String path = "/ApplyForm/upload";
		String realPath = request.getServletContext().getRealPath(path);
		ApplyDAO dao = new ApplyDAO();
		ApplyDTO dto = dao.appSel(appTempNum, userId);
		int i = dao.applyDel(appTempNum);
		if(i >= 1) {
		File file1 = new File(realPath + "/" + dto.getStrCrDoc());
		if(file1.exists()) { file1.delete();}
		File file2 = new File(realPath + "/" + dto.getStrEduDoc());
		if(file2.exists()) { file2.delete();}
		File file3 = new File(realPath + "/" + dto.getStrIdCard());
		if(file3.exists()) { file3.delete();}
		File file4 = new File(realPath + "/" + dto.getStrIdP());
		if(file4.exists()) { file4.delete();}
		}
		
	}

}
