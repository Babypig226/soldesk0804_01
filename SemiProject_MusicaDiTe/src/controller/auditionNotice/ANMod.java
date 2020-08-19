package controller.auditionNotice;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.AuditionNoticeDAO;
import model.DTO.AuditionNoticeDTO;
//import javax.servlet.http.HttpSession;

public class ANMod {
	public String execute(HttpServletRequest request) {
		String num = "";
		String path = "/management_board/upload";
		String realPath = request.getServletContext().getRealPath(path);
		int limitSize = 1024*1024*10;
//		HttpSession session = request.getSession();
//		String employeeId = (String)session.getAttribute("");
		AuditionNoticeDTO dto = new AuditionNoticeDTO();
		AuditionNoticeDAO dao = new AuditionNoticeDAO();
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			dto.setApplyCondition(multi.getParameter("applyCondition"));
			dto.setAuditionContent(multi.getParameter("auditionContent"));
			dto.setAuditionDate(multi.getParameter("auditionDate"));
			dto.setAuditionNoticeApperiod(multi.getParameter("auditionApperiod"));
			dto.setAuditionNoticeCategory(multi.getParameter("auditionCategory"));
			dto.setAuditionNoticeLocation(multi.getParameter("auditionLocation"));
			dto.setAuditionNoticeNum(Integer.parseInt(multi.getParameter("auditionNoticeNum")));
			num = multi.getParameter("auditionNoticeNum");
			dto.setAuditionNoticeSelnum(Integer.parseInt(multi.getParameter("auditionSelnum")));
			dto.setAuditionNoticeTitle(multi.getParameter("auditionTitle"));
			dao.contentUpdate(dto);
//			dto.setEmployeeId(employeeId);
			if(multi.getFile("fileup") == null) {
				if(!multi.getParameter("fileDel").trim().equals("")) {
					dto.setImage("");
					int i = dao.ANImgUpdate(dto);
					if(i>= 1) {
						String fl = multi.getParameter("fileDel");
						File file = new File(realPath+"/"+fl);
						if(file.exists()) {file.delete();}								
					}
				}
			}else {
				dto.setImage(multi.getFilesystemName("fileup"));
				File file = new File("fileup");
				dao.ANImgUpdate(dto);
				System.out.println("수정된 이미지 정보 " + dto.getImage());
				int i = dao.ANImgUpdate(dto);
				if(i>= 1) {
					String fl = multi.getParameter("fileDel");
					file = new File(realPath+"/"+fl);
					if(file.exists()) {file.delete();}								
				}
			
		}} catch (IOException e) {
			e.printStackTrace();
		}
		return num;
	}

}
