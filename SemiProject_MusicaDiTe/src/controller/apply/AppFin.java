package controller.apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ApplyDAO;
import model.DTO.ApplyDTO;
import model.DTO.ApplyFinDTO;

public class AppFin {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		String num = request.getParameter("num");
		ApplyDAO dao = new ApplyDAO();
		ApplyDTO adto = dao.appSel(num, userId);
		ApplyFinDTO dto = new ApplyFinDTO();
		dto.setAppAddr(adto.getAppAddr());
		dto.setAppCareer(adto.getAppCareer());
		dto.setAppEdu(adto.getAppEdu());
		dto.setAppTempNum(Long.parseLong(num));
		dto.setAuditionNoticeNum(adto.getAuditionNoticeNum());
		dto.setOrgCrDoc(adto.getOrgCrDoc());
		dto.setStrCrDoc(adto.getStrCrDoc());
		dto.setOrgEduDoc(adto.getOrgEduDoc());
		dto.setStrEduDoc(adto.getStrEduDoc());
		dto.setOrgIdCard(adto.getOrgIdCard());
		dto.setStrIdCard(adto.getStrIdCard());
		dto.setOrgIdP(adto.getOrgIdP());
		dto.setStrIdP(adto.getStrIdP());
		dto.setInstrument(adto.getInstrument());
		dto.setPrfrmVd(adto.getPrfrmVd());
		dto.setUserBirth(adto.getUserBirth());
		dto.setUserId(userId);
		dto.setUserName(adto.getUserName());
		dto.setIpAddr(request.getRemoteAddr());
		int i = dao.applyFinInsert(dto);
		if(i>=0) {
			dao.applyDel(num);
		}
		
		
	}

}
