package controller.artists;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ArtistsDAO;
import model.DTO.ArtistsDTO;

public class ArtistsDel {

	public void execute(HttpServletRequest request) {
		String artRegNum = request.getParameter("num");
		HttpSession session = request.getSession();
		String employeeId = (String) session.getAttribute("logId");
		String path = "/management_board/artists_data";
		String realPath = request.getServletContext().getRealPath(path);

		ArtistsDAO dao = new ArtistsDAO();
		ArtistsDTO dto = dao.selFdetail(artRegNum);
		int i = dao.artistsDel(artRegNum, employeeId);
	
			if (i >= 1) {
				File file1 = new File(realPath + "/" + dto.getStrAlbumInfo());
				if (file1.exists()) {
					file1.delete();
				}
				File file2 = new File(realPath + "/" + dto.getStrDoc());
				if (file2.exists()) {
					file2.delete();
				}
				File file3 = new File(realPath + "/" + dto.getStrProfile());
				if (file3.exists()) {
					file3.delete();
				}
			}

		

	}
}
