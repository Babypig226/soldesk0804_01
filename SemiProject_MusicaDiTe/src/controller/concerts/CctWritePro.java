package controller.concerts;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.ConcertsDAO;
import model.DTO.ConcertsDTO;

public class CctWritePro {

	public void execute(HttpServletRequest request) {
		String path = "/concert_board/upload";
		String realPath = request.getServletContext().getRealPath(path);
		int limitSize = 1024*1024*10;
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		ConcertsDTO dto = new ConcertsDTO();
		dto.setIpAddr(request.getRemoteAddr());
		
		try {
		MultipartRequest multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			dto.setOrgDetail(multi.getOriginalFileName("detailup"));
			dto.setOrgPoster(multi.getOriginalFileName("fileUp"));
			dto.setStrDetail(multi.getFilesystemName("detailup"));
			dto.setStrPoster(multi.getFilesystemName("fileUp"));
			dto.setArtName(multi.getParameter("artName"));
			dto.setCctContent(multi.getParameter("cctContent"));
			String cday = multi.getParameter("cctDate");
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
			dto.setCctLocation(multi.getParameter("cctLocation"));
			dto.setCctProgram(multi.getParameter("cctProgram"));
			dto.setCctTitle(multi.getParameter("cctTitle"));
			dto.setEmployeeId(employeeId);
			dto.setInstrument(multi.getParameter("instrument"));
				ConcertsDAO dao = new ConcertsDAO();
				dao.cctInsert(dto);			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
