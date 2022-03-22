package kr.co.kitri.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.board.dao.BoardDAO;
import kr.co.kitri.board.dao.BoardDAOImpl;
import kr.co.kitri.board.vo.BoardVO;
@Service
public class BoardSvcImpl implements BoardSvc {
	@Autowired
	BoardDAO board;
	
	@Override
	public List<BoardVO> getBoards() {
		List<BoardVO> list=board.selectBoards();
		return list;
	}

	@Override
	public BoardVO getBoard(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registBoard(BoardVO bvo) {
		board.insertBoard(bvo);
	}

	@Override
	public boolean updateBoard(BoardVO bvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteBoard(int no) {
		// TODO Auto-generated method stub
		return false;
	}

}
