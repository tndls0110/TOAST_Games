package com.toast.schedule.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.toast.schedule.dto.MeetingDTO;
import com.toast.schedule.dao.MeetingDAO;

@Service
public class MeetingService {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	private MeetingDAO meetingDao;
	
	public MeetingService(MeetingDAO meetingDao) {
		this.meetingDao = meetingDao;
	}
	
	//회의실 가기(회의실 이름+idx)
	public List<Map<String, Object>> meetingGo() {
		return meetingDao.meetingGo();		
	}

	//회의실 정보 상세보기
	public Map<String, Object> meetingDetail(int room_idx) {
		logger.info("room_idx:"+room_idx);
		return meetingDao.meetingDetail(room_idx);
	}

	//회의 일정 보기
	public List<Map<String, Object>> getMeeting(Map<String, Object> params) {
		Integer room_idx = Integer.parseInt((String) params.get("room"));
		List<MeetingDTO> list = meetingDao.getMeeting(room_idx);
		List<Map<String, Object>> meeting_list = new ArrayList<Map<String,Object>>();
		for (MeetingDTO dto : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("room", dto.getRoom_idx());
			map.put("start", dto.getMeet_start_date());
			map.put("end", dto.getMeet_end_date());
			map.put("title", dto.getMeet_subject());
			map.put("description", dto.getMeet_content());
			map.put("empl", dto.getMeet_rent_empl_idx());
			
			meeting_list.add(map);
		}
		return  meeting_list;
	}
	
	//회의 일정 추가
	public int addMeeting(MeetingDTO dto) {
		logger.info("dto:{}",dto);
		int row = meetingDao.addMeeting(dto);
		return row;
	}


	//회의 일정 수정
	public int updateMeeting(MeetingDTO dto) {
		logger.info("dto:{}",dto);
		int row = meetingDao.updateMeeting(dto);
		return row;
	}


	//회의 일정 삭제
	
	
	//내가 포함된 일정만 보기
	
	
	//회의 일정 1시간 전 알림 발송
	
	
	//내가 포함된 회의 수정/ 삭제시 알림 발송
	
	
	//회의 참여자 추가/ 수정
}
