package kr.or.ddit.service.common.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CalendarMapper;
import kr.or.ddit.mapper.LectureScheduleMapper;
import kr.or.ddit.mapper.ReservationMapper;
import kr.or.ddit.mapper.RoomMapper;
import kr.or.ddit.service.common.ReservationService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureScheduleVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.RoomVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReservationServiceImpl implements ReservationService{
	
	private final ReservationMapper reservationMapper;
	
	private final RoomMapper roomMapper;
	
	private final LectureScheduleMapper lectureMapper;
	
	private final CalendarMapper calendarMapper;

	@Override
	public List<ReservationVO> getListByUserCd(String userCd) {
		return this.reservationMapper.getListByUserCd(userCd);
	}

	@Override
	public List<ReservationVO> getReservationList() {
		return this.reservationMapper.getReservationList();
	}

	@Override
	public List<RoomVO> getRoomListByComdCd(String comdCd) {
		return this.roomMapper.getRoomListByComdCd(comdCd);
	}

	@Override
	public List<ReservationVO> getResListByRoomCd(String roomCd) {
		List<ReservationVO> resList = this.reservationMapper.getResListByRoomCd(roomCd);
		
		if (resList == null || resList.size() == 0) {
			ReservationVO resVO = new ReservationVO();
			resVO.setCommonDetailVO(this.roomMapper.getComdCdByRoomCd(roomCd));
			resVO.setRoomCd(roomCd);
			resVO.setRoomVO(this.roomMapper.getRoom(roomCd));
			resList.add(resVO);
		}
		return  resList;
	}

	@Override
	public List<List<CalendarVO>> getLectureScheduleByBldCd(String bldCd) {
		
		List<LectureScheduleVO> lectureScheduleList = this.lectureMapper.getLectureScheduleByBldCd(bldCd);
		
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String,Object>>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		
		lectureScheduleList.stream().forEach(schedule -> {
			LectureApplyVO lecApp = schedule.getLectureVO().getLectureApplyVO(); 
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startTime", sdf.format(schedule.getLecsStdt()));
			map.put("endTime", sdf.format(schedule.getLecsEddt()));
			if (lecApp.getLecaSem() == 1) {
				map.put("startDate", lecApp.getLecaYear() + "0302");
				map.put("endDate", lecApp.getLecaYear() + "0617");
			} else if (lecApp.getLecaSem() == 2) {
				map.put("startDate", lecApp.getLecaYear() + "0901");
				map.put("endDate", lecApp.getLecaYear() + "1215");
			}
			map.put("days", schedule.getLecDay().split("/"));
			map.put("roomCd", lecApp.getRoomCd());
			mapList.add(map);
		});
		
		mapList.stream().forEach(map -> log.info("map ==> {}", map));
		
		List<List<CalendarVO>> calendarList = new ArrayList<List<CalendarVO>>();
		
		mapList.stream().forEach(map -> {
			
			List<CalendarVO> list = this.calendarMapper.dateTransfer(map);
			calendarList.add(list);
		});
		
		return calendarList;
	}

	@Override
	public int insert(ReservationVO reservationVO) {
		return this.reservationMapper.insert(reservationVO);
	}

	@Override
	public ReservationVO detail(String resCd) {
		ReservationVO reservationVO = this.reservationMapper.detail(resCd);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		reservationVO.setResDate(sdf.format(reservationVO.getResStdt()));
		sdf = new SimpleDateFormat("HH:mm");
		reservationVO.setStartTime(sdf.format(reservationVO.getResStdt()));
		reservationVO.setEndTime(sdf.format(reservationVO.getResEddt()));
		return reservationVO;
	}

	@Override
	public int delete(String resCd) {
		return this.reservationMapper.delete(resCd);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
