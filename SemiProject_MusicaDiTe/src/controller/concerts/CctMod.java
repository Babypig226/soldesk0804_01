package controller.concerts;

import java.io.File;
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

public class CctMod {

	public String execute(HttpServletRequest request) {
		String num = "";
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		String path = "/concert_board/upload";
		String realPath = request.getServletContext().getRealPath(path);
		int sizeLimit = 1024*1024*10;
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			ConcertsDTO dto = new ConcertsDTO();
			ConcertsDAO dao = new ConcertsDAO();
			dto.setCctNum(Long.parseLong(multi.getParameter("num")));
			num = multi.getParameter("num");
			dto.setCctTitle(multi.getParameter("cctTitle"));
			String cd = multi.getParameter("cctDate");
			cd = cd.replace("T", " ");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date dt = null;
			try {
				dt = date.parse(cd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			Timestamp cctDate = new Timestamp(dt.getTime());
			dto.setCctDate(cctDate);
			dto.setCctLocation(multi.getParameter("cctLocation"));
			dto.setInstrument(multi.getParameter("instrument"));
			dto.setArtName(multi.getParameter("artName"));
			dto.setCctProgram(multi.getParameter("cctProgram"));
			dto.setCctContent(multi.getParameter("cctContent"));
			dao.contentUpdate(dto);
			
			
			ConcertsDTO fl = dao.detail(dto.getCctNum().toString());
			File file = null;
			if(multi.getFile("fileup")==null) {
				dto.setOrgPoster(fl.getOrgPoster());
				dto.setStrPoster(fl.getStrPoster());
			}else {
				dto.setOrgPoster(multi.getOriginalFileName("fileup"));
				dto.setStrPoster(multi.getFilesystemName("fileup"));
			}
			if(multi.getFile("detailUp")==null) {
				dto.setOrgDetail(fl.getOrgDetail());
				dto.setStrDetail(fl.getStrDetail());
			}
			else {
				dto.setOrgDetail(multi.getOriginalFileName("detailUp"));
				dto.setStrDetail(multi.getFilesystemName("detailUp"));
			}
			
			int i = dao.fileUpdate(dto); 
			String[] files = {"posterDel", "detailDel"};
			if(i>=1) {
				for (String string : files) {
					String f = multi.getParameter(string);
					file = new File(realPath + "/"+f);
					if(file.exists()) {
						file.delete();
					}
				}
				
			}			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return num;
	}

}
