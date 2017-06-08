package org.bong.service;

import java.util.List;

import org.bong.domain.BoardVO;
import org.bong.domain.Criteria;
import org.bong.domain.Criteria2;
import org.bong.domain.ReplyVO;

public interface ServiceDAO {
	
	public List<BoardVO> getBoardList(Criteria cri);
	public int listCount(Criteria cri);
	public void create(BoardVO vo);
	public BoardVO read(int bno);
	public void delete(int bno);
//////////////////////////////////////////////////////
	public List<ReplyVO> getReplyList(Criteria2 cri2);
	
}
