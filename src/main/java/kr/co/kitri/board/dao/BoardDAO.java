package kr.co.kitri.board.dao;

import java.util.List;

import kr.co.kitri.board.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO>selectBoards();
	public void insertBoard(BoardVO bvo);
	public int updateBoard(BoardVO bvo);
	public int deleteBoard(int no);
}
