package org.bong.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.bong.domain.BoardVO;
import org.bong.domain.Criteria;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Repository
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardDAOImple implements BoardDAO {
	private Logger logger = Logger.getLogger(BoardDAOImple.class);
	private static final String namespace = "org.bong.persistence.BoardDAO";
	
	@Inject
	SqlSessionTemplate sst;
	
	
	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		return sst.selectList(namespace+".getBoardList",cri);
		
	}

	@Override
	public int listCount(Criteria cri) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".listCount",cri);
	}

	@Override
	public void create(BoardVO vo) {
		sst.insert(namespace+".create", vo);
		
	}

	@Override
	public BoardVO read(int bno) {
		return sst.selectOne(namespace+".read", bno);
		
	}

	@Override
	public void delete(int bno) {
		sst.delete(namespace+".delete",bno);
		
	}

}
