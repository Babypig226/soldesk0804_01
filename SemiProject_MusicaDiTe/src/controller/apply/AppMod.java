package controller.apply;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.ApplyDAO;
import model.DTO.ApplyDTO;

public class AppMod {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		String path = "ApplyForm/upload";
		String realPath = request.getServletContext().getRealPath(path);
		int limitSize = 1024*1024*5;
		ApplyDTO dto = new ApplyDTO();
		ApplyDAO dao = new ApplyDAO();
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			dto.setAppTempNum(Long.parseLong(multi.getParameter("num")));
			System.out.println("appTempNum"+dto.getAppTempNum());
			dto.setUserName(multi.getParameter("userName"));
			
			String value = multi.getParameter("userBirth");
			SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = dt.parse(value);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp userBirth = new Timestamp(date.getTime());
			dto.setUserId(userId);
			dto.setUserBirth(userBirth);
			System.out.println("userBirth = " + userBirth);
			dto.setAppAddr(multi.getParameter("appAddr"));
			dto.setInstrument(multi.getParameter("instrument"));
			dto.setAppEdu(multi.getParameter("appEdu"));
			dto.setAppCareer(multi.getParameter("appCareer"));
			dto.setPrfrmVd(multi.getParameter("prfrmVd"));
			dao.updateContent(dto);
			ApplyDTO dtoOrg = dao.appSel(multi.getParameter("num"), userId);
			File file = null;
			if(multi.getFile("crDoc")==null) {
				if(!multi.getParameter("crDocDel").trim().equals("")) {
					dto.setOrgCrDoc("");
					dto.setStrCrDoc("");
						}
			}else {
				dto.setOrgCrDoc(multi.getOriginalFileName("crDoc"));
				dto.setStrCrDoc(multi.getFilesystemName("crDoc"));
				}
			if(multi.getFile("idP") != null) {
				if(!multi.getParameter("idPDel").trim().equals("")) {
					dto.setOrgIdP(multi.getOriginalFileName("idP"));
					dto.setStrIdP(multi.getFilesystemName("idP"));					
				}
			} else {
				dto.setOrgIdP(dtoOrg.getOrgIdP());
				dto.setStrIdP(dtoOrg.getStrIdP());
			}
			if(multi.getFile("idCard") != null) {
				if(!multi.getParameter("idCardDel").trim().equals("")) {
					dto.setOrgIdCard(multi.getOriginalFileName("idCard"));
					dto.setStrIdCard(multi.getFilesystemName("idCard"));					
				}
			} else {
				dto.setOrgIdCard(dtoOrg.getOrgIdCard());
				dto.setStrIdCard(dtoOrg.getStrIdCard());
			}
			if(multi.getFile("eduDoc") != null) {
				if(!multi.getParameter("eduDocDel").trim().equals("eduDocDel")) {
					dto.setOrgEduDoc(multi.getOriginalFileName("eduDoc"));
					dto.setStrEduDoc(multi.getFilesystemName("eduDoc"));					
				}
			} else {
				dto.setOrgEduDoc(dtoOrg.getOrgEduDoc());
				dto.setStrEduDoc(dtoOrg.getStrEduDoc());
			}
			int i = dao.fileUpdate(dto);
			String[] files = {"crDocDel", "idPDel", "idCardDel", "eduDocDel"};
			if(i>=i) {
				for (String string : files) {
					String fl = multi.getParameter(string);
					file = new File((realPath)+"/"+ fl);
					if(file.exists()) {
						file.delete();
					}
					
				}
			}
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
