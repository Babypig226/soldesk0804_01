package controller.auditionNotice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.AuditionNoticeDAO;
import model.DTO.AuditionNoticeDTO;

public class ANInsert {

	public void execute(HttpServletRequest request) {
		String path = "/management_board/upload";
		String realPath = request.getServletContext().getRealPath(path);
		int limitSize = 1024*1024*10;
		AuditionNoticeDTO dto = new AuditionNoticeDTO();
		
		
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			dto.setAuditionNoticeApperiod(multi.getParameter("auditionApperiod"));
			dto.setAuditionNoticeCategory(multi.getParameter("auditionCategory"));
			dto.setAuditionNoticeLocation(multi.getParameter("auditionLocation"));
			dto.setAuditionNoticeSelnum(Integer.parseInt(multi.getParameter("auditionSelnum")));
			dto.setAuditionNoticeTitle(multi.getParameter("auditionTitle"));
			dto.setApplyCondition(multi.getParameter("applyCondition"));
			dto.setAuditionContent(multi.getParameter("auditionContent"));
			dto.setImage(multi.getFilesystemName("fileup"));
			dto.setAuditionDate(multi.getParameter("auditionDate"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		AuditionNoticeDAO dao = new AuditionNoticeDAO();
		dao.noticeInsert(dto);
		
	}

}
