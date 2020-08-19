package controller.artists;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.ArtistsDAO;
import model.DTO.ArtistsDTO;

public class ArtsRegPro {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		String path = "/management_board/artists_data";
		String realPath = request.getServletContext().getRealPath(path);
		int limitSize = 1024*1024*10;
		ArtistsDTO dto = new ArtistsDTO();
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			dto.setEmployeeId(employeeId);
			dto.setArtName(multi.getParameter("artName"));
			dto.setMngName(multi.getParameter("mngName"));
			dto.setOrgProfile(multi.getOriginalFileName("profileP"));
			dto.setStrProfile(multi.getFilesystemName("profileP"));
			dto.setArtContct(multi.getParameter("artContct"));
			dto.setMngContct(multi.getParameter("mngContct"));
			dto.setArtEmail(multi.getParameter("artEmail"));
			dto.setArtSns(multi.getParameter("artSns"));
			dto.setArtEd(multi.getParameter("artEd"));
			dto.setArtAwards(multi.getParameter("artAwards"));
			dto.setInstrument(multi.getParameter("instrument"));
			dto.setArtCr(multi.getParameter("artCr"));
			dto.setContrctType(multi.getParameter("contrctType"));
			
			String ctrttDate = multi.getParameter("contrctDate");
			String expDate = multi.getParameter("expireDate");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Date dt1 = null;
			Date dt2 = null;
			try {
				dt1 = date.parse(ctrttDate);
				dt2 = date.parse(expDate);				
			} catch (Exception e) {
				e.printStackTrace();
			}
			Timestamp contrctDate = new Timestamp(dt1.getTime());
			Timestamp expireDate = new Timestamp(dt2.getTime());
			
			dto.setContrctDate(contrctDate);
			dto.setExpireDate(expireDate);
			dto.setOrgDoc(multi.getOriginalFileName("fileup"));
			dto.setStrDoc(multi.getFilesystemName("fileup"));
			dto.setOrgAlbumInfo(multi.getOriginalFileName("albumUp"));
			dto.setStrAlbumInfo(multi.getFilesystemName("albumUp"));
			dto.setVideo(multi.getParameter("video"));
			ArtistsDAO dao = new ArtistsDAO();
			dao.artsInsert(dto);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
