package controller.apply;

public class RenameInstrument {
	public String instrumentRename(String instrument) {
		String value = "";
			if(instrument.equals("pf")) {value = "피아노";}
			if(instrument.equals("vn")) {value = "바이올린";}
			if(instrument.equals("vl")) {value = "비올라";}
			if(instrument.equals("vc")) {value = "첼로";}
		return value;
	}

}
