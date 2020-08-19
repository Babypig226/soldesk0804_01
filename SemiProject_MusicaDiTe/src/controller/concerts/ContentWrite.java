package controller.concerts;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import model.DAO.ConcertsDAO;
import model.DTO.ConcertsDTO;

public class ContentWrite {

	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		ConcertsDTO dto = new ConcertsDTO();
			dto.setIpAddr(request.getRemoteAddr());
			dto.setArtName(request.getParameter("artFoundName"));
			dto.setCctContent(request.getParameter("cctContent"));
			String cday = request.getParameter("cctDate");
			cday = cday.replace("T", " ");
			SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = null;
			try {
				date = dt.parse(cday);
			} catch (Exception e) {
				e.printStackTrace();
			}
			Timestamp cctDate = new Timestamp(date.getTime());
			dto.setCctDate(cctDate);
			dto.setCctLocation(request.getParameter("cctLocation"));
			dto.setCctProgram(request.getParameter("cctProgram"));
			dto.setCctTitle(request.getParameter("cctTitle"));
			dto.setEmployeeId(employeeId);
			dto.setInstrument(request.getParameter("instrument"));
	}

}
