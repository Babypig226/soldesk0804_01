package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller //컨트롤러 인식요청
public class HelloController{
	@RequestMapping("/testHello")
	public String aaa(@RequestParam(value="name", defaultValue = "없어요") String name,
			@RequestParam(value = "nai", defaultValue = "10") int n,
			Model model) {
		//request.getParameter("name")=String name;
		//Integer.parseInt(request.getParameter("nai")) = int n;
		model.addAttribute("test", name);
		model.addAttribute("age", n);
		//request.setAttribute("test", name);
		return "hello";
	}
	

}
