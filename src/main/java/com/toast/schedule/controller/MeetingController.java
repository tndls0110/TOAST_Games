package com.toast.schedule.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.toast.schedule.dto.MeetingDTO;
import com.toast.schedule.service.MeetingService;

@RestController
@RequestMapping("/meeting")
public class MeetingController {
 
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private MeetingService meetingService;
	
	public MeetingController(MeetingService meetingService) {
		this.meetingService = meetingService;
	}
	
	//회의실 예약 가기(회의실 이름+idx)
	@RequestMapping(value="/meeting.go")
	public ModelAndView meetingGo () {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> roomList = meetingService.meetingGo();
		mv.addObject("roomList", roomList);
		mv.setViewName("meeting");
		return mv;
	}
	
	
	//회의실 정보 상세보기(회의실 정보 전체)
	@RequestMapping(value="/meetingRoom.detail")
	public ModelAndView meetingDetail(@RequestParam("room_idx") int selectedRoomIdx) {
		ModelAndView mv = new ModelAndView();
		int room_idx = selectedRoomIdx;
		Map<String, Object> roomDetail= meetingService.meetingDetail(room_idx);
		logger.info("roomDetail:{}",roomDetail);
		mv.addObject("roomDetail", roomDetail);
		mv.setViewName("meeting_room");
		return mv;
	}

	//회의 일정 보기
	@PostMapping(value="/getMeeting.do")
	@ResponseBody
	public List<Map<String, Object>> getMeeting(@RequestBody Map<String, Object> params) {
	    List<Map<String, Object>> meetings = meetingService.getMeeting(params);
	    logger.info("일정 왜  events없어:"+meetings);
	    return meetings;
	}
	
	//회의 일정 추가
	@PostMapping("/addMeeting.do")
	@ResponseBody
	public boolean addMeeting(@RequestBody Map<String, Object> params) {
	    MeetingDTO dto = new MeetingDTO();
	    
	    // 제목, 내용 받아오기
	    dto.setMeet_subject((String) params.get("title"));
	    dto.setMeet_content((String) params.get("content"));
	    
	    // 날짜 형식 변환
	    String start = (String) params.get("start");
	    String end = (String) params.get("end");
	    
	    // ZonedDateTime을 사용하여 UTC 시간을 로컬 시간으로 변환
	    DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME; // ISO 8601 포맷: "2024-12-14T19:30:00Z"
	    
	    // ZonedDateTime으로 변환 후 로컬 시간대 변환
	    ZonedDateTime startZonedDateTime = ZonedDateTime.parse(start, formatter);
	    ZonedDateTime endZonedDateTime = ZonedDateTime.parse(end, formatter);
	    
	    // 로컬 시간으로 변환 (현재 시스템 시간대에 맞게 변환)
	    LocalDateTime startLocalDateTime = startZonedDateTime.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
	    LocalDateTime endLocalDateTime = endZonedDateTime.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
	    
	    // 변환된 시간 객체를 DTO에 설정
	    dto.setMeet_start_date(startLocalDateTime);
	    dto.setMeet_end_date(endLocalDateTime);
	    
	    // room, empl 값을 Integer로 변환
	    dto.setRoom_idx(Integer.parseInt((String) params.get("room")));
	    dto.setMeet_rent_empl_idx(Integer.parseInt((String) params.get("empl")));
	    
	    logger.info("title: " + dto.getMeet_subject());
	    logger.info("content: " + dto.getMeet_content());
	    logger.info("start: " + dto.getMeet_start_date());
	    logger.info("end: " + dto.getMeet_end_date());
	    logger.info("room: " + dto.getRoom_idx());
	    logger.info("empl: " + dto.getMeet_rent_empl_idx());
	    
	    boolean success = false;
	    if (meetingService.addMeeting(dto) > 0) {
	        success = true;
	    }
	    return success;
	}

	
	//회의 일정 수정
	@PostMapping("/updateMeeting.do")
	@ResponseBody
	public boolean updateMeeting(@RequestBody Map<String, Object> params) {
	    MeetingDTO dto = new MeetingDTO();
	    
	    // 제목, 내용 받아오기
	    dto.setMeet_subject((String) params.get("title"));
	    dto.setMeet_content((String) params.get("content"));
	    
	    // 날짜 형식 변환
	    String start = (String) params.get("start");
	    String end = (String) params.get("end");
	    
	    // ZonedDateTime을 사용하여 UTC 시간을 로컬 시간으로 변환
	    DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME; // ISO 8601 포맷: "2024-12-14T19:30:00Z"
	    
	    // ZonedDateTime으로 변환 후 로컬 시간대 변환
	    ZonedDateTime startZonedDateTime = ZonedDateTime.parse(start, formatter);
	    ZonedDateTime endZonedDateTime = ZonedDateTime.parse(end, formatter);
	    
	    // 로컬 시간으로 변환 (현재 시스템 시간대에 맞게 변환)
	    LocalDateTime startLocalDateTime = startZonedDateTime.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
	    LocalDateTime endLocalDateTime = endZonedDateTime.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
	    
	    // 변환된 시간 객체를 DTO에 설정
	    dto.setMeet_start_date(startLocalDateTime);
	    dto.setMeet_end_date(endLocalDateTime);
	    
	    // room, empl 값을 Integer로 변환
	    dto.setRoom_idx(Integer.parseInt((String) params.get("room")));
	    dto.setMeet_rent_empl_idx(Integer.parseInt((String) params.get("empl")));
	    
	    logger.info("title: " + dto.getMeet_subject());
	    logger.info("content: " + dto.getMeet_content());
	    logger.info("start: " + dto.getMeet_start_date());
	    logger.info("end: " + dto.getMeet_end_date());
	    logger.info("room: " + dto.getRoom_idx());
	    logger.info("empl: " + dto.getMeet_rent_empl_idx());
	    
	    boolean success = false;
	    if (meetingService.updateMeeting(dto) > 0) {
	        success = true;
	    }
	    return success;
	}
	//회의 일정 삭제
	
	
	//내가 포함된 일정만 보기
	
	
	//회의 일정 1시간 전 알림 발송
	
	
	//내가 포함된 회의 수정/ 삭제시 알림 발송
	
	
	//회의 참여자 추가/ 수정
	
	
	
	
}
