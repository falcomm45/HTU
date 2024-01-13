package kr.or.ddit.controller.common;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.common.ReservationService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.LectureScheduleVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.RoomVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/reservation")
public class ReservationController {
	
	private final ReservationService reservationService;
	
	@GetMapping("/list")
	public String list(Principal principal, Model model) {
		
		String userCd = principal.getName();
		
		List<ReservationVO> reservationList = this.reservationService.getListByUserCd(userCd);
		
		model.addAttribute("reservationList", reservationList);
		
		model.addAttribute("now", new Date());
		
		return "reservation/resList";
		
	}
	
	@GetMapping("/current")
	public String current(Model model) {
		
		List<ReservationVO> reservationList = this.reservationService.getReservationList();
		
		model.addAttribute("reservationList", reservationList);
		
		return "reservation/resCurrent";
	}
	
	@ResponseBody
	@GetMapping("/getRoomListByComdCd")
	public List<RoomVO> getListByComdCd(String comdCd) {
		return this.reservationService.getRoomListByComdCd(comdCd);
	}
	
	@ResponseBody
	@GetMapping("/getResListByRoomCd")
	public List<ReservationVO> getResListByRoomCd(String roomCd) {
		return this.reservationService.getResListByRoomCd(roomCd);
	}
	
	@ResponseBody
	@GetMapping("/getLectureScheduleByBldCd")
	public List<List<CalendarVO>> getLectureScheduleByBldCd(String bldCd) {
		List<List<CalendarVO>> calendarList = this.reservationService.getLectureScheduleByBldCd(bldCd);
		return calendarList;
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public int insert(@RequestBody ReservationVO reservationVO) {
		return this.reservationService.insert(reservationVO);
	}
	
	@ResponseBody
	@GetMapping("/detail")
	public ReservationVO detail(String resCd) {
		return this.reservationService.detail(resCd);
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public int delete(String resCd) {
		return this.reservationService.delete(resCd);
	}
	
}
