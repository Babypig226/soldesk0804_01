package controller.auditionNotice;

public class Rename {
	public String categoryRename(String auditionNoticeCategory) {
		String value = "";
		if(auditionNoticeCategory.equals("solo")){ value = "독주";}
		else if(auditionNoticeCategory.equals("ensemble")){ value = "실내악";}
		else if(auditionNoticeCategory.equals("orchestra")){ value = "오케스트라";}
		else if(auditionNoticeCategory.equals("concertoSolo")){value = "협연";}
		return value;
	}
	public String InstrumentRename(String instrument) {
		String value = "";
		if(instrument.equals("pf")) {value = "피아노";}
		else if(instrument.equals("vn")) {value = "바이올린";}
		else if(instrument.equals("vl")) {value = "비올라";}
		else if(instrument.equals("vc")) {value = "첼로";}
		else if(instrument.equals("emsbl")) {value = "앙상블";}
		return value;
	}

}
