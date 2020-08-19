package model.DTO;

import java.util.List;

public class EventRepliesDTO {
	private EventBoardDTO eventDTO; // 1
	private List<ReplyDTO> replies; // n

	public EventBoardDTO getEventDTO() {
		return eventDTO;
	}

	public void setEventDTO(EventBoardDTO eventDTO) {
		this.eventDTO = eventDTO;
	}

	public List<ReplyDTO> getReplies() {
		return replies;
	}

	public void setReplies(List<ReplyDTO> replies) {
		this.replies = replies;
	}

}
