package controller.apply;

import java.io.IOException;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.ApplyDAO;
import model.DTO.ApplyDTO;

public class ApplyInsert {
	public Integer execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		Integer num = 0;
		ApplyDTO dto = new ApplyDTO();
		ApplyDAO dao = new ApplyDAO();
		String path = "/ApplyForm/upload";
		String realpth = request.getServletContext().getRealPath(path);
		int sizeLimit = 1024*1024*10;
		dto.setIpAddr(request.getRemoteAddr());
		try {
			MultipartRequest multi = new MultipartRequest(request, realpth, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			dto.setAuditionNoticeNum(Long.parseLong(multi.getParameter("auditionNoticeNum")));
			dto.setUserId(userId);
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
			
			
			dto.setUserBirth(userBirth);
			dto.setAppAddr(multi.getParameter("appAddr"));
			dto.setInstrument(multi.getParameter("instrument"));
			dto.setAppEdu(multi.getParameter("appEdu"));
			dto.setAppCareer(multi.getParameter("appCareer"));
			dto.setStrIdP(multi.getFilesystemName("idP"));
			dto.setOrgIdP(multi.getOriginalFileName("idP"));
			dto.setOrgIdCard(multi.getOriginalFileName("idCard"));
			dto.setStrIdCard(multi.getFilesystemName("idCard"));
			dto.setStrCrDoc(multi.getFilesystemName("crDoc"));
			dto.setStrEduDoc(multi.getFilesystemName("eduDoc"));
			dto.setOrgEduDoc(multi.getOriginalFileName("eduDoc"));
			dto.setOrgCrDoc(multi.getOriginalFileName("crDoc"));
			dto.setPrfrmVd(multi.getParameter("prfrmVd"));
			num = dao.applyInsert(dto);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		 
		
		return num;
	}
	

}
