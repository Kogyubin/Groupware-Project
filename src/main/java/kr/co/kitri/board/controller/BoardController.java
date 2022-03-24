package kr.co.kitri.board.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.kitri.board.service.BoardSvc;
import kr.co.kitri.board.service.BoardSvcImpl;
import kr.co.kitri.board.vo.BoardVO;
import kr.co.kitri.home.HomeController;

@Controller
public class BoardController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	BoardSvc board; 

	//리스트
	@RequestMapping(value = "/boardlist", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<BoardVO> list = board.getBoards();
		
		model.addAttribute("list", list);
		return "boardlist"; // /WEB-INF/views/home.jps
	}
	//글쓰기
	@RequestMapping(value="/boardForm",method=RequestMethod.GET)
	public String boardForm(Locale locale, Model model)throws Exception {
		return "boardForm" ;
	}
	@RequestMapping(value="/boardSave")
	public String boardSave(@ModelAttribute BoardVO bvo ) {
		board.registBoard(bvo);
		return "redirect:/boardlist";
	}
	//글수정
	
	
}
