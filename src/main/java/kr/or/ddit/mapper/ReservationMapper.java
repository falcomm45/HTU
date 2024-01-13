 package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ReservationVO;

public interface ReservationMapper {

	public List<ReservationVO> getListByUserCd(String userCd);

	public List<ReservationVO> getReservationList();

	public List<ReservationVO> getResListByRoomCd(String roomCd);

	public int insert(ReservationVO reservationVO);

	public ReservationVO detail(String resCd);

	public int delete(String resCd);
	
}
