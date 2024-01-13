package kr.or.ddit.service.common;

import java.util.List;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.RoomVO;

public interface ReservationService {

	public List<ReservationVO> getListByUserCd(String userCd);

	public List<ReservationVO> getReservationList();

	public List<RoomVO> getRoomListByComdCd(String comdCd);

	public List<ReservationVO> getResListByRoomCd(String roomCd);

	public List<List<CalendarVO>> getLectureScheduleByBldCd(String bldCd);

	public int insert(ReservationVO reservationVO);

	public ReservationVO detail(String resCd);

	public int delete(String resCd);


}
