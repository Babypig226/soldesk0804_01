package controller.centerBoard;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.CenterBoardDAO;
import model.DTO.CenterBoardDTO;

public class CenterBoardWriteAction {
	public void execute(HttpServletRequest request) {
		String filePath = "/center/upload";
		String realPath = request.getServletContext().getRealPath(filePath);
		int fileSize = 1024 * 1024 * 5;
		String ipAddr = request.getRemoteAddr();

		HttpSession session = request.getSession();
		String centerId = (String) session.getAttribute("logId");

		CenterBoardDTO dto = new CenterBoardDTO();
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileSize, "utf-8",
					new DefaultFileRenamePolicy());
			dto.setCenterContent(multi.getParameter("centerContent"));
			dto.setCenterPass(multi.getParameter("centerPass"));
			dto.setCenterSubject(multi.getParameter("centerSubject"));
			dto.setCenterName(multi.getParameter("centerName"));
			dto.setIpAddr(ipAddr);
			dto.setCenterId(centerId);
			dto.setOriginalFileName(multi.getOriginalFileName("fileUp"));
			dto.setStoreFileName(multi.getFilesystemName("fileUp"));
			
			File file = multi.getFile("fileUp");
			dto.setFileSize(file.length());
		} catch (Exception e) {
			e.printStackTrace();
		}
		CenterBoardDAO dao = new CenterBoardDAO();
		dao.cenInsert(dto);
	}

}
