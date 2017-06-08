package org.duckoo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.duckoo.domain.BoardVO;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	SqlSession sset;
	
	private static final String namespace="org.duckoo.persistence.BoardDAO"; 
	
	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return sset.selectOne(namespace+".getTime");
	}

	@Override
	public void create(BoardVO vo) {
		sset.insert(namespace+".create", vo);
		
	}

	@Override
	public void delete(int bno) {
		sset.delete(namespace+".delete");
	}

	@Override
	public void read(int bno) {
		sset.selectOne(namespace+".read", bno);
	}

	@Override
	public void update(BoardVO vo) {
		sset.update(namespace+".update", vo);
	}

	@Override
	public List<BoardVO> readList() {
		
		return sset.selectList(namespace+".readList");
	}

}
