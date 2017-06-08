package org.bong.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.bong.domain.Criteria2;
import org.bong.domain.ReplyVO;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@Repository
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ReplyDAOImple implements ReplyDAO {
	private Logger logger = Logger.getLogger(BoardDAOImple.class);
	private static final String namespace = "org.bong.persistence.ReplyDAO";
	
	@Inject
	SqlSessionTemplate sst;
	
	@Override
	public List<ReplyVO> getReplyList(Criteria2 cri2) {
		return sst.selectList(namespace+".getReplyList", cri2);
	}

}
