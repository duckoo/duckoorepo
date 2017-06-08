package org.duckoo.web;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.duckoo.persistence.BoardDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class TestSQL {
	private Logger logger = Logger.getLogger(TestSQL.class);
	@Inject
	BoardDAO dao;
	
	@Test
	public void timeTest(){
		logger.info(dao.getTime());
	}
	
}
