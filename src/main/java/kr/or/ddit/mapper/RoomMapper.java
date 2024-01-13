package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.RoomVO;

public interface RoomMapper {
	
	public RoomVO getRoom(String roomCd);

	public List<RoomVO> getRoomCd(String depCd);

	public List<RoomVO> getCrewRoomCd();

	public List<RoomVO> getRoomListByComdCd(String comdCd);

	public CommonDetailVO getComdCdByRoomCd(String roomCd);

	public List<RoomVO> getEmptyCrewRoomCd();
	
	public RoomVO getEmptyRoomCd(String bldCd);
	
	public int updateRoomTel(RoomVO roomVO);

	public String getProfessorDepartment(String proCd);
	                    
}
