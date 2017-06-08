package org.duckoo.persistence;

import java.util.List;

import org.duckoo.domain.BoardVO;

public interface BoardDAO {
	
	public String getTime();
	public void create(BoardVO vo);
	public void delete(int bno);
	public void read(int bno);
	public void update(BoardVO vo);
	public List<BoardVO> readList();
}
