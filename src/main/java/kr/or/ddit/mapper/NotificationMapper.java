package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.NotificationVO;

public interface NotificationMapper {

	public List<NotificationVO> getSimpleNotificationsByUserCd(String userCd);

	public int insert(NotificationVO ntfVO);

	public int checkNotification(String ntfCd);
	
	

}
