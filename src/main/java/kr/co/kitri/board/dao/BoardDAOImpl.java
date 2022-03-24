package kr.co.kitri.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectBoards() {
		List<BoardVO> list =sqlSession.selectList("board.selectBoards");
		return list;
	}

	@Override
	public void insertBoard(BoardVO bvo) {
		sqlSession.insert("insertBoard",bvo);
	}

	@Override
	public int updateBoard(BoardVO bvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
