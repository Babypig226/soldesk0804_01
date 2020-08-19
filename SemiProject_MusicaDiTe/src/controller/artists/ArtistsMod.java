package controller.artists;

import java.io.File;
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

public class ArtistsMod {

	public Long execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		ArtistsDAO dao = new ArtistsDAO();
		ArtistsDTO dto = new ArtistsDTO();
		String path = "/management_board/artists_data";
		String realPath = request.getServletContext().getRealPath(path);
		int sizeLimit = 1024*1024*10;
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			String artRegNum = multi.getParameter("artRegNum");
			dto.setEmployeeId(employeeId);
			dto.setArtAwards(multi.getParameter("artAwards"));
			dto.setArtContct(multi.getParameter("artContct"));
			dto.setArtCr(multi.getParameter("artCr"));
			dto.setArtEd(multi.getParameter("artEd"));
			dto.setArtEmail(multi.getParameter("artEmail"));
			dto.setArtName(multi.getParameter("artName"));
			dto.setArtRegNum(Long.parseLong(artRegNum));
			dto.setArtSns(multi.getParameter("artSns"));
			dto.setMngName(multi.getParameter("mngName"));
			dto.setMngContct(multi.getParameter("mngContct"));
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
			dto.setVideo(multi.getParameter("video"));
			dao.contentUpdate(dto);	//컨텐츠 업데이트
			
			ArtistsDTO dtob = dao.selFdetail(artRegNum);
			File file = null;
			if(multi.getFile("albumUp")==null) {
				if(!multi.getParameter("albumDel").trim().equals("")) {
					dto.setOrgAlbumInfo("");
					dto.setStrAlbumInfo("");
				}
			} else {
				dto.setOrgAlbumInfo(multi.getOriginalFileName("albumUp"));
				dto.setStrAlbumInfo(multi.getFilesystemName("albumUp"));					
			}
			if(multi.getFile("fileup")!=null) {
				dto.setOrgDoc(multi.getOriginalFileName("fileup"));
				dto.setStrDoc(multi.getFilesystemName("fileup"));				
			} else {
				dto.setOrgDoc(dtob.getOrgDoc());
				dto.setStrDoc(dtob.getStrDoc());
			}
			if(multi.getFile("profileP")!=null) {
				dto.setOrgProfile(multi.getOriginalFileName("profileP"));
				dto.setStrProfile(multi.getFilesystemName("profileP"));				
			} else {
				dto.setOrgProfile(dtob.getOrgProfile());
				dto.setStrProfile(dtob.getStrProfile());
			}
			int i = dao.fileUpdate(dto);
			
			String[] files = {"profileDel", "contractDel", "albumDel"};
			if(i>=1) {
				for (String string : files) {
					String fl = multi.getParameter(string);
					file = new File(realPath + "/"+fl);
					if(file.exists()) {
						file.delete();
					}
				}
				
			}			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return dto.getArtRegNum();
	}

}
