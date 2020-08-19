package model.DTO;

import java.util.List;

public class AuditionApplyDTO {
	AuditionNoticeDTO auditions;
	List<ApplyDTO> applications;
	public AuditionNoticeDTO getAuditions() {
		return auditions;
	}
	public void setAuditions(AuditionNoticeDTO auditions) {
		this.auditions = auditions;
	}
	public List<ApplyDTO> getApplications() {
		return applications;
	}
	public void setApplications(List<ApplyDTO> applications) {
		this.applications = applications;
	}
	

}
