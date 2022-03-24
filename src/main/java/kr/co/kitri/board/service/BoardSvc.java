package kr.co.kitri.board.service;

import java.util.List;

import kr.co.kitri.board.vo.BoardVO;

public interface BoardSvc {
	public List<BoardVO> getBoards();
	public BoardVO getBoard(int no);
	public void registBoard(BoardVO bvo);
	public boolean updateBoard(BoardVO bvo);
	public boolean deleteBoard(int no);
}
