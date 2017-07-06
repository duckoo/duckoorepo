package org.duckoo.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.duckoo.domain.UserVO;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;

@Repository
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "org.bong.persistence.UserDAO";
	
	@Inject
	SqlSessionFactory session;
	
	@Override
	public void create(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		
	}

}
