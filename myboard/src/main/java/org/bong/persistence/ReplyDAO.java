package org.bong.persistence;

import java.util.List;

import org.bong.domain.Criteria2;
import org.bong.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> getReplyList(Criteria2 cri2);
}
