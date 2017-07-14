package org.duckoo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.duckoo.domain.FileVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;


@Repository
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class FileDAOImpl implements FileDAO {
	private static final String namespace = "org.duckoo.persistence.FileDAO";
	
	@Inject
	SqlSessionTemplate sst;
	
	@Override
	public void create(FileVO vo) {
		sst.insert(namespace+".create",vo);

	}

	@Override
	public List<FileVO> fileList(String userid) {
		return sst.selectList(namespace+".fileList",userid);
	}

	@Override
	public FileVO read(int fno) {
		return sst.selectOne(namespace+".read",fno);
	}

	@Override
	public void update(FileVO vo) {
		sst.update(namespace+".update",vo);
		
	}

}
