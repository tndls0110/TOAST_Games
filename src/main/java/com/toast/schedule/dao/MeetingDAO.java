package com.toast.schedule.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.toast.schedule.dto.MeetingDTO;

@Mapper
public interface MeetingDAO {
	
	//회의실 가기(회의실 이름+idx)
	List<Map<String, Object>> meetingGo();

	//회의실 정보보기
	Map<String, Object> meetingDetail(int room_idx);

	//회의 일정 추가
	int addMeeting(MeetingDTO dto);

	//회의 일정 보기
	List<MeetingDTO> getMeeting(int room_idx);

	//회의 일정 수정
	int updateMeeting(MeetingDTO dto);

}
