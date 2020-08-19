package controller.centerBoard;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.CenterBoardDAO;
import model.DTO.CenterBoardDTO;

public class CenterBoardModifyAction {
	public String execute(HttpServletRequest request) {
		String realPath = request.getServletContext().getRealPath("/center/upload");
		int limitSize = 1024 * 1024 * 5;
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		CenterBoardDTO dto = new CenterBoardDTO();
		CenterBoardDAO dao = new CenterBoardDAO();
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			dto.setCenterContent(multi.getParameter("centerContent"));
			dto.setBoardNum(Long.parseLong(multi.getParameter("boardNum")));
			dto.setCenterPass(multi.getParameter("centerPass"));
			dto.setCenterSubject(multi.getParameter("centerSubject"));
			dto.setCenterId(userId);
			dao.cenContentUpdate(dto);
			if (multi.getFile("fileUp") == null) {
				if (!multi.getParameter("fileDel").trim().equals("")) {
					dto.setOriginalFileName("");
					dto.setStoreFileName("");
					dto.setFileSize(0L);
					int i = dao.fileUpdate(dto);
					if (i >= 1) {
						String fl = multi.getParameter("fileDel");
						File file = new File(realPath + "/" + fl);
						if (file.exists())
							file.delete();
					}
				} else{
					System.out.println("수정 할 파일이 없습니다.");
				}
			} else {
				dto.setOriginalFileName(multi.getOriginalFileName("fileUp"));
				dto.setStoreFileName(multi.getFilesystemName("fileUp"));
				File file = multi.getFile("fileUp");
				dto.setFileSize(file.length());
				int i = dao.fileUpdate(dto);
				if (i >= 1) {
					String fl = multi.getParameter("fileDel");
					file = new File(realPath + "/" + fl);
					if (file.exists())
						file.delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return multi.getParameter("boardNum");
	}
}
