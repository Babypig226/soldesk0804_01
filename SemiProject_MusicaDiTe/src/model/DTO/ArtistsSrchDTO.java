package model.DTO;

import java.util.List;

public class ArtistsSrchDTO {
	String instrument;
	List<String> artName;
	public String getInstrument() {
		return instrument;
	}
	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}
	public List<String> getArtName() {
		return artName;
	}
	public void setArtName(List<String> artName) {
		this.artName = artName;
	}

}
