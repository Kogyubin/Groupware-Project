package kr.co.kitri.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	

	@RequestMapping(value = "/main")
	public String home(HttpSession session) {
		
		if(session.getAttribute("session_id")!=null) {
			return "main";
		}else {
			return "redirect:/";
		}
		
//		return "main"; // /WEB-INF/views/home.jps
	}
	
}
