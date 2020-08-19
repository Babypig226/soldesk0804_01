package controller.concerts;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;


import model.DTO.ConcertsDTO;

public class InfoPass {

	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		ConcertsDTO dto = new ConcertsDTO();
			dto.setCctContent(request.getParameter("cctContent"));
			dto.setCctLocation(request.getParameter("cctLocation"));
			dto.setCctProgram(request.getParameter("cctProgram"));
			dto.setCctTitle(request.getParameter("cctTitle"));
			dto.setArtName(request.getParameter("artFoundName"));
			dto.setInstrument(request.getParameter("instrument"));
			String cday = request.getParameter("cctDate");
			cday = cday.replace("T", " ");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date dt = null;
			try {
				dt = date.parse(cday);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String pattern = "yyyy-MM-dd'T'HH:mm";
			String cctDate = new SimpleDateFormat(pattern).format(dt.getTime());
			System.out.println(cctDate);		
		request.setAttribute("infoPass", dto);
		request.setAttribute("cctDateT", cctDate);
		request.setAttribute("cctDate", cctDate.replace("T", " "));
	}

}
